import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkobook_test_app/controller/play_controller.dart';
import 'package:record/record.dart';

class VoiceRecordPage extends StatelessWidget {
  VoiceRecordPage() {
    Get.put(
        PlayController(onChangeRecordState: onChangeRecord, isNeedTime: true));
  }

  void onChangeRecord(RecordState state) {
    switch (state) {
      case RecordState.record:
        print('record');
        break;
      case RecordState.pause:
        print('pause');
        break;
      case RecordState.stop:
        print('stop');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Text(
                    '${controller.duration.inMinutes}:${controller.duration.inSeconds}'),
                ElevatedButton(
                  onPressed: () {
                    controller.audioRecord();
                  },
                  child: controller.isRecording
                      ? Icon(Icons.play_arrow)
                      : Icon(Icons.pause),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
