
class UserDataModel{

  String? name;
  String? date;
  String? email;
  String? uId;
  String? gender;
  String? height;
  String? weight;
  String? age;
  String? bmiResult;
  String? bmiStatus;
  String? bmiAdvice;

  UserDataModel({
    this.name,
    this.date,
    this.email,
    this.uId,
    this.gender,
    this.height,
    this.weight,
    this.age,
    this.bmiResult,
    this.bmiStatus,
    this.bmiAdvice,
});

  UserDataModel.fromJson(Map<String,dynamic>?json){
    name = json!['name'];
    date = json['date'];
    email = json['email'];
    uId = json['uId'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
    age = json['age'];
    bmiResult = json['bmiResult'];
    bmiStatus = json['bmiStatus'];
    bmiAdvice = json['bmiAdvice'];
  }

  Map<String,dynamic> toMap(){

    return {
      'name':name,
      'date':date,
      'email':email,
      'uId':uId,
      'gender':gender,
      'height':height,
      'weight':weight,
      'age':age,
      'bmiResult':bmiResult,
      'bmiStatus':bmiStatus,
      'bmiAdvice':bmiAdvice,
    };
  }

}