import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'pdf_api.dart';
import 'pdf_ui.dart';
import 'dart:io';

class Bcard2 extends StatefulWidget {
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

  Bcard2(
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
  _Bcard2State createState() => _Bcard2State();
}

class _Bcard2State extends State<Bcard2> {
  double h = 0.0, w = 0.0;
  double kh = 1 / 759.2727272727273;
  double kw = 1 / 392.72727272727275;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    h = size.height;
    w = size.width;
    print('height is' + h.toString() + 'width is' + w.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
        actions: [
          TextButton.icon(
              onPressed: () async {
                Widget w = resumebody();
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
      body: resumebody(),
    );
  }

  Widget resumebody() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(4*kh*h),
        padding: EdgeInsets.all(4*kh*h),
        height: 200*kh*h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: HexColor('#e7c7ae'),
          border: Border.all(color: HexColor('#bcb8b7'), width: 9*kw*w),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              introduction(widget.name, widget.mainrole),
              SizedBox(
                width: w * 0.04,
              ),
              contact(widget.address, widget.city, widget.state, widget.pincode,
                  widget.phone, widget.email, widget.website)
            ],
          )
        ]),
      ),
    );
  }

  Widget introduction(String name, String role) {
    print(widget.address.length);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30*kw*w,
          child: Divider(
            color: Colors.black,
            thickness: 2*kw*w,
          ),
        ),
        Text(
          name.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18*kh*h,
          ),
        ),
        SizedBox(
          height: h * 0.01,
        ),
        Text(
          role.toUpperCase(),
          style: TextStyle(fontSize: 15*kh*h),
        )
      ],
    );
  }

  String styleaddress(String address) {
    String addressnew = "";
    for (int i = 0; i < address.length; i++) {
      if (i % 25 != 0) {
        addressnew += address[i];
      }

      if (i % 25 == 0) {
        addressnew += '\n';
        addressnew += address[i];
      }
    }
    return addressnew;
  }

  Widget contact(String address, String city, String state, String pincode,
      String phone, String email, String website) {
    String combined = city + ' , ' + state + ' , ' + pincode;
    if (address.length > 25) {
      address = styleaddress(address);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          address,
          style: TextStyle(fontSize: 12*kh*h),
        ),
        Text(
          combined,
          style: TextStyle(fontSize: 12*kh*h),
        ),
        Container(
          width: 10,
          child: Divider(
            color: Colors.black,
            thickness: 2*kh*h,
          ),
        ),
        Text(
          phone,
          style: TextStyle(fontSize: 12*kh*h),
        ),
        Text(
          email,
          style: TextStyle(fontSize: 12*kh*h),
        ),
        Container(
          width: 10,
          child: Divider(
            color: Colors.black,
            thickness: 2*kh*h,
          ),
        ),
        Text(
          website,
          style: TextStyle(fontSize: 12*kh*h),
        ),
      ],
    );
  }
}
