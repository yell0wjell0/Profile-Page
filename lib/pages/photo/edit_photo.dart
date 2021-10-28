import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_page/data/user.dart';
import 'package:provider/provider.dart';

class EditPhoto extends StatefulWidget {
  @override
  _EditPhotoState createState() => _EditPhotoState();
}

class _EditPhotoState extends State<EditPhoto> {
  static const String _title = '  EDIT PROFILE PICTURE';

  Future pickImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;

      context.read<User>().profileImage = File(image.path);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title, style: Theme.of(context).textTheme.headline2),
        leading: BackButton(
          color: Colors.blueAccent,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Consumer<User>(
            builder: (context, user, child) {
              return user.profileImage != null
                  ? Image.file(user.profileImage!,
                      height: 520, width: 520, fit: BoxFit.cover)
                  : Image.asset(user.imagePath,
                      height: 520, width: 520, fit: BoxFit.cover);
            },
          ),
          SizedBox(height: 50),
          buildViewGallaryButton(context),
          SizedBox(height: 10),
          buildSaveButton(context),
        ],
      ),
    );
  }

  Widget buildSaveButton(BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.blueAccent,
          side: BorderSide(width: 3.0, color: Colors.blueAccent),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('SAVE', style: Theme.of(context).textTheme.bodyText2),
      ),
    );
  }

  Widget buildViewGallaryButton(BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.blueAccent,
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: () => pickImage(ImageSource.gallery),
        child:
            Text('VIEW GALLARY', style: Theme.of(context).textTheme.headline3),
      ),
    );
  }
}
