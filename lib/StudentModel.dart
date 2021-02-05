class StudentModel{
  final int page;
  final int per_page;
  final int total;

  StudentModel({this.page, this.per_page, this.total});

  factory StudentModel.fromJson(final json){
    return StudentModel(
        page: json["page"],
        per_page: json["per_page"],
        total: json["total"]
    );
  }
}