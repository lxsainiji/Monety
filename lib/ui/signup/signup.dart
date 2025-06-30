import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monety/data/local/Models/user_model.dart';
import 'package:monety/ui/login/login.dart';
import 'package:monety/ui/signup/bloc/user_bloc.dart';
import 'package:monety/ui/signup/bloc/user_event.dart';
import 'package:monety/ui/signup/bloc/user_state.dart';

class SignUp extends StatelessWidget{
  bool isLoading =false;
  TextEditingController usernameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController mobNoController=TextEditingController();
  TextEditingController passController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5,color: Colors.black54),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Icon(Icons.chevron_left_outlined,size: 35,),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text("Welcome back! Glad to see you, Again!",style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 25,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadiusDirectional.circular(10),
                    ),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text("Username"),
                          labelStyle: TextStyle(
                              color: Colors.black
                          ),
                          hintText: "Enter you Username",
                          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10)
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadiusDirectional.circular(10),
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text("Email"),
                          labelStyle: TextStyle(
                              color: Colors.black
                          ),
                          hintText: "Enter you Email",
                          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10)
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadiusDirectional.circular(10),
                    ),
                    child: TextField(
                      controller: mobNoController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text("Mobile No."),
                          labelStyle: TextStyle(
                              color: Colors.black
                          ),
                          hintText: "Enter you Password",
                          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10)
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadiusDirectional.circular(10),
                    ),
                    child: TextField(
                      controller: passController,
                      // obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text("Password"),
                          // suffixIcon: IconButton(icon: Icon(Icons.visibility), onPressed: () {},),
                          labelStyle: TextStyle(
                              color: Colors.black
                          ),
                          hintText: "Enter your Password",
                          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10)
                      ),
                    ),
                  ),
                  // SizedBox(height: 8,),
                  SizedBox(height: 20,),
                  BlocConsumer<UserBloc,UserState>(
                    listener: (context,state){
                      if(state is UserLoadingState){
                        isLoading=true;
                      }
                      else if(state is UserSuccessState){
                        isLoading=false;
                        ScaffoldMessenger(child: SnackBar(content: Text("Successfully SingUp")),);
                      }
                      else if(state is UserErrorState){
                        isLoading=false;
                        ScaffoldMessenger(child: SnackBar(content: Text("${state.error}")),);
                      }
                    },
                    builder: (context,state) {
                      return InkWell(
                        onTap: (){
                          UserModel user =UserModel(
                              userName: usernameController.text,
                              email: emailController.text,
                              mobileNo: mobNoController.text,
                              password: passController.text
                          );
                          context.read<UserBloc>().add(RegisterEvent(mUser: user));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: isLoading ?
                                Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                  CircularProgressIndicator(color: Colors.white),
                                  SizedBox(width: 10,),
                                  Text("Registering...",style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500
                                  ),)
                                ],):
                            Text("Register",textAlign: TextAlign.center,style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                            ),),
                          ),
                      );
                    }
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(flex: 7,child: Container(
                        decoration: BoxDecoration(
                            border: Border.symmetric(horizontal: BorderSide(color: Colors.grey.shade600,width: 0.4))
                        ),
                      )),
                      Expanded(flex: 6,child: Text("Or Register with",textAlign: TextAlign.center,style: TextStyle(
                        color: Colors.black,
                      ),)),
                      Expanded(flex: 7,child: Container(
                        decoration: BoxDecoration(
                            border: Border.symmetric(horizontal: BorderSide(color: Colors.grey.shade600,width: 0.4))
                        ),
                      )),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300,width: 1),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child:Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiXN9xSEe8unzPBEQOeAKXd9Q55efGHGB9BA&s",height: 40,),
                      )),
                      SizedBox(width: 25,),
                      Expanded(child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300,width: 1),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child:Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Google_Favicon_2025.svg/250px-Google_Favicon_2025.svg.png",height: 35,),
                      )),
                      SizedBox(width: 25,),
                      Expanded(child: Container(
                        padding: EdgeInsets.symmetric(vertical: 11),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300,width: 1),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child:Image.network("https://help.apple.com/assets/67E1D466D1A1E142910B49DB/67E1D46AE03ADF0486097DE7/en_GB/cfef5ce601689564e0a39b4773f20815.png",height: 35,),
                      )),
                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",style: TextStyle(
                        fontSize: 18
                    ),),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
                          return Login();
                        }));
                      },
                      child: Text("Login now",style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue.shade600,
                          fontWeight: FontWeight.w500
                      ),),
                    )
                  ],
                ),
              ),
            )
          ]
      ),
    );
  }
}
