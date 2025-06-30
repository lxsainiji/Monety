import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monety/ui/home/home.dart';
import 'package:monety/ui/signup/bloc/user_bloc.dart';
import 'package:monety/ui/signup/bloc/user_event.dart';
import 'package:monety/ui/signup/bloc/user_state.dart';
import 'package:monety/ui/signup/signup.dart';

class Login extends StatefulWidget{
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  bool mObscure = true;

  TextEditingController emailController=TextEditingController();

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
                SizedBox(height: 35,),
                Image.network("https://wealthelite.in/website/dist/img/broker-login-img.webp",height: 220,),
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
                    controller: passController,
                    obscureText: mObscure,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        label: Text("Password"),
                        suffixIcon: IconButton(icon: Icon(mObscure ? Icons.visibility_off : Icons.visibility), onPressed: () {
                            setState(() {
                              mObscure =!mObscure;
                            });
                        },),
                        labelStyle: TextStyle(
                            color: Colors.black
                        ),
                        hintText: "Enter you Password",
                        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10)
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Align(
                  alignment:Alignment.centerRight,
                  child: Text("Forget Password?",style: TextStyle(
                      fontSize: 17
                  ),),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: BlocConsumer<UserBloc,UserState>(
                    listener: (context,state){
                      if(state is UserLoadingState){
                        isLoading = true;
                      }
                      else if(state is UserSuccessState){
                        isLoading = false;
                        ScaffoldMessenger(child: SnackBar(content: Text("SuccessFully Login"),backgroundColor: Colors.green.shade500,),);
                      }
                      else if(state is UserErrorState){
                        isLoading = false;
                        ScaffoldMessenger(child: SnackBar(content: Text("${state.error}"),backgroundColor: Colors.red.shade500,),);
                      }
                    },
                    builder: (context,state) {
                      return InkWell(
                        onTap: (){
                          context.read<UserBloc>().add(AuthenticateEvent(email:emailController.text,password:passController.text));
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomePage()));
                      },
                        child: isLoading ?
                        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                          CircularProgressIndicator(color: Colors.white),
                          SizedBox(width: 10,),
                          Text("Login...",style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),)
                        ],):
                        Text("Login",textAlign: TextAlign.center,style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),),
                      );
                    }
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(flex: 7,child: Container(
                      decoration: BoxDecoration(
                          border: Border.symmetric(horizontal: BorderSide(color: Colors.grey.shade600,width: 0.4))
                      ),
                    )),
                    Expanded(flex: 5,child: Text("Or Login with",textAlign: TextAlign.center,style: TextStyle(
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
                  Text("I don't have an account? ",style: TextStyle(
                    fontSize: 18
                  ),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_){
                        return SignUp();
                      }));
                    },
                    child: Text("Register now",style: TextStyle(
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