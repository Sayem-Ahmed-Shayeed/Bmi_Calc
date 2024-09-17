import 'package:flutter/material.dart';
import 'package:untitled1/bmi_widget.dart';
import 'package:untitled1/switch_page.dart';

class CurrPage extends StatefulWidget {
  const CurrPage({super.key});

  @override
  State<CurrPage> createState() => _CurrPageState();
}

class _CurrPageState extends State<CurrPage> {
  Widget? screenWidget;

  @override
  void initState() {
    screenWidget = BmiWidget(switchPage: switchPage);
    super.initState();
  }

  void onRestart() {
    setState(() {
      screenWidget = BmiWidget(switchPage: switchPage);
    });
  }

  void switchPage(String recommendations, String statuses, double bmis) {
    setState(() {
      screenWidget = SwitchPage(
          onRestart: onRestart,
          recommendation: recommendations,
          status: statuses,
          bmi: bmis);
    });
  }

  @override
  Widget build(BuildContext context) {
    return screenWidget!;
  }
}
