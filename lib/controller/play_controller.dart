import 'dart:async';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class PlayController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final player = AudioPlayer();
  final record = Record();
  Ticker? _ticker;
  Duration duration = Duration.zero;
  bool isRecording = false;
  StreamSubscription<RecordState>? listener;
  Function(RecordState)? onChangeRecordState;
  // Function(Duration)? onChangeTime;
  bool isNeedTime;
  String? audioPath;

  PlayController({this.onChangeRecordState, this.isNeedTime = false}) {
    setRecordListener();
    initTicker();
  }

  @override
  void dispose() {
    listener?.cancel();
    super.dispose();
  }

  void setRecordListener() {
    final stream = record.onStateChanged();
    stream.listen(onChangeRecordState, onDone: () => print('done'));
  }

  void initTicker() {
    if (isNeedTime) {
      _ticker = createTicker(onChangeTime);
    }
  }

  void onChangeTime(Duration newDuration) {
    duration = newDuration;
  }

  void audioRecord() async {
    if (await record.hasPermission()) {
      isRecording ? stop() : start();
    } else {
      print('Has not Permission');
    }
  }

  void start() async {
    final directory = await getApplicationDocumentsDirectory();
    await record.start(path: directory.path);
    _ticker?.start();
    isRecording = true;
  }

  void stop() {
    record.stop();
    _ticker?.stop();
    isRecording = false;
  }

  void cancel() async {
    duration = Duration.zero;
  }
}
