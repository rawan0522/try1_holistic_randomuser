class RegistrationModel{
  bool status;
  String message;
  RegistrationModel({required this.message , required this.status});

  factory RegistrationModel.fromjson(Map<String , dynamic>json){
    return RegistrationModel(status: json['status'] , message: json['message']);
  }
}