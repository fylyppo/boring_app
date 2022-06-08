import 'package:bloc/bloc.dart';
import 'package:boring_app/domain/notes/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:boring_app/domain/notes/i_note_repository.dart';
import '../../../domain/notes/note.dart';
import '../../../domain/notes/note_failure.dart';
import '../../../presentation/notes/note_form/misc/todo_item_presentation_classes.dart';

part 'note_form_bloc.freezed.dart';
part 'note_form_event.dart';
part 'note_form_state.dart';

@injectable
class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  final INoteRepository noteRepository;

  NoteFormBloc(
    this.noteRepository,
  ) : super(NoteFormState.initial()) {
    on<_Initialized>((event, emit) {
      emit(event.initialNoteOption.fold(() => state,
          (initialNote) => state.copyWith(note: initialNote, isEditing: true)));
    });
    on<_BodyChanged>((event, emit) {
      emit(state.copyWith(
        note: state.note.copyWith(body: NoteBody(event.bodyStr)),
        saveFailureOrSuccessOption: none(),
      ));
    });
    on<_ColorChanged>((event, emit) {
      emit(state.copyWith(
        note: state.note.copyWith(color: NoteColor(event.color)),
        saveFailureOrSuccessOption: none(),
      ));
    });
    on<_TodosChanged>((event, emit) {
      emit(state.copyWith(
        note: state.note.copyWith(
            todos:
                List3(event.todos.map((primitives) => primitives.toDomain()))),
        saveFailureOrSuccessOption: none(),
      ));
    });
    on<_Saved>((event, emit) async {
      Either<NoteFailure, Unit>? failureOrSuccess;

      emit(state.copyWith(
        isSaving: true,
        saveFailureOrSuccessOption: none(),
      ));

      if (state.note.failureOption.isNone()) {
        failureOrSuccess = state.isEditing
            ? await noteRepository.update(state.note)
            : await noteRepository.create(state.note);
      }
      emit(state.copyWith(
        isSaving: false,
        showErrorMessages: AutovalidateMode.always,
        saveFailureOrSuccessOption: optionOf(failureOrSuccess),
      ));
    });
  }
}
