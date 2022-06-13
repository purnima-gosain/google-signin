import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_signin/model/users_detail.dart';

class LoginController with ChangeNotifier {
  //object
  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  UserDetails? userDetails;

  //google login
  googleLogin() async {
    this.googleSignInAccount = await _googleSignIn.signIn();

    //inserting values to our user details model
    this.userDetails = UserDetails(
        displayName: this.googleSignInAccount!.displayName,
        email: this.googleSignInAccount!.email,
        photoUrl: this.googleSignInAccount!.photoUrl);
    notifyListeners();
  }

  logout() async {
    this.googleSignInAccount = await _googleSignIn.signOut();
    userDetails = null;
    notifyListeners();
  }
}
