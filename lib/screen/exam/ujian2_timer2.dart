import 'dart:async';
import 'package:flutter/material.dart';
import 'package:segak/screen/exam/ujian2.dart';
import 'package:segak/component/exam_widget/ujian_widget.dart';

class Ujian2TimerNadi extends StatefulWidget {
  @override
  _Ujian2TimerNadiState createState() => _Ujian2TimerNadiState();
}

final double _headerHeight = 250;

class _Ujian2TimerNadiState extends State<Ujian2TimerNadi> {
  static const maxMinutes = 60;
  int minutes = maxMinutes;
  Timer? timer;
  String donenaik = 'Mula';

  void resetTimer() => minutes = maxMinutes;

  void startTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    timer = Timer.periodic(Duration(milliseconds: 50), (_) {
      if (minutes > 0) {
        setState(() => minutes--);
      } else {
        stopTimer(reset: false);

        setState(() => donenaik = 'Seterusnya');
      }
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }

    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green[900],
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              'Denyutan Nadi',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Text(
                  'Mengira Denyutan Nadi Selama 1 Minit!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              buildTimer(),
              const SizedBox(height: 80),
              buildButtons(),
            ],
          ),
        ),
      );

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = minutes == maxMinutes || minutes == 0;

    return isRunning || !isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonTimerUjian(
                text: isRunning ? 'Berhenti' : 'Sambung',
                onClicked: () {
                  if (isRunning) {
                    stopTimer(reset: false);
                  } else {
                    startTimer(reset: false);
                  }
                },
              ),
              const SizedBox(width: 12),
              ButtonTimerUjian(
                text: 'Batal',
                onClicked: () {
                  stopTimer();
                },
              ),
            ],
          )
        : ButtonTimerUjian(
            text: donenaik,
            onClicked: () {
              if (donenaik == "Mula") {
                startTimer();
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Ujian2Naik(),
                  ),
                );
              }
            },
          );
  }

  Widget buildTimer() => SizedBox(
        width: 200,
        height: 200,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: 1 - minutes / maxMinutes,
              valueColor: AlwaysStoppedAnimation(Colors.grey),
              strokeWidth: 12,
              backgroundColor: Colors.green,
            ),
            Center(child: buildTime()),
          ],
        ),
      );

  Widget buildTime() {
    if (minutes == 0) {
      return Icon(Icons.done, color: Colors.green, size: 112);
    } else {
      return Text(
        '$minutes',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.green,
          fontSize: 80,
        ),
      );
    }
  }
}
