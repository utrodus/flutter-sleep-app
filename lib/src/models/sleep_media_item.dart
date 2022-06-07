class SleepMediaItem {
  final String title;
  final SleepMediaCategory category;
  final String duration;
  final String imgUrl;
  final String description;
  final String mediaUrl;
  final String totalFavorite;
  final String totalListening;
  SleepMediaItem({
    required this.title,
    required this.category,
    required this.duration,
    required this.imgUrl,
    required this.description,
    required this.mediaUrl,
    required this.totalFavorite,
    required this.totalListening,
  });
}

class SleepMediaCategory {
  late int id;
  late String name;
  SleepMediaCategory({
    required this.id,
    required this.name,
  });
}

List<SleepMediaItem> sleepMediaList = [
  SleepMediaItem(
    title: 'Sleep',
    category: SleepMediaCategory(
      id: 1,
      name: 'Sleep',
    ),
    duration: "",
    imgUrl: "",
    description: "",
    mediaUrl: "",
    totalFavorite: "",
    totalListening: "",
  ),
];
