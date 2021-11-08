import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdf_viewer/src/utils/constant.dart';
import 'package:dio/dio.dart';
class ApiService{
  Dio dio = Dio();
  Future get(_url) async {
    // print('${MyConstant.localBaseURL}$_url');
    var apiData = await http.get(Uri.parse('${MyConstant.localBaseURL}$_url'));
    return(apiData.body);
  }
  Future <bool> downloadAndSaveInStorage(String _url,String dirPath)async {
    try {
      await dio.download(_url, dirPath,onReceiveProgress: (rec,total){
        // print("${((rec/total)*100)} %");
      });
      return true;
    }catch (e) {
      return false ;
    }
  }
}
Future <List<Directory>?> getExternalStoragePath() async{
  return getExternalStorageDirectories(type: StorageDirectory.documents);
}
