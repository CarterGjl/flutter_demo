class CoursePriceInfoEntity {
    List<PriceLessonInfo> lessons;
    String price;
    int ramainApplyNum;

    CoursePriceInfoEntity({this.lessons, this.price, this.ramainApplyNum});

    factory CoursePriceInfoEntity.fromJson(Map<String, dynamic> json) {
        return CoursePriceInfoEntity(
            lessons: json['lessons'] != null ? (json['lessons'] as List).map((i) => PriceLessonInfo.fromJson(i)).toList() : null,
            price: json['price'],
            ramainApplyNum: json['ramainApplyNum'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['price'] = this.price;
        data['ramainApplyNum'] = this.ramainApplyNum;
        if (this.lessons != null) {
            data['lessons'] = this.lessons.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class PriceLessonInfo {
    int endTime;
    String id;
    String name;
    int startTime;

    PriceLessonInfo({this.endTime, this.id, this.name, this.startTime});

    factory PriceLessonInfo.fromJson(Map<String, dynamic> json) {
        return PriceLessonInfo(
            endTime: json['endTime'],
            id: json['id'],
            name: json['name'],
            startTime: json['startTime'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['endTime'] = this.endTime;
        data['id'] = this.id;
        data['name'] = this.name;
        data['startTime'] = this.startTime;
        return data;
    }
}