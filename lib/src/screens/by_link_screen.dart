import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:pdf_viewer/src/services/api_service.dart';
import 'package:path_provider/path_provider.dart';
import 'pdf_view_screen.dart';
import 'dart:io';
class ByLink extends StatelessWidget {
  const ByLink({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pdfUrl = '';
    String pdfPath = '';
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                keyboardType: TextInputType.text,
                onFieldSubmitted: (value) async{
                  pdfUrl = value;
                  bool _validURL = Uri.parse("http://africau.edu/images/default/sample.pdf").isAbsolute;
                  if(_validURL){
                    final dirList = await getExternalStoragePath();
                    final path = dirList![0].path;
                    final file = File("$path/filename.pdf");
                    bool data = await ApiService().downloadAndSaveInStorage(pdfUrl,file.path);
                    if(data){
                      pdfPath = file.path;
                      Navigator.of(context).push(MaterialPageRoute(builder: (contaxt)=> PDFViewScreen(type: "fromStorage", filepath: pdfPath, url: pdfUrl)));
                      return;
                    }else{
                      CoolAlert.show(
                         context: context,
                         type: CoolAlertType.error,
                         text: "Invalid URL",
                      );
                    }
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Paste your PDF Link Here",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value){
                  pdfUrl = value;
                },
              )
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                minimumSize: const Size(200, 50),
              ),
              onPressed: ()async {
                bool _validURL = Uri.parse("http://africau.edu/images/default/sample.pdf").isAbsolute;
                if(_validURL){
                  final dirList = await getExternalStoragePath();
                  final path = dirList![0].path;
                  final file = File("$path/filename.pdf");
                  bool data = await ApiService().downloadAndSaveInStorage(pdfUrl,file.path);
                  if(data){
                    pdfPath = file.path;
                    Navigator.of(context).push(MaterialPageRoute(builder: (contaxt)=> PDFViewScreen(type: "fromStorage", filepath: pdfPath, url: pdfUrl)));
                    return;
                  }else{
                    CoolAlert.show(
                       context: context,
                       type: CoolAlertType.error,
                       text: "Invalid URL",
                    );
                  }
                }
              },
              child: const Text("from Link"),
            ),
          ],
        )
    );
  }
}
Future <List<Directory>?> getExternalStoragePath() async{
  return getExternalStorageDirectories(type: StorageDirectory.documents);
}
