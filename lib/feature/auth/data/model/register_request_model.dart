


class RegisterRequestModelModel{
  String name;
  String email;
  String password;
  String confirmPassword;

  RegisterRequestModelModel({ required this.name,required this.email, required this.password,
      required this.confirmPassword});
  ToMap(){
    return {
      "name": name,
      "email":email,
      "password":password,
      "confirmPassword":confirmPassword,
    };
  }


}