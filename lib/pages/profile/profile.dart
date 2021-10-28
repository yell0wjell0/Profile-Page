import 'package:flutter/material.dart';
import 'package:profile_page/data/user.dart';
import 'package:provider/provider.dart';
import 'profile_text.dart';
import 'profile_photo.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 40),
          Text('Edit Profile',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1),
          SizedBox(height: 30),
          Consumer<User>(
            builder: (context, user, child) {
              return ProfilePhoto(profileImage: user.profileImage);
            },
          ),
          SizedBox(height: 30),
          Consumer<User>(
            builder: (context, user, child) {
              return ProfileText(
                  title: 'Name',
                  body: user.name,
                  route: '/Name',
                  vertical: 60.0);
            },
          ),
          SizedBox(height: 20),
          Consumer<User>(
            builder: (context, user, child) {
              return ProfileText(
                  title: 'Phone',
                  body: user.phone,
                  route: '/Phone',
                  vertical: 60.0);
            },
          ),
          SizedBox(height: 20),
          Consumer<User>(
            builder: (context, user, child) {
              return ProfileText(
                  title: 'Email',
                  body: user.email,
                  route: '/Email',
                  vertical: 60.0);
            },
          ),
          SizedBox(height: 20),
          Consumer<User>(
            builder: (context, user, child) {
              return ProfileText(
                  title: 'About',
                  body: user.about,
                  route: '/About',
                  vertical: 120.0);
            },
          ),
        ],
      ),
    );
  }
}
