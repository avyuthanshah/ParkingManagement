import 'package:flutter/material.dart';
import 'main.dart';
import 'package:anprproject/ParkingLotCard.dart';

final colors = <Color>[
  Color(0xff000000),
  Color(0xff0F1112),
  Color(0xff111417),
  Color(0xff222930),
  Color(0xff2D3640)
];

final scaffoldBackground = LinearGradient(colors: colors);

final drawerTextStyle =TextStyle(
    color: Color(0xffFFFFFF),
);


class LoggedInPage extends StatefulWidget {
  late String  userName;
  LoggedInPage({required this.userName});

  @override
  _LoggedInPageState createState() => _LoggedInPageState();
}

class _LoggedInPageState extends State<LoggedInPage> {
  late String greeting;

  void getGrreeting(){
    final time = DateTime.now().hour;
    print(time);
    if (time>=0 && time <= 11 ){
      greeting = 'Good morning';
    }
    if (time > 11 && time <=16 ){
      greeting = 'Good afternoon';
    }
    if (time >16 && time < 20){
      greeting = 'Good evening';
    }
    if (time>=20 && time <=23) {
      greeting ='Good night';
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGrreeting();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      drawer: widget.userName!='Geust'?Drawer(

        child: Container(
          color: Color(0xff232526),
          child: Padding(
            padding:  EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width*0.015,
                MediaQuery.of(context).size.height*0.1,
                MediaQuery.of(context).size.width*0.02,
                MediaQuery.of(context).size.height*0.03
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                extededTextInDrawer(textToInsert: 'balance : Rs 500',),
                extededTextInDrawer(textToInsert: 'Vehicle number: BAA 7691'),
                extededTextInDrawer(textToInsert: 'owner :'+widget.userName),
                extededTextInDrawer(textToInsert: 'blood group :')
                
              ],
            ),
          ),
        ),
      ):Drawer(
        child: Container(
          color: Color(0xff232526),
          child: Center(
            child: InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height*0.1,
                width: MediaQuery.of(context).size.width*0.6,
                decoration: BoxDecoration(
                  color: Color(0xff4DE16E),
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.05)
                ),

                child: Center(child:Text(
                  'Sign-in / Register',style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height*0.03
                ),
                ),)
              ),
              onTap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MyHomePage()), (route) => false);
              },
            ),
          ),
        ),
      ),
      appBar: widget.userName!='Geust'?AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MyHomePage()), (route) => false);
          }, icon: Icon(Icons.cancel ))
        ],

        backgroundColor: Color(0xff000000),
        leading: Builder(
          builder: (context)=> IconButton(
              onPressed: ()=>Scaffold.of(context).openDrawer(),
              icon: ImageIcon(AssetImage("icons/Vector.png")
              )
          ),
        ),
      ):AppBar(
        backgroundColor: Color(0xff000000),
      ),

      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: scaffoldBackground
          ),
          child: Center(

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.025),
                  child: Text(greeting,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width*0.1
                  ),
                  ),
                ),
                  Text("  "+widget.userName,style: TextStyle(
                    color: Color(0xff818181),
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width*0.065
                  ),),
                  Padding(padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.025, 0, MediaQuery.of(context).size.height*0.025),
                  child:Text(
                    '  Avilable Parkings',
                    style: TextStyle(
                      color: Color(0xff818181),
                      fontSize: MediaQuery.of(context).size.width*0.04
                    ),
                  )
                  ),

                  extendedParkingLot(parkingName: 'Parking Area 1 ',userName: widget.userName,location: 'Gatthaghar,bhaktapur', capacity: 10, occupancy: 2,number: 0,),
                extendedParkingLot(parkingName: 'parking area 2', userName: widget.userName,location: 'Kaushaltar,bhaktapur', number: 1, capacity: 200, occupancy: 120),
                extendedParkingLot(parkingName: 'Parking Area 3', userName: widget.userName,location: 'Durbarmarg,kathmandu', number: 2, capacity: 100, occupancy: 20)
              ],
            ),
          ),
        ),
      ),

    );
  }
}



class extededTextInDrawer extends StatelessWidget {

  late String textToInsert;
  extededTextInDrawer({required this.textToInsert});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0, 
          MediaQuery.of(context).size.height*0.0025,
          0,
          MediaQuery.of(context).size.height*0.025),
      child: Text(textToInsert,style: TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: MediaQuery.of(context).size.height*0.025,
          fontWeight: FontWeight.bold
      ),),
    );
  }
}

