import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: Dimensions.kPaddingAllMedium,
        child: Column(
          children: [
            const HomeAttendanceStatusWidget(),
            Dimensions.kVerticalSpaceSmall,
            const HomeServiceWidget(),
          ],
        ),
      ),
    );
  }
}
