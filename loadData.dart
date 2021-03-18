class LoadData {
  final String title;
  final int userId;

  LoadData({this.title, this.userId});

  factory LoadData.fromJson(Map<String, dynamic> json) {
    return LoadData(
      title: json['title'],
      userId: json['userId'],
    );
  }
}
