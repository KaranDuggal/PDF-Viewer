import 'package:http/http.dart' as http;
import 'package:pdf_viewer/src/utils/constant.dart';
class ApiService{
  get(_url) async {
    // print('${MyConstant.localBaseURL}$_url');
    var apiData = await http.get(Uri.parse('${MyConstant.localBaseURL}$_url'));
    return(apiData.body);
  }

}