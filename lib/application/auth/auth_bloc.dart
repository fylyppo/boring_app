import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(const _Initial()) {
    var stream = _authFacade.getSignedInUser();
    on<_AuthCheckRequested>((event, emit) async {
      await emit.forEach(stream, onData: ((Option<User> userOption) {
        return userOption.fold(
          () => const AuthState.unauthenticated(),
            (a) => const AuthState.authenticated());
      }));
      // emit(userOption.fold(
      //     () => const AuthState.unauthenticated(),
      //     (_) => const AuthState.authenticated()));
    });
    on<_SignedOut>((event, emit) async {
      await _authFacade.signOut();
      emit(const AuthState.unauthenticated());
    });
  }
}
