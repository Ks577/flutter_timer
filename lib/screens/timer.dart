import 'package:flutter/material.dart';
import 'package:pie_timer/pie_timer.dart';

class PieWidget extends StatefulWidget {
  const PieWidget({super.key});

  @override
  State<PieWidget> createState() => _PieWidgetState();
}

class _PieWidgetState extends State<PieWidget>
    with SingleTickerProviderStateMixin {
  late PieAnimationController _pieAnimationController;

  @override
  void initState() {
    super.initState();
    _pieAnimationController = PieAnimationController(vsync: this);
  }

  @override
  void dispose() {
    _pieAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PieTimer(
              pieAnimationController: _pieAnimationController,
              duration: const Duration(seconds: 5),
              radius: 150,
              fillColor: Colors.white,
              pieColor: Colors.pink,
              borderColor: Colors.grey.shade800,
              borderWidth: 10,
              shadowColor: Colors.grey.shade800,
              shadowElevation: 15.0,
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              isReverse: false,
              onCompleted: () => {},
              onDismissed: () => {},
              enableTouchControls: true,
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.pause),
                  onPressed: () {
                    _pieAnimationController.stopAnim?.call();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.play_arrow),
                  onPressed: () {
                    _pieAnimationController.startAnim?.call();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.replay),
                  onPressed: () {
                    _pieAnimationController.resetAnim?.call();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
