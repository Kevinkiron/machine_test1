import 'package:flutter/material.dart';

import '../../../../utils/kstyles.dart';

class Meals extends StatelessWidget {
  const Meals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Kstyles().bold(
            text: "Meals",
            size: 17,
          )),
        ],
      ),
    );
  }
}
