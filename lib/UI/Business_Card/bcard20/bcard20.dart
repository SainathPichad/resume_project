
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'pdf_api.dart';
import 'pdf_ui.dart';
class Bcard20 extends StatefulWidget {

  String name;
  String email;
  String mainrole;
  String phone;
  String website;
  String company;
  String address;
  String city;
  String state;
  String pincode;

  Bcard20(
      {Key? key,
        required this.name,
        required this.mainrole,
        required this.email,
        required this.phone,
        required this.website,
        required this.company,
        required this.address,
        required this.city,
        required this.state,
        required this.pincode})
      : super(key: key);

  @override
  _Bcard20State createState() => _Bcard20State();
}

class _Bcard20State extends State<Bcard20> {
  double h = 0.0, w = 0.0;
  double kh = 1 / 759.2727272727273;
  double kw = 1 / 392.72727272727275;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    h = size.height;
    w = size.width;
    return Scaffold(
     appBar: AppBar(
          title: Text('Hello'),
          actions: [
            TextButton.icon(
                onPressed: () async {
                  final pdfFile = await generate(
                    759.27,
                    392.72,
                    widget.name,
                    widget.email,
                    widget.phone,
                    widget.mainrole,
                    widget.address,
                    widget.city,
                    widget.state,
                    widget.pincode,
                    widget.company,
                  ); //required This generates a file and stores in pdfFile
                  // invoice here represents the values which we have to show

                  PdfApi.openFile(pdfFile);
                },
                icon: Icon(
                  Icons.picture_as_pdf,
                  color: Colors.white,
                ),
                label: Text(
                  'Generate',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            
              border: Border.all(
                  color: Colors.black,
                width: 0.1
              )
          ),
          margin: EdgeInsets.symmetric(horizontal: 5*kw*w,vertical: 150*kh*h),
          height: 280*kh*h,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 130*kh*h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffF7F7F7)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end ,

                  children: [
                    SizedBox(
                      height: 20*kh*h,
                    ),
                    Text(widget.name,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25*kh*h

                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(widget.mainrole),
                        Container(
                          margin: EdgeInsets.only(left: 4),
                          height: 5*kh*h,
                          color: Colors.red,
                          width: 30*kw*w,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 75*kh*h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xffda8527)
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.company,style: TextStyle(
                        color: CupertinoColors.white,

                      ),),
                      Icon(CupertinoIcons.location,color: Colors.white,),

                      Text(widget.address,style: TextStyle(
                        color: CupertinoColors.white,

                      ),),

                    ],
                  ),
                ),

              ),

          Expanded(
            child: Container(

              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                      Container(
                        child: Column(
                          children: [
                            Icon(
                              CupertinoIcons.phone,
                              color:Color(0xffda8527),
                            ),
                            Text(widget.phone,
                              style: TextStyle(
                                color: Colors.white,

                              ),)
                          ],
                        ),
                      ),


                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Icon(
                                MdiIcons.email,
                                color:Color(0xffda8527),
                              ),
                              Text(widget.email,
                                style: TextStyle(
                                  color: Colors.white,

                                ),)
                            ],
                          ),
                        ),


                      ],
                    )
                  ],
                ),
              ),
            ),
          )
            ],
          ),
        ),
      ),
    );
  }
}
