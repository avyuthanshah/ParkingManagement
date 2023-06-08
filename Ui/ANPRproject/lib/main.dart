import 'package:anprproject/loggedInPage.dart';
import 'package:flutter/material.dart';
import 'package:gradients/gradients.dart';
import 'Register.dart';
final colors = <Color>[
  Color(0xff000000),
  Color(0xff0F1112),
  Color(0xff111417),
  Color(0xff222930),
  Color(0xff2D3640)
];

final colours2= [
  Color(0xff232526),
  Color(0xff414345)
];

final backgroundColours = LinearGradient(colors: colors);
final cardBackground =LinearGradient(colors: colours2);


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      /*theme: ThemeData(

        primarySwatch: Colors.blue,
      ),*/
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late String userName;
  late String password;
  bool seePassword = false;
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: backgroundColours
          ),

         child: Center(
           child: SingleChildScrollView(
             child: Container(
               height: MediaQuery.of(context).size.height*0.77,
               width: MediaQuery.of(context).size.width*0.75,
               decoration: BoxDecoration(
                 gradient: cardBackground,
                 borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.05)
               ),
               child: Center(
                 child: Column(

                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Align(
                       alignment: Alignment.topLeft,
                       child: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.025),
                       child: Text('Log-In',style: TextStyle(
                         color: Colors.white,
                         fontSize: MediaQuery.of(context).size.height*0.06
                       ),),),
                     ),
                     Container(
                       width: MediaQuery.of(context).size.width*0.5,
                       height: MediaQuery.of(context).size.height*0.15,

                       child: Center(

                         child: TextField(
                           textAlign: TextAlign.center,
                           style: TextStyle(color: Colors.white),
                           textAlignVertical: TextAlignVertical.center,
                           decoration: InputDecoration(
                             //label: Center(child:Text('username',style: drawerTextStyle,))
                             hintText: 'username/e-mail'
                           ),
                           onChanged: (val){
                             setState(() {
                               userName=val;
                             });

                           },
                         ),
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                       child: Container(
                         width: MediaQuery.of(context).size.width*0.5,
                         height: MediaQuery.of(context).size.height*0.15,
                         child: Center(
                           child: TextField(
                             style: TextStyle(color: Colors.white),
                             textAlign: TextAlign.center,

                             textAlignVertical: TextAlignVertical.center,

                             obscureText: !seePassword,
                             decoration: InputDecoration(
                                 fillColor: Colors.white,
                               //label: Center(child: Text('password',style: drawerTextStyle,),),
                               hintText: 'password',

                               suffixIcon: IconButton(
                                 icon: seePassword==false? Icon(Icons.lock,color: seePassword==false?Color(0xff232526):Color(0xff414345),):Icon(Icons.lock_open),
                                 onPressed: (){
                                   setState(() {
                                     seePassword=!seePassword;
                                   });
                                 }
                               )
                             ),
                             onChanged: (val){
                               password=val;
                             },
                           ),
                         ),
                       ),
                     ),
                     InkWell(
                         onTap: (){
                           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoggedInPage(userName: userName)), (route) => false);

                         },
                         child: Container(
                           width: MediaQuery.of(context).size.width*0.25,
                           height: MediaQuery.of(context).size.height*0.06,
                           decoration: BoxDecoration(
                             color: Color(0xff4DE16E),
                             borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.035)
                           ),
                           child: Center(child: Text('Log-in',style: TextStyle(
                             fontSize: MediaQuery.of(context).size.height*0.03,
                             color: Colors.white

                           ),)),
                         )
                     ),
                     Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.005,
                     ),
                     child: InkWell(
                       onTap: (){

                       },
                       child: Text('Forget your password?',
                       style: TextStyle(
                         color: Color(
                           0xffBEBEBE
                         )
                       ),),
                     ),),

                     Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.005,
                     ),
                       child: InkWell(
                         onTap: (){
                           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoggedInPage(userName: 'Geust')), (route) => false);
                         },
                         child: Text('Continue as geust',
                           style: TextStyle(
                               color: Color(
                                   0xffBEBEBE
                               )
                           ),),
                       ),),
                     Padding(
                       padding:  EdgeInsets.all(MediaQuery.of(context).size.height*0.005),
                       child: InkWell(
                           onTap: (){
                             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>RegisterPage()), (route) => false);

                           },

                             child: Center(child: Text('Register',style: TextStyle(
                                 fontSize: MediaQuery.of(context).size.height*0.03,
                                 color: Colors.white

                             ),)),

                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
         ),
        ),
      );
  }
}
