class DataModel {
  int category;
  int live_watchers;
  String channel_name;
  String channel_description;

  DataModel({this.category, this.live_watchers, this.channel_name, this.channel_description});

  DataModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    live_watchers = json['live_watchers'];
    channel_name = json['channel_name'];
    channel_description = json['channel_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['live_watchers'] = this.live_watchers;
    data['channel_name'] = this.channel_name;
    data['channel_description'] = this.channel_description;
    return data;
  }
}
