import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pomodoro_timer/tools/utils.dart';

enum TimerStatus {
  running,
  paused,
  stopped,
  resting,
}

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  static const WORK_SECONDS = 25; // * 60
  static const REST_SECONDS = 5; // * 60

  late TimerStatus _timerStatus;
  late int _timer;
  late int _pomodoroCount;

  @override
  void initState() {
    super.initState();
    _timerStatus = TimerStatus.stopped;
    print(_timerStatus.toString());
    _timer = WORK_SECONDS;
    _pomodoroCount = 0;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _runningButtons = [
      ElevatedButton(
        onPressed: _timerStatus == TimerStatus.paused ? resume : pause,
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
        ),
        child: Text(
          _timerStatus == TimerStatus.paused ? '계속하기' : '일시정지',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(20),
      ),
      ElevatedButton(
        onPressed: stop,
        style: ElevatedButton.styleFrom(
          primary: Colors.grey,
        ),
        child: const Text(
          '포기하기',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    ];

    final List<Widget> _stoppedButtons = [
      ElevatedButton(
        onPressed: run,
        style: ElevatedButton.styleFrom(
          primary:
              _timerStatus == TimerStatus.resting ? Colors.green : Colors.blue,
        ),
        child: const Text(
          '시작하기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('뽀모도로 타이머'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _timerStatus == TimerStatus.resting
                  ? Colors.green
                  : Colors.blue,
            ),
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Center(
              child: Text(
                secondsToString(_timer),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _timerStatus == TimerStatus.resting
                ? const []
                : _timerStatus == TimerStatus.stopped
                    ? _stoppedButtons
                    : _runningButtons,
          ),
        ],
      ),
    );
  }

  void runTimer() async {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      switch (_timerStatus) {
        case TimerStatus.paused:
          t.cancel();
          break;
        case TimerStatus.stopped:
          t.cancel();
          break;
        case TimerStatus.running:
          if (_timer <= 0) {
            showToast('작업 완료!');
            rest();
          } else {
            setState(() {
              _timer -= 1;
            });
          }
          break;
        case TimerStatus.resting:
          if (_timer <= 0) {
            setState(() {
              _pomodoroCount += 1;
            });
            showToast('오늘 $_pomodoroCount개의 뽀모도로를 달성했습니다.');
            t.cancel();
            stop();
          } else {
            setState(() {
              _timer -= 1;
            });
          }
          break;
        default:
          break;
      }
    });
  }

  void run() {
    setState(() {
      _timerStatus = TimerStatus.running;
      print('[=>] ' + _timerStatus.toString());
      runTimer();
    });
  }

  void rest() {
    setState(() {
      _timer = REST_SECONDS;
      _timerStatus = TimerStatus.resting;
      print('[=>] ' + _timerStatus.toString());
    });
  }

  void pause() {
    setState(() {
      _timerStatus = TimerStatus.paused;
      print('[=>] ' + _timerStatus.toString());
    });
  }

  void resume() {
    run();
  }

  void stop() {
    setState(() {
      _timer = WORK_SECONDS;
      _timerStatus = TimerStatus.stopped;
      print('[=>] ' + _timerStatus.toString());
    });
  }
}
