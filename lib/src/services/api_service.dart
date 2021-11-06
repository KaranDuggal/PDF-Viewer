import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:kbc_game/src/utils/constant.dart';
class ApiService{
  get(_url) async {
    // print('${MyConstant.localBaseURL}$_url');
    var apiData = await http.get(Uri.parse('${MyConstant.localBaseURL}$_url'));
    return(apiData.body);
  }

}
class GoogleSignInApi{
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login()=> _googleSignIn.signIn();
}
