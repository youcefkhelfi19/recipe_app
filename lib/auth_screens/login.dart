import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/circle_button.dart';
import 'package:recipe_app/widgets/custom_button.dart';
import 'package:recipe_app/widgets/custom_text_field.dart';
import 'package:recipe_app/widgets/password_text_field.dart';

import 'register.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin
{
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  FocusNode passwordNode = FocusNode();
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 40));
    _animation =
    CurvedAnimation(parent: _animationController, curve: Curves.linear)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reset();
          _animationController.forward();
        }
      });
    _animationController.forward();
    super.initState();
  }
  @override
  void dispose() {
     _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
            'https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
            placeholder: (context, url) => Image.network(
              'https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
              fit: BoxFit.cover,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.cover,
            height: screenHeight,
            width: screenWidth,
            alignment: FractionalOffset(_animation.value, 0),
          ),
             Container(
               height: screenHeight,
               width: screenWidth,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Container(
                     alignment: Alignment.center,
                     child: AutoSizeText('Login',
                        style: TextStyle(color: Colors.white60,
                        fontSize: 60.0,fontWeight: FontWeight.bold
                        ),
                     ),
                   ),
                   Container(
                     padding: EdgeInsets.symmetric(vertical: 30.0,horizontal: 10.0),
                    margin: EdgeInsets.all(20.0),
                     height:screenHeight*0.35,
                     width: screenWidth,
                     decoration: BoxDecoration(
                         color:Colors.white60,
                         borderRadius:BorderRadius.circular(20.0)
                     ),
                     child: Form(
                       key: _formKey,
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           CustomTextField(
                             textValueController: emailTextController,
                             onEditComplete: () => FocusScope.of(context).requestFocus(passwordNode),
                             hint: 'Email',
                             valueKey: 'email',
                             icon: Icon(Icons.email,color: Colors.brown,),
                             onValidate: (value) {
                               if (value.isEmpty || !value.contains('@')) {
                                 return 'Please enter a valid email address';
                               }
                               return null;
                             },

                           ),
                           PasswordTextField(
                             node:passwordNode ,
                             textValueController: passwordTextController ,
                             onValidate: (value) {
                               if (value.isEmpty || value.length < 7) {
                                 return 'Please enter a valid Password';
                               }
                               return null;
                             },
                           ),

                           Align(
                             alignment: Alignment.topRight,
                             child: TextButton(
                               onPressed: (){

                               },
                               child: AutoSizeText('Forget password ?',
                                 style: TextStyle(
                                     color: Colors.black54,
                                     fontSize: 18.0
                                 ),
                               ),
                             ),
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,

                             children: [
                               TextButton(
                                 onPressed:(){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                                 },
                                 child: AutoSizeText(
                                   'Register Now ',
                                   style: TextStyle(color: Colors.brown,
                                       fontSize: 16.0
                                   ),

                                 ),),
                               CustomButton(
                                   height: screenHeight*0.05,
                                   width: screenWidth*0.4,
                                   text: 'Login',
                                   onPressed: (){

                                   }
                               ),

                             ],
                           ),
                         ],
                       ),
                     ),
                   ),
                   Container(
                     padding: EdgeInsets.symmetric(horizontal: 20.0),
                     alignment: Alignment.center,
                     child: Column(
                       children: [

                         Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Expanded(child: Divider(color: Colors.brown,)),
                             AutoSizeText('OR',
                             style: TextStyle(color: Colors.brown,
                             fontSize: 30.0,

                             ),
                             ),
                             Expanded(child: Divider(color: Colors.brown,))
                           ],
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             CircleButton(
                               height: screenHeight*0.07,
                               width: screenWidth*0.2,
                               image: 'images/fb.png',
                               onPressed: (){

                               },
                             ),

                             CircleButton(
                               height: screenHeight*0.07,
                               width: screenWidth*0.2,
                               image: 'images/gg.png',
                               onPressed: (){

                               },
                             )
                           ],
                         )
                       ],
                     ),
                   )
                 ],
               ),
             )
        ],
      ),
    );
  }
}
