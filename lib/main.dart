import 'package:flutter/material.dart';
import 'package:flutter_movieapi/view/home_view.dart';

import 'locator.dart';

void main() {
  DependencyInjection();
  runApp(MaterialApp( home: HomeView()));
}

