import 'package:boring_app/domain/auth/user.dart';
import 'package:boring_app/domain/auth/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'auth_failure.dart';

abstract class IAuthFacade {
  Stream<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}