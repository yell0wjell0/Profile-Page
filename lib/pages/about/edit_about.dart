import 'package:flutter/material.dart';
import 'package:profile_page/data/user.dart';
import 'package:provider/provider.dart';

class EditAbout extends StatefulWidget {
  @override
  _EditAboutState createState() => _EditAboutState();
}

class _EditAboutState extends State<EditAbout> {
  static const String _title = 'Tell us about yourself';
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        children: [
          buildTextBox(context, 'I love long walks on the beach...'),
          SizedBox(height: 200),
          buildSaveButton(context),
        ],
      ),
    );
  }

  Widget buildTextBox(BuildContext contex, String hText) {
    return Column(
      children: [
        SizedBox(height: 100),
        Text(_title, style: Theme.of(context).textTheme.headline2),
        TextField(
          controller: controller,
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontFamily: 'Montserrat'),
          decoration: InputDecoration(
            hintText: hText,
            hintStyle: TextStyle(fontSize: 18.0, color: Colors.grey),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget buildSaveButton(BuildContext context) {
    return Container(
      width: 500,
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
          context.read<User>().about = controller.text;
          Navigator.pop(context);
        },
        child: Text('SAVE', style: Theme.of(context).textTheme.bodyText2),
      ),
    );
  }
}
