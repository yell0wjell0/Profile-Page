import 'dart:io';

import 'package:flutter/material.dart';
import 'package:profile_page/data/user.dart';
import 'package:provider/provider.dart';

class ProfilePhoto extends StatelessWidget {
  final File? profileImage;

  const ProfilePhoto({
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(context),
          Positioned(
            bottom: 0,
            right: 3.5,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    final image;
    if (profileImage != null) {
      image = FileImage(profileImage!);
    } else {
      image = AssetImage(context.read<User>().imagePath);
    }

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 138,
          height: 138,
          child: InkWell(onTap: () => Navigator.pushNamed(context, '/Photo')),
        ),
      ),
    );
  }

  Widget buildSquare({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          padding: EdgeInsets.all(all),
          color: Colors.blueAccent,
          child: child,
        ),
      );

  Widget buildEditIcon(Color color) => buildSquare(
        color: color,
        all: 8.5,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 23,
        ),
      );
}
