/// Load Dummy Media Data

import 'dart:convert';

import 'package:sleep/src/models/sleep_media_model.dart';
import 'package:sleep/src/utils/prefs_data.dart';

import '../models/sleep_media_source.dart';

Future<List<SleepMediaItem>> getMediaDatas({int? categoryId}) {
  return Future.delayed(const Duration(seconds: 1), () {
    List<SleepMediaItem> filteredMedia = [];
    if (categoryId != null) {
      /// category 1 = Stories
      /// category 2 = Music
      /// category 3 = Anxious
      /// category 4 = My
      ///
      if (categoryId == 1) {
        filteredMedia = sleepMediaDataSource
            .where((item) => item.category!.id == 1)
            .toList();
        return filteredMedia;
      } else if (categoryId == 2) {
        filteredMedia = sleepMediaDataSource
            .where((item) => item.category!.id == 2)
            .toList();
        return filteredMedia;
      } else if (categoryId == 3) {
        var storyList = sleepMediaDataSource
            .where((item) => item.category!.id == 1)
            .toList()
            .getRange(0, 4);
        var musicList = sleepMediaDataSource
            .where((item) => item.category!.id == 2)
            .toList()
            .getRange(0, 4);
        filteredMedia.addAll(storyList);
        filteredMedia.addAll(musicList);
        return filteredMedia;
      } else if (categoryId == 4) {
        List<String> tempData = [];
        var data = PrefsData.getData('datas');
        data.then((value) {
          /// if data not empty
          if (value != null) {
            if (value != []) {
              tempData = value;
              for (var data in tempData) {
                /// assign items data
                filteredMedia.add(SleepMediaItem.fromJson(json.decode(data)));
              }
            }
          }
        });

        return filteredMedia;
      }
    }
    return sleepMediaDataSource;
  });
}
