import 'package:flutter/material.dart';
import 'package:ilk_flutter_projem/ana_sayfa.dart';

void main() {
  runApp(AnaUygulama());
}

class AnaUygulama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnaSayfa(),
    );
  }
}

