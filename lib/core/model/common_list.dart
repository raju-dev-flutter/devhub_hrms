class CommonList {
  int? id;
  String? name;

  CommonList({this.id, this.name});

  CommonList.fromJson(Map<String, dynamic> json) {
    if (json['leave_type'] != null) {
      id = json['leave_type_id'];
      name = json['leave_type'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
