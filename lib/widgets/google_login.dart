import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged.map((FirebaseUser user) => user);
  }

  Future<FirebaseUser> signInWithGoogle() async {
    // hold the instance of the authenticated user
    FirebaseUser user;
    // flag to check whether we're signed in already

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    // get the credentials to (access / id token)
    // to sign in via Firebase Authentication
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    user = (await _auth.signInWithCredential(credential)).user;

    return user;
  }

  Future<void> signOut() async{
        _auth.signOut();
  }
}
