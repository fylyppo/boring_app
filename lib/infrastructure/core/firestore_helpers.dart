import 'package:boring_app/domain/auth/i_auth_facade.dart';
import 'package:boring_app/injection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../domain/auth/user.dart';
import '../../domain/core/errors.dart';

extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    Option<User> userOption;
    userOption = await getIt<IAuthFacade>().getSignedInUser().first;
    // getIt<IAuthFacade>().getSignedInUser().listen((option) {
    //   userOption = option;
    // });
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return FirebaseFirestore.instance.collection('users').doc(user.id.getOrCrash());
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get noteCollection => collection('notes');
}