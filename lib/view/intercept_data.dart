class InterceptData {
    List<String> data;
    int code = 0;

    InterceptData({this.data, this.code});

    factory InterceptData.fromJson(Map<String, dynamic> json) {
        return InterceptData(
            data: json['data'] != null ? new List<String>.from(json['data']) : null,
            code: json['code'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['code'] = this.code;
        if (this.data != null) {
            data['data'] = this.data;
        }
        return data;
    }
}