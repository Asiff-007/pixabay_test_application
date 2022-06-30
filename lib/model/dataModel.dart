class DataModel{
  int? id;
  String? pageUrl;
  String? largeUrl;

  DataModel({this.id,this.pageUrl,this.largeUrl});

  factory DataModel.fromJson(Map<String,dynamic> json){
    return DataModel(
      id: json['id'],
      pageUrl: json['pageURL'],
      largeUrl:json['largeImageURL']
    );
  }
  
}