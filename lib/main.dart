import 'package:flutter/material.dart';
import 'package:flutter_movieapi/view/Home_Page.dart';

import 'locator.dart';

void main() {
  DependencyInjection();
  runApp(MaterialApp( home: Home()));
}

