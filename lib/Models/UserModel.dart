class UserModel  {
List <dynamic> results;
UserModel({required this.results});

factory UserModel.fromjson(Map<String , dynamic> json){
   List<dynamic> fullData;
  fullData = json['results'].map(
          (users) {
        return {
          "Name": users["name"]["first"] + " " + users["name"]["last"],
          "Email": users["email"],
          //"timezone": users["timezone"]['description'],
          "img": users["picture"]["thumbnail"]
        };
      }
  ).toList();
  return UserModel(results: fullData);
}
}
