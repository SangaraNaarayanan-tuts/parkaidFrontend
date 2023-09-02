import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class googleLogin {
  Future<UserCredential?> gmailLogin() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    // If user canceled the sign-in process, return null.
    var userId = gUser?.email;
    if (gUser == null) {
      return  null;
    }
    final GoogleSignInAuthentication gAuth = await gUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    UserCredential userDetails =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return null;
  }
}
