/// Load Dummy Media Data

import 'package:sleep/src/models/sleep_media_model.dart';

import '../models/sleep_media_source.dart';

Future<List<SleepMediaItem>> getMediaDatas({int? categoryId}) {
  return Future.delayed(const Duration(seconds: 1), () {
    List<SleepMediaItem> filteredMedia = [];
    if (categoryId != null) {
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
        var storyList = sleepMediaDataSource
            .where((item) => item.category!.id == 1)
            .toList()
            .getRange(0, 2);
        var musicList = sleepMediaDataSource
            .where((item) => item.category!.id == 2)
            .toList()
            .getRange(0, 2);
        filteredMedia.addAll(storyList);
        filteredMedia.addAll(musicList);
        return filteredMedia;
      }
    }
    return sleepMediaDataSource;
  });
}
