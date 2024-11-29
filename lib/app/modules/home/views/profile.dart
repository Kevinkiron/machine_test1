import 'package:flutter/material.dart';

import '../../../../utils/kstyles.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Kstyles().bold(
            text: "Profile",
            size: 17,
          )),
        ],
      ),
    );
  }
}
