import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfirbase/data/storge_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          // child: ElevatedButton(
          //     onPressed: () async {
          //       XFile? xFile  = await ImagePicker().pickImage(source: ImageSource.gallery);
          //      String url = await StorgeHelper.storgeHelper.uploadImage(File(xFile!.path));
          //      log(url);
          //
          //     },
              child: Text('Home')
          // ),
        ),
      ),
    );
  }
}
