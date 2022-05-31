import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:boring_app/domain/notes/i_note_repository.dart';
import '../../../domain/notes/note.dart';
import '../../../domain/notes/note_failure.dart';

part 'note_actor_bloc.freezed.dart';
part 'note_actor_event.dart';
part 'note_actor_state.dart';

class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  final INoteRepository noteRepository;
  
  NoteActorBloc(
    this.noteRepository,
  ) : super(const _Initial()) {
    on<NoteActorEvent>((event, emit) async {
      emit(const NoteActorState.actionInProgress());
      final possibleFailure = await noteRepository.delete(event.note);
      possibleFailure.fold((f) => emit(NoteActorState.deleteFailure(f)), (r) => emit(const NoteActorState.deleteSuccess()));
    });
  }
}
