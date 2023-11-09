import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitPulse(
      size: 50,
      color: Colors.blue,
    );
  }
}

class LoadingMoreWidget extends StatelessWidget {
  const LoadingMoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitPulse(
      size: 30,
      color: Colors.blue,
    );
  }
}
