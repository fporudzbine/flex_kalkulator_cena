import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppFooter extends StatefulWidget {
  const CustomAppFooter({Key? key}) : super(key: key);

  @override
  State<CustomAppFooter> createState() => _CustomAppFooterState();
}

class _CustomAppFooterState extends State<CustomAppFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 350,
      color: Color(0xffc0ad93),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.only(top: 50),
              width: MediaQuery.of(context).size.width*0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 250,
                        height: 80,
                        child: Image.asset('assets/images/flex_logo.png'),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(left: 75.0),
                        child: Row(
                          children: [
                            Container(
                                width: 30,
                                height: 30,
                                child: Image.asset('assets/images/location_icon.png')),
                            SizedBox(width: 10),
                            Text("Beograd", style: TextStyle(fontSize: 12, color: Colors.white),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 75.0),
                        child: Row(
                          children: [
                            Container(
                                width: 30,
                                height: 30,
                                child: Image.asset('assets/images/email_icon.png')),
                            SizedBox(width: 10),
                            Text("office@flex-kurir.rs", style: TextStyle(fontSize: 12, color: Colors.white),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 75.0),
                        child: Row(
                          children: [
                            Container(
                                width: 30,
                                height: 30,
                                child: Image.asset('assets/images/telephone_icon.png')),
                            SizedBox(width: 10),
                            Text("(+381) 11 624.29.59", style: TextStyle(fontSize: 12, color: Colors.white),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 100),
                  VerticalDivider(
                    color: Colors.white,
                    width: 1,
                    thickness: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Usluge",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 20,),
                        Text("Dostava Beograd", style: TextStyle(fontSize: 12, color: Colors.white),),
                        SizedBox(height: 20,),
                        Text("Dostava za danas", style: TextStyle(fontSize: 12, color: Colors.white),),
                        SizedBox(height: 20,),
                        Text("Dostava za sutra", style: TextStyle(fontSize: 12, color: Colors.white),),
                        SizedBox(height: 20,),
                        Text("B2C dostava", style: TextStyle(fontSize: 12, color: Colors.white),),
                        SizedBox(height: 20,),
                        Text("B2B Dostava", style: TextStyle(fontSize: 12, color: Colors.white),),
                      ],
                    ),
                  ),
                  Expanded(child: Container(),),
                  VerticalDivider(
                    color: Colors.white,
                    width: 1,
                    thickness: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Korisne informacije",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 20,),
                        Text("Najcesca pitanja", style: TextStyle(fontSize: 12, color: Colors.white),),
                        SizedBox(height: 20,),
                        Text("Cenovnik", style: TextStyle(fontSize: 12, color: Colors.white),),
                        SizedBox(height: 20,),
                        Text("Uslovi koriscenja", style: TextStyle(fontSize: 12, color: Colors.white),),
                        SizedBox(height: 20,),
                        Text("Zakazi kurira", style: TextStyle(fontSize: 12, color: Colors.white),),
                      ],
                    ),
                  ),
                  Expanded(child: Container(),),
                  VerticalDivider(
                    color: Colors.white,
                    width: 1,
                    thickness: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "KONTAKTIRAJTE NAS!",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 20,),
                        Text("Tu smo za sva vasa pitanja", style: TextStyle(fontSize: 12, color: Colors.white),),
                        SizedBox(height: 30,),
                        Container(
                            color: Colors.red,
                            width: 144,
                            height: 35,
                            child: Center(child: Text("KONTAKT", style: TextStyle(fontSize: 14, color: Colors.white),))),
                        SizedBox(height: 40),
                        Text("Zaprati nas!", style: TextStyle(fontSize: 14, color: Colors.white),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Container(),),
          Divider(color: Colors.white, height: 1),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width*0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("© Copyright 2022 Flex kurirska služba, sva prava zadržana. Design By Marketing iz garaže", style: TextStyle(color: Colors.red, fontSize: 10),),
                Expanded(child: Container()),
                Text('Politika privatnosti', style: TextStyle(color: Colors.white, fontSize: 10),),
                SizedBox(width: 80,),
                Text("O nama", style: TextStyle(color: Colors.white, fontSize: 10),),
                SizedBox(width: 80,),
                Text('Kontakt', style: TextStyle(color: Colors.white, fontSize: 10),),
                SizedBox(width: 80,),
                Text('Novosti', style: TextStyle(color: Colors.white, fontSize: 10),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
