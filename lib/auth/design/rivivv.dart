import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveData extends StatefulWidget {
  const RiveData({super.key});

  @override
  State<RiveData> createState() => _RiveDataState();
}

class _RiveDataState extends State<RiveData> {
  @override
  Widget build(BuildContext context) {
    return RiveAnimation.network(
      'https://cdn.rive.app/animations/vehicles.riv',
    );
  }
}
