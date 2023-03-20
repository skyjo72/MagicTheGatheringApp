import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 1, child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        Navigator.pop(context);
                      },
                      child: const Icon(size: 30, Icons.arrow_back, color: Colors.white),
                    )),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: const [
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: FittedBox(
                                    fit: BoxFit.fitHeight,
                                    child: Text('Settings',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  )),
                            ))
                      ],
                    ))
              ],
            )),
            Expanded(flex: 7, child: Placeholder()),
          ],
        ),
      ),
    );
  }
}
