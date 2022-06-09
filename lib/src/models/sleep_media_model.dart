class SleepMediaItem {
  String? title;
  String? duration;
  String? imgUrl;
  String? description;
  String? mediaUrl;
  String? totalFavorite;
  String? totalListening;
  bool? isFavorited;
  SleepMediaCategory? category;

  SleepMediaItem({
    required this.title,
    required this.category,
    required this.duration,
    required this.imgUrl,
    required this.description,
    required this.mediaUrl,
    required this.totalFavorite,
    required this.totalListening,
    required this.isFavorited,
  });

  SleepMediaItem.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    duration = json["duration"];
    imgUrl = json["imgUrl"];
    description = json["description"];
    mediaUrl = json["mediaUrl"];
    totalFavorite = json["totalFavorite"];
    totalListening = json["totalListening"];
    isFavorited = json["isFavorited"];
    category = json["category"] == null
        ? null
        : SleepMediaCategory.fromJson(json["category"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["title"] = title;
    data["duration"] = duration;
    data["imgUrl"] = imgUrl;
    data["description"] = description;
    data["mediaUrl"] = mediaUrl;
    data["totalFavorite"] = totalFavorite;
    data["totalListening"] = totalListening;
    data["isFavorited"] = isFavorited;
    data["category"] = category!.toJson();
    return data;
  }
}

class SleepMediaCategory {
  late int id;
  late String name;
  SleepMediaCategory({
    required this.id,
    required this.name,
  });
  SleepMediaCategory.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    return data;
  }
}
