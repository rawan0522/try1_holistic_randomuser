import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try1_holistic_randomuser/Providers/RegistrationProvider.dart';
import 'package:try1_holistic_randomuser/Screens/Login.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final formkey = GlobalKey<FormState>();
  TextEditingController email1 = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationProvider>(context , listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Page",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ),),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: formkey,
          child: Container(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                TextFormField(
                  controller: name,
                  validator: (value) {
                    if(value == null || value!.isEmpty ){
                      return "Required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      label: Text("Name"),
                      suffixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),SizedBox(height: 10,),
                TextFormField(
                  controller: email1,
                  validator: (value) {
                    if(value == null || value!.isEmpty ){
                      return "Required";
                    }
                    if(!value.endsWith("@gmail.com")){
                      return "Must end with @gmail.com";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      label: Text("Email"),
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),SizedBox(height: 10,),
                TextFormField(
                  controller: password1,
                  validator: (value) {
                    if(value == null ||value!.isEmpty){
                      return "Required";
                    }
                    if(value.length <4){
                      return "Password must be greater than 4";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      label: Text("Password"),
                      suffixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),SizedBox(height: 10,),
                TextFormField(
                  controller: phone,
                  validator: (value) {
                    if(value == null ||value!.isEmpty){
                      return "Required";
                    }
                    if(!RegExp(r'^\d{10,15}$').hasMatch(value)){
                      return "Enter valid phone {10 , 15}";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      label: Text("Phone"),
                      suffixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),SizedBox(height: 10,),

                MaterialButton(onPressed: ()async {
                  if(formkey.currentState!.validate()){
                    await provider.signup(email: email1.text, password: password1.text , name: name.text , phone: phone.text );
                    if(provider.registrationModel?.status == true){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(provider.registrationModel!.message,),
                        ),
                      );
                    }else{
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(provider.registrationModel!.message) )
                      );
                    }
                  }
                },child:Text("Sign up",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),) ,
                  color: Colors.yellow,
                ),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                }, child: Text("Login",style: TextStyle(fontSize: 18),),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
