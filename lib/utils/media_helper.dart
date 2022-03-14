import 'package:flutter/material.dart';

class Mhelper {
  Size getSize(BuildContext context) => MediaQuery.of(context).size;
}

final mHelper = Mhelper();
