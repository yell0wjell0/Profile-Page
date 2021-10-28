import 'package:flutter/material.dart';

class ProfileText extends StatelessWidget {
  final String title;
  final String body;
  final String route;
  final double vertical;

  const ProfileText({
    required this.title,
    required this.body,
    required this.route,
    required this.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildRRectangle(context),
          Container(
            padding: const EdgeInsets.fromLTRB(15.0, 4.0, 25.0, 4.0),
            child: Text(title, style: Theme.of(context).textTheme.headline2),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15.0, 32.0, 25.0, 4.0),
            child: Text(body, style: Theme.of(context).textTheme.bodyText1),
          ),
          Container(
            height: vertical,
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.more_vert, color: Colors.grey[800], size: 27),
            ),
          ),
          buildRRectangleButton(context, route),
        ],
      ),
    );
  }

  Widget buildRRectangle(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Material(
          child: Ink(
            height: vertical,
            width: 500,
            color: Colors.grey[900],
          ),
        ),
      );

  Widget buildRRectangleButton(BuildContext context, String routeName) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            height: vertical,
            width: 500,
            color: Colors.transparent,
            child:
                InkWell(onTap: () => Navigator.pushNamed(context, routeName)),
          ),
        ),
      );
}
