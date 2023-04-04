

// import 'dart:html';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pdf_tutorial/pdf_viewer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<File?> pickFiles() async{
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false,
      );
      if (result != null){
        return File(result.paths.first ?? '');
      }else{
        return null;
      }
  }

  void openPdf({required BuildContext context,required File file,String? url}){
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => PdfViewerPage(
            file : file,
            url: '',
          ),),
    );
  }

 FilePickerResult? result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pdf demo'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: ()  async {
                  result = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowMultiple: true,
                    allowedExtensions: ['pdf','jpg','docx','png'],
                  );
                  if (result != null ){
                    setState(() {});
                  }
                  return;
                  // final file = await pickFiles();
                  //
                  // if (file != null ){
                  //   openPdf(context: context,file: file);
                  // }

                },
                child: const Text('Upload pdf'),
              ),
              const SizedBox(
                height: 20,
              ),

              if (result != null)
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Selected file : ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: result?.files.length ?? 0,
                        itemBuilder: (BuildContext context,int ind) {
                          return InkWell(
                            onTap: () async {
                              debugPrint(result!.files[ind].name);
                              debugPrint(result!.files[ind].path);
                              debugPrint(result!.files[ind].extension);
                              debugPrint(result!.files[ind].size.toString());

                              if(result!.files[ind].extension == 'pdf'){
                                showDialog(context: context, builder: (BuildContext context){
                                  return PDFView(
                                        filePath: result!.files[ind].path,
                                        enableSwipe: true,
                                        // swipeHorizontal: false,
                                        autoSpacing: false,
                                        pageFling: false,

                                        onError: (error) {
                                          debugPrint(error.toString());
                                        },
                                        onPageError: (page, error) {
                                          debugPrint('$page: ${error.toString()}');
                                        },

                                      );
                                });
                              }else if(result!.files[ind].extension =='jpg' || result!.files[ind].extension == 'png'){
                                showDialog(context: context, builder: (BuildContext context){
                                  return Image.file(File(result!.files[ind].path.toString()));
                                });
                              }
                            },
                            child: Text(
                              result?.files[ind].name ?? '',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int ind) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}