import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
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
                            child: Text('Magic the Dictionary',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                )),
                          )),
                    ))
              ],
            )),
        Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                HapticFeedback.mediumImpact();
              },
              child: const Icon(size: 40, Icons.format_size, color: Colors.white),
            )),
        Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                HapticFeedback.mediumImpact();
              },
              child: const Icon(size: 40, Icons.settings, color: Colors.white),
            ))
      ],
    );
  }
}
