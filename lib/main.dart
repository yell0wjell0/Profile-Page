import 'package:flutter/material.dart';
import 'package:profile_page/data/user.dart';
import 'package:provider/provider.dart';
import 'app.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => User(),
        child: App(),
      ),
    );
