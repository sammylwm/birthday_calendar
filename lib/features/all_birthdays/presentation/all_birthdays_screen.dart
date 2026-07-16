import 'package:flutter/material.dart';
import 'widgets/app_bar.dart';
import 'widgets/body.dart';

class AllBirthdaysScreen extends StatelessWidget {
  const AllBirthdaysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Body(),
        ),
      ),
    );
  }
}
