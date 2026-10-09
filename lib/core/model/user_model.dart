
class UseModel {
    int? userId;
    int? id;
    String? title;

    UseModel({this.userId, this.id, this.title});

    UseModel.fromJson(Map<String, dynamic> json) {
        if(json["userId"] is int) {
            userId = json["userId"];
        }
        if(json["id"] is int) {
            id = json["id"];
        }
        if(json["title"] is String) {
            title = json["title"];
        }
    }

    static List<UseModel> fromList(List<Map<String, dynamic>> list) {
        return list.map(UseModel.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["userId"] = userId;
        _data["id"] = id;
        _data["title"] = title;
        return _data;
    }

    UseModel copyWith({
        int? userId,
        int? id,
        String? title,
    }) => UseModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
    );
}
