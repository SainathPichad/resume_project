import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'pdf_api.dart';
import 'pdf_ui.dart';
import 'dart:io';

class Bcard5 extends StatefulWidget {
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

  Bcard5(
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
  _Bcard5State createState() => _Bcard5State();
}

class _Bcard5State extends State<Bcard5> {
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
          //padding: EdgeInsets.all(4),
          height: 400*kh*h,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2*kw*w),
              color: Colors.black),
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100*kh*h,
                width: 250*kw*w,
                color: Colors.white,
                alignment: Alignment.center,
                child: Text(
                  widget.company.toUpperCase(),
                  style:
                      TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2*kw*w),
                ),
              ),
              SizedBox(
                height: 50*kh*h,
              ),
              introduction(widget.name, widget.mainrole),
              SizedBox(
                height: 15*kh*h,
              ),
              contact(widget.address, widget.city, widget.state, widget.pincode, widget.phone, widget.email, widget.website)
            ],
          )),
    );
  }

  String stylecompany(String address) {
    String addressnew = "";
    for (int i = 0; i < address.length; i++) {
      if (i % 11 != 0) {
        addressnew += address[i];
      }

      if (i % 11 == 0) {
        addressnew += '\n';
        addressnew += address[i];
      }
    }
    return addressnew;
  }

  String stylerole(String address) {
    String addressnew = "";
    for (int i = 0; i < address.length; i++) {
      if (i % 15 != 0) {
        addressnew += address[i];
      }

      if (i % 15 == 0) {
        addressnew += '\n';
        addressnew += address[i];
      }
    }
    return addressnew;
  }

  Widget introduction(String name, String role) {
    print(widget.address.length);

    if (role.length > 15) {
      role = stylerole(role);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Text(
            name.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20*kh*h, color: Colors.white),
          ),
        ),
        SizedBox(
          height: h * 0.01,
        ),
        Container(
          child: Text(
            role.toUpperCase(),
            style: TextStyle(fontSize: 12*kh*h, color: Colors.white),
          ),
        ),
        SizedBox(
          height: h * 0.02,
        ),
        Container(
          width: 160*kw*w,
          child: Divider(
            color: Colors.grey,
            thickness: 1*kw*w,
            height: 1*kh*h,
          ),
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
    address += ' , ' + combined;
    return Container(
      height: 150*kh*h,
      width: 250*kw*w,
      color: Colors.black,
      padding: EdgeInsets.only(left: 15*kw*w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            address,
            style: TextStyle(
              fontSize: 12*kh*h,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          
          
          Text(
            phone,
            style: TextStyle(
              fontSize: 12*kh*h,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Text(
            email,
            style: TextStyle(
              fontSize: 12*kh*h,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Text(
            website,
            style: TextStyle(
              fontSize: 12*kh*h,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
