import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:pmvvm/view_model.dart';
import 'package:resfast/model/user_model.dart';

class LoginViewModel extends ViewModel {
  bool isPasswordHidden = true;
  void togglePassword() {
    if (isPasswordHidden == true) {
      isPasswordHidden = false;
    } else {
      isPasswordHidden = true;
    }
    notifyListeners();
  }

  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(credential.user);
  }

  Future<User?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(credential.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future communicate() async {
    try {
      dynamic conversationObject = {
        'appId':
            'aebc90dbdc54c9fafdf94ce9facb9976', // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
      };

      KommunicateFlutterPlugin.buildConversation(conversationObject)
          .then((clientConversationId) {
        print("Conversation builder success : " +
            clientConversationId.toString());
      }).catchError((error) {
        print("Conversation builder error : " + error.toString());
      });
    } catch (e) {}
  }
}
