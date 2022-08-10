class AppUser{

  String email;
  String? id;
  String? password;
  String userName;
  String city;
  String phone;
  AppUser({required this.email,required this.userName,required this.city,required this.phone,this.password,this.id});
  Map<String,dynamic> toMap(){
    return{
      "email":email,
      "userName":userName,
      "city":city,
      "phone":phone,
      "id":id,
    };
  }

 factory AppUser.fromeMap(Map<String,dynamic> map){
    return AppUser(
        email: map["email"] ,
        userName: map["userName"] ,
        city: map["city"] ,
        phone: map["phone"],
      id: map["id"]
    );
  }

}