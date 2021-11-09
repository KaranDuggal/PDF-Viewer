import 'dart:io';
import 'package:dio/dio.dart';
class ApiService{
  Dio dio = Dio();
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