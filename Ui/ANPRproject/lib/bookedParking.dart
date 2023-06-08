import 'package:flutter/material.dart';
import 'main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'loggedInPage.dart';
import 'package:anprproject/ParkingLotCard.dart';

class BookedParking extends StatefulWidget {
  late String location;
  late TimeOfDay time;
  BookedParking({required this.location, required this.time});
  @override
  _BookedParkingState createState() => _BookedParkingState();
}

class _BookedParkingState extends State<BookedParking> {




  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundColours,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your parkings is booked at:",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xffBEBEBE),
            ),),

            Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
            child: Container(
              decoration: BoxDecoration(
                gradient: cardBackground
              ),

            ),
            ),
            Text(widget.location,style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xffBEBEBE),
            ),),

          ],
        ),
      ),
    );
  }
}
