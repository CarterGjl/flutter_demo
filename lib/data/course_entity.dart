class CourseDetail {
  Course course;
  Enterprise enterprise;
  Teacher teacher;

  CourseDetail({this.course, this.enterprise, this.teacher});

  factory CourseDetail.fromJson(Map<String, dynamic> json) {
    return CourseDetail(
      course: json['course'] != null ? Course.fromJson(json['course']) : null,
      enterprise: json['enterprise'] != null
          ? Enterprise.fromJson(json['enterprise'])
          : null,
      teacher:
          json['teacher'] != null ? Teacher.fromJson(json['teacher']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.course != null) {
      data['course'] = this.course.toJson();
    }
    if (this.enterprise != null) {
      data['enterprise'] = this.enterprise.toJson();
    }
    if (this.teacher != null) {
      data['teacher'] = this.teacher.toJson();
    }
    return data;
  }
}

class Teacher {
  String icon;
  String id;
  String intro;
  String name;

  Teacher({this.icon, this.id, this.intro, this.name});

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      icon: json['icon'],
      id: json['id'],
      intro: json['intro'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['id'] = this.id;
    data['intro'] = this.intro;
    data['name'] = this.name;
    return data;
  }
}

class Enterprise {
  String eid;
  String ename;
  String intro;
  double score;
  String tel;
  int totalCourse;

  Enterprise(
      {this.eid,
      this.ename,
      this.intro,
      this.score,
      this.tel,
      this.totalCourse});

  factory Enterprise.fromJson(Map<String, dynamic> json) {
    return Enterprise(
      eid: json['eid'],
      ename: json['ename'],
      intro: json['intro'],
      score: json['score'],
      tel: json['tel'],
      totalCourse: json['totalCourse'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eid'] = this.eid;
    data['ename'] = this.ename;
    data['intro'] = this.intro;
    data['score'] = this.score;
    data['tel'] = this.tel;
    data['totalCourse'] = this.totalCourse;
    return data;
  }
}

class Course {
  List<Classe> classes;
  int courseType;
  String coverRid;
  List<Desp> desp;
  String id;
  List<Lesson> lessons;
  String name;
  int participants;
  double score;

  Course(
      {this.classes,
      this.courseType,
      this.coverRid,
      this.desp,
      this.id,
      this.lessons,
      this.name,
      this.participants,
      this.score});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      classes: json['classes'] != null
          ? (json['classes'] as List).map((i) => Classe.fromJson(i)).toList()
          : null,
      courseType: json['courseType'],
      coverRid: json['coverRid'],
      desp: json['desp'] != null
          ? (json['desp'] as List).map((i) => Desp.fromJson(i)).toList()
          : null,
      id: json['id'],
      lessons: json['lessons'] != null
          ? (json['lessons'] as List).map((i) => Lesson.fromJson(i)).toList()
          : null,
      name: json['name'],
      participants: json['participants'],
      score: json['score'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseType'] = this.courseType;
    data['coverRid'] = this.coverRid;
    data['id'] = this.id;
    data['name'] = this.name;
    data['participants'] = this.participants;
    data['score'] = this.score;
    if (this.classes != null) {
      data['classes'] = this.classes.map((v) => v.toJson()).toList();
    }
    if (this.desp != null) {
      data['desp'] = this.desp.map((v) => v.toJson()).toList();
    }
    if (this.lessons != null) {
      data['lessons'] = this.lessons.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Classe {
  String id;
  int index;

  Classe({this.id, this.index});

  factory Classe.fromJson(Map<String, dynamic> json) {
    return Classe(
      id: json['id'],
      index: json['index'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['index'] = this.index;
    return data;
  }
}

class Lesson {
  String id;
  String name;

  Lesson({this.id, this.name});

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Desp {
  String content;
  String type;

  Desp({this.content, this.type});

  factory Desp.fromJson(Map<String, dynamic> json) {
    return Desp(
      content: json['content'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['type'] = this.type;
    return data;
  }
}
