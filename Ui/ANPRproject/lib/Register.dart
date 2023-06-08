import 'package:flutter/material.dart';
import 'main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late String name;
  late String email;
  late String reEmail;
  late String password;
  late String rePassword;
  late String numPlate;
  bool seePassword1= false;
  bool seePassword2=false;
  bool errorEmail=false;
  bool errorPassword = false;

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
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.8,
              decoration: BoxDecoration(
                gradient: cardBackground
              ),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      height: MediaQuery.of(context).size.height*0.1,

                      child: Center(

                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            //label: Center(child:Text('username',style: drawerTextStyle,))
                              hintText: 'Full name'
                          ),
                          onChanged: (val){
                            setState(() {
                              name=val;
                            });

                          },
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      height: MediaQuery.of(context).size.height*0.1,

                      child: Center(

                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            //label: Center(child:Text('username',style: drawerTextStyle,))
                              hintText: 'e-mail'
                          ),
                          onChanged: (val){
                            setState(() {
                              email=val;
                            });

                          },
                        ),
                      ),
                    ),
                    errorEmail==true?Container(
                      child: Text('email doesnt match',style: TextStyle(color: Colors.red),),
                    ):SizedBox(),
                    Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      height: MediaQuery.of(context).size.height*0.1,

                      child: Center(

                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            //label: Center(child:Text('username',style: drawerTextStyle,))
                              hintText: 're type your e-mail'
                          ),
                          onChanged: (val){
                            setState(() {
                              reEmail=val;
                            });

                          },
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      height: MediaQuery.of(context).size.height*0.1,

                      child: Center(

                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            //label: Center(child:Text('username',style: drawerTextStyle,))
                              hintText: 'Vehicle Number Plate'
                          ),
                          onChanged: (val){
                            setState(() {
                              numPlate=val;
                            });

                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        height: MediaQuery.of(context).size.height*0.1,
                        child: Center(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,

                            textAlignVertical: TextAlignVertical.center,

                            obscureText: !seePassword1,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                //label: Center(child: Text('password',style: drawerTextStyle,),),
                                hintText: 'password',

                                suffixIcon: IconButton(
                                    icon: seePassword1==false? Icon(Icons.lock,color: seePassword1==false?Color(0xff232526):Color(0xff414345),):Icon(Icons.lock_open),
                                    onPressed: (){
                                      setState(() {
                                        seePassword1=!seePassword1;
                                      });
                                    }
                                )
                            ),
                            onChanged: (val){
                              setState(() {
                                password=val;
                              });

                            },
                          ),
                        ),
                      ),
                    ),
                    errorPassword==true?Container(
                      child: Text('password doesnt match',style: TextStyle(color: Colors.red),),
                    ):SizedBox(),
                    Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        height: MediaQuery.of(context).size.height*0.1,
                        child: Center(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,

                            textAlignVertical: TextAlignVertical.center,

                            obscureText: !seePassword2,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                //label: Center(child: Text('password',style: drawerTextStyle,),),
                                hintText: 're type password',

                                suffixIcon: IconButton(
                                    icon: seePassword2==false? Icon(Icons.lock,color: seePassword2==false?Color(0xff232526):Color(0xff414345),):Icon(Icons.lock_open),
                                    onPressed: (){
                                      setState(() {
                                        seePassword2=!seePassword2;
                                      });
                                    }
                                )
                            ),
                            onChanged: (val){
                              setState(() {
                                rePassword=val;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: (){
                          setState(() {
                            if (email!=reEmail){
                              errorEmail=true;
                            }
                            if (email==reEmail){
                              errorEmail=false;
                            }
                            if (password!=rePassword){
                              errorPassword=true;
                            }
                            if (password==rePassword){
                              errorPassword=false;
                            }
                            if (errorEmail==false && errorPassword==false){
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MyHomePage()), (route) => false);

                            }
                          });

                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.25,
                          height: MediaQuery.of(context).size.height*0.06,
                          decoration: BoxDecoration(
                              color: Color(0xff4DE16E),
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.035)
                          ),
                          child: Center(child: Text('Register',style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height*0.03,
                              color: Colors.white

                          ),)),
                        )
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
