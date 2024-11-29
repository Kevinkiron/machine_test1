import 'package:flutter/material.dart';
import 'package:machine_test/utils/kstyles.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Kstyles().bold(
            text: "More",
            size: 17,
          )),
        ],
      ),
    );
  }
}
