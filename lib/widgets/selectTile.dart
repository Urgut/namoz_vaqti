import 'package:flutter/material.dart';

class SelectTile extends StatelessWidget {
  final String title;
  final Function onTap;
  const SelectTile({Key key, this.title, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: ListTile(
        title: Text(title.toUpperCase()),
        onTap: onTap,
      ),
    );
  }
}
