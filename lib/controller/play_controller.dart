import 'dart:async';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class PlayController extends GetxController {
  final player = AudioPlayer();
  final record = Record();
  bool isRecording = false;
  Timer? itmer;
  StreamSubscription<RecordState>? listener;
  String? audioPath;

  PlayController() {
    setRecordListener();
  }

  @override
  void dispose() {
    listener?.cancel();
    super.dispose();
  }

  void setRecordListener() {
    final stream = record.onStateChanged();
    stream.listen(updateState,
        onDone: () => print('done'), onError: () => print('error'));
  }

  void updateAudioRecorder() async {
    if (await record.hasPermission()) {
      isRecording ? stop() : start();
    } else {
      print('Has not Permission');
    }
  }

  void start() async {
    final directory = await getApplicationDocumentsDirectory();
    await record.start(path: directory.path);
  }

  void stop() async {
    record.stop();
  }

  void updateState(RecordState state) {
    switch (state) {
      case RecordState.record:
        print('record');
        break;
      case RecordState.pause:
        print('pause');
        break;
      case RecordState.stop:
        print('cancel');
        break;
    }
  }
}
