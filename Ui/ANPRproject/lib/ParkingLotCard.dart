import 'package:anprproject/bookedParking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';

final colorArray =[
  Color(0xff4DE16E),
  Color(0xff2EA1BA),
  Color(0xff7D2121),
  Color(0xff770808)

];
final colorsRect = [
  Color(0xff232526),
  Color(0xff414345)
];

final linearRect = LinearGradient(colors: colorsRect);

class extendedParkingLot extends StatefulWidget {
  late String parkingName;
  late String location;
  late String userName;
  late int capacity;
  late int occupancy;
  late int number;
  extendedParkingLot({required this.parkingName,
    required this.userName,
    required this.location,
    required this.number,
    required this.capacity,
    required this.occupancy,

  });


  @override
  _extendedParkingLotState createState() => _extendedParkingLotState();
}

class _extendedParkingLotState extends State<extendedParkingLot> {
  static void navigateTo(String place) async {
    //var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
    var uri = "https://www.google.com/maps/search/?api=1&query=$place";
    if (!await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }

  TimeOfDay time = TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  @override

  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()  {
        navigateTo(widget.location);
      },
      onLongPress: (){
        widget.userName!='Geust'?setState(() {
          showDialog(context: context, builder: (context)=>AlertDialog(
            insetPadding: EdgeInsets.all(MediaQuery.of(context).size.width*0.15),
            backgroundColor:Colors.transparent ,


            content: Center(
              child: Container(
                width: MediaQuery.of(context).size.width*0.7,
                height: MediaQuery.of(context).size.height*0.4,
                color: Colors.white,
                /*decoration: BoxDecoration(
                  gradient: linearRect
                ),
*/
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Book your parking time in ${widget.location}'),

                      Padding(
                        padding:  EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
                        child: ElevatedButton(
                          onPressed: () async{

                            TimeOfDay? newTime =  await showTimePicker(context: context, initialTime: time);

                              setState(() {
                                if (newTime!=null){
                                  time=newTime;
                                }


                              });

                          },
                            child: Text('Select time')
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(onPressed: (){
                            Navigator.pop(context);
                            setState(() {
                              showDialog(context: context, builder: (context)=>AlertDialog(
                                insetPadding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width*0.1,
                                    MediaQuery.of(context).size.height*0.3,
                                    MediaQuery.of(context).size.width*0.1,
                                    MediaQuery.of(context).size.height*0.3),
                                content: Center(
                                  child:Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Booked sucessfully'),
                                        Text('your parking at ${widget.location} have been booked for ${time.hour.toString()+' : '+time.minute.toString()}'),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ElevatedButton(onPressed: (){

                                              // edit in database
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BookedParking(location: widget.location, time: time)));

                                            }, child: Text('Confirm')),
                                            ElevatedButton(onPressed: (){
                                              Navigator.pop(context);
                                            }, child: Text('cancel booking')),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ),
                              ));
                            });
                          }, child: Text('Book')),
                          ElevatedButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text('cancel'))
                        ],
                      )



                    ],
                  ),
                ),
              ),
            ),
          ),
          );
        }):(){

        };
      },
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.03),
        child: Container(
          width: MediaQuery.of(context).size.width*0.7,
          height: MediaQuery.of(context).size.height*0.3,
          decoration: BoxDecoration(
              gradient: linearRect,
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.03)

          ),
          child: Center(
            child: Row(
              children: [
                Container(
                  //color: Colors.white,
                  width: MediaQuery.of(context).size.width*0.5,
                  child: Padding(
                    padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.075),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(MediaQuery.of(context).size.width*0.008),
                          child: AutoSizeText(widget.parkingName,maxLines:1,style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height*0.06,
                              fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.008),
                          child: AutoSizeText(
                            widget.location,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.height*0.03,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        /*Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.008),
                          child: AutoSizeText(widget.longitude.toString()+ ' and '+widget.latitute.toString(),
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.height*0.02,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                        ),
                        */
                        Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.008),
                          child: Icon(Icons.location_on,size: MediaQuery.of(context).size.height*0.046,color: colorArray[widget.number],),)
                      ],
                    ),
                  ),

                ),
                Container(
                  //color: Colors.brown,
                  width: MediaQuery.of(context).size.width*0.2,
                )
              ],
            ),
          ),

        ),
      ),
    );
  }
}
