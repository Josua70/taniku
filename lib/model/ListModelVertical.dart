class apiVertical {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data1>? data1;
  Support? support;
  String? error;

  apiVertical(
      {this.page,
        this.perPage,
        this.total,
        this.totalPages,
        this.data1,
        this.support,
        this.error});

  apiVertical.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data1 = <Data1>[];
      json['data'].forEach((v) {
        data1!.add(new Data1.fromJson(v));
      });
    }
    support =
    json['support'] != null ? new Support.fromJson(json['support']) : null;
  }
  factory apiVertical.withError(String error) => apiVertical(error: error);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.data1 != null) {
      data['data'] = this.data1!.map((v) => v.toJson()).toList();
    }
    if (this.support != null) {
      data['support'] = this.support!.toJson();
    }
    return data;
  }
}

class Data1 {
  int? id;
  String? name;
  int? year;
  String? color;
  String? pantoneValue;

  Data1({this.id, this.name, this.year, this.color, this.pantoneValue});

  Data1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    year = json['year'];
    color = json['color'];
    pantoneValue = json['pantone_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['year'] = this.year;
    data['color'] = this.color;
    data['pantone_value'] = this.pantoneValue;
    return data;
  }
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  Support.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}