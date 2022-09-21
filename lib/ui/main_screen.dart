import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:price_calculator/ui/columns/additional_services_column.dart';
import 'package:price_calculator/ui/footer/custom_app_footer.dart';
import 'package:price_calculator/ui/widgets/custom_input_field.dart';
import 'package:price_calculator/ui/widgets/heading_container.dart';
import '../labels.dart';
import '../sum.dart';
import 'header/custom_app_header.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

    TextEditingController controllerStandardReturnReceipt = TextEditingController();
    TextEditingController controllerStandardBackDocumentation = TextEditingController();
    TextEditingController controllerStandardPaidResponse = TextEditingController();
    TextEditingController controllerStandardSMSReports = TextEditingController();
    TextEditingController controllerStandardBuyOut = TextEditingController();
    TextEditingController controllerStandardSendValue = TextEditingController();
    TextEditingController controllerStandardPersonalDelivery = TextEditingController();
    TextEditingController controllerStandardAmountRSD = TextEditingController();
    TextEditingController controllerStandardFinalAmount = TextEditingController();
    TextEditingController controllerSpecialReturnReceipt = TextEditingController();
    TextEditingController controllerSpecialBackDocumentation = TextEditingController();
    TextEditingController controllerSpecialPaidResponse = TextEditingController();
    TextEditingController controllerSpecialSMSReports = TextEditingController();
    TextEditingController controllerSpecialBuyOut = TextEditingController();
    TextEditingController controllerSpecialSendValue = TextEditingController();
    TextEditingController controllerSpecialPersonalDelivery = TextEditingController();
    TextEditingController controllerSpecialAmountRSD = TextEditingController();
    TextEditingController controllerSpecialFinalAmount = TextEditingController();
    String cutStandardRSD = '';
    String cutSpecialRSD = '';
    String cutSpecialAdditionalServicesRSD = '';
    String cutStandardAdditionalServicesRSD = '';
    double finalStandardAmountNote = 0;
    double finalSpecialAmountNote = 0;
    String startingValueStandardWeight = "";
    String startingValueStandardDelivery = "";
    String startingValueSpecialDelivery = "";
    String startingValueSpecialType = "";
    String label = '';
    bool isClicked = false;




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFF5F5F5),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // CustomAppHeader(),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Text(
                        kHeadingMessage,
                        style: TextStyle(color: Color(0xffB59F80), fontSize: 32),
                      ),
                    ),
                  ),
              MediaQuery.of(context).size.width > 950 ? Column(
                children: [
                  HeadingContainer(label: kStandardDelivery),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 177,
                        height: 19,
                        child: Text(
                          kDeliveryMass,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                      SizedBox(width: 250),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
                        child: Container(
                          width: 450,
                          height: 60,
                          padding: EdgeInsets.only(left: 8, top: 8),
                          decoration: BoxDecoration(color: Color(0xFFF9F9F9)),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 8.0, right: 8, left: 30),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: Container(color: Colors.transparent),
                              onChanged: (String? newValue) {
                                setState(() {
                                  startingValueStandardWeight = newValue!;
                                });
                              },
                              hint: startingValueStandardWeight == ""
                                  ? Text("Izaberite", style: TextStyle(fontSize: 14))
                                  : Text(startingValueStandardWeight, style: TextStyle(fontSize: 14)),
                              items: <String>[
                                '',
                                '0kg - 0.5kg',
                                '0.5kg - 1kg',
                                '1kg - 2kg',
                                '2kg - 5kg',
                                '5kg - 10kg',
                                '10kg - 15kg',
                                '15kg - 20kg',
                                '20kg - 30kg',
                                '30kg - 50kg',
                                'Preko 50kg',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 177,
                        height: 19,
                        child: Text(
                          kDelivery,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                      SizedBox(width: 250),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20, top: 15),
                        child: Container(
                          width: 450,
                          height: 60,
                          padding: EdgeInsets.only(left: 8, top: 8),
                          decoration: BoxDecoration(color: Color(0xFFF9F9F9)),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 8.0, right: 8, left: 30),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: Container(color: Colors.transparent),
                              onChanged: (String? newValue) {
                                setState(() {
                                  startingValueStandardDelivery = newValue!;
                                });
                              },
                              hint: startingValueStandardDelivery == ""
                                  ? Text("Izaberite uslugu", style: TextStyle(fontSize: 14))
                                  : Text(startingValueStandardDelivery, style: TextStyle(fontSize: 14)),
                              items: <String>['', 'Danas za danas', 'Danas za sutra do 12h', 'Danas za sutra do 18h']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  enabled: value == 'Danas za sutra do 12h' ? false : true,
                                  value: value,
                                  child: Text(
                                    value,
                                    style: value == 'Danas za sutra do 12h' ? TextStyle(color: Colors.black12) : TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 177,
                        height: 19,
                        child: Text(
                          kRSD,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                      SizedBox(width: 500),
                      CustomInputField(
                        label: kRSD,
                        controller: controllerStandardAmountRSD,
                        startingValueStandardWeight: startingValueStandardWeight,
                        startingValueStandardDelivery: startingValueStandardDelivery,
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                ],
              ) : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingContainer(label: kStandardDelivery),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 177,
                    height: 19,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text(
                        kDeliveryMass,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                    ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 20, left: 30, right: 30),
                        child: Container(
                          width: 450,
                          height: 60,
                          padding: EdgeInsets.only(left: 8, top: 8),
                          decoration: BoxDecoration(color: Color(0xFFF9F9F9)),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 8.0, right: 8, left: 30),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: Container(color: Colors.transparent),
                              onChanged: (String? newValue) {
                                setState(() {
                                  startingValueStandardWeight = newValue!;
                                });
                              },
                              hint: startingValueStandardWeight == ""
                                  ? Text("Izaberite", style: TextStyle(fontSize: 14))
                                  : Text(startingValueStandardWeight, style: TextStyle(fontSize: 14)),
                              items: <String>[
                                '',
                                '0kg - 0.5kg',
                                '0.5kg - 1kg',
                                '1kg - 2kg',
                                '2kg - 5kg',
                                '5kg - 10kg',
                                '10kg - 15kg',
                                '15kg - 20kg',
                                '20kg - 30kg',
                                '30kg - 50kg'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 177,
                        height: 19,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Text(
                            kDelivery,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 20, left: 30, right: 30),
                        child: Container(
                          width: 450,
                          height: 60,
                          padding: EdgeInsets.only(left: 8, top: 8),
                          decoration: BoxDecoration(color: Color(0xFFF9F9F9)),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 8.0, right: 8, left: 30),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: Container(color: Colors.transparent),
                              onChanged: (String? newValue) {
                                setState(() {
                                  startingValueStandardDelivery = newValue!;
                                });
                              },
                              hint: startingValueStandardDelivery == ""
                                  ? Text("Izaberite uslugu", style: TextStyle(fontSize: 14))
                                  : Text(startingValueStandardDelivery, style: TextStyle(fontSize: 14)),
                              items: <String>['', 'Danas za danas', 'Danas za sutra do 12h', 'Danas za sutra do 18h']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  enabled: value == 'Danas za sutra do 12h' ? false : true,
                                  value: value,
                                  child: Text(
                                    value,
                                    style: value == 'Danas za sutra do 12h' ? TextStyle(color: Colors.black12) : TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                  SizedBox(height: 20),
                  SizedBox(
                        width: 177,
                        height: 19,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Text(
                            kRSD,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, bottom: 20),
                        child: CustomInputField(
                          label: kRSD,
                          controller: controllerStandardAmountRSD,
                          startingValueStandardWeight: startingValueStandardWeight,
                          startingValueStandardDelivery: startingValueStandardDelivery,
                        ),
                      ),
                ],
              ),
                  AdditionalServicesColumn(
                    isClicked: isClicked,
                    isStandard: true,
                    controllerBackDocumentation: controllerStandardBackDocumentation,
                    controllerBuyOut: controllerStandardBuyOut,
                    controllerPaidResponse: controllerStandardPaidResponse,
                    controllerPersonalDelivery: controllerStandardPersonalDelivery,
                    controllerReturnReceipt: controllerStandardReturnReceipt,
                    controllerSendValue: controllerStandardSendValue,
                    controllerSMSReports: controllerStandardSMSReports,
                    controllerFinalAmount: controllerStandardFinalAmount,
                    controllerStandardAmountRSD: controllerStandardAmountRSD,
                    controllerSpecialAmountRSD: controllerSpecialAmountRSD,
                  ),
                  SizedBox(height: 50),
                  MediaQuery.of(context).size.width > 950 ? Column(
                children: [
                  HeadingContainer(label: kSpecialDelivery),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 177,
                        height: 19,
                        child: Text(
                          kDeliveryType,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                      SizedBox(width: 250),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
                        child: Container(
                          width: 450,
                          height: 60,
                          padding: EdgeInsets.only(left: 8, top: 8),
                          decoration: BoxDecoration(color: Color(0xFFF9F9F9)),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 8.0, right: 8, left: 30),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: Container(color: Colors.transparent),
                              onChanged: (String? newValue) {
                                setState(() {
                                  startingValueSpecialType = newValue!;
                                });
                              },
                              hint: startingValueSpecialType == ""
                                  ? Text("Izaberite", style: TextStyle(fontSize: 14))
                                  : Text(startingValueSpecialType, style: TextStyle(fontSize: 14)),
                              items: <String>[
                                '',
                                'Bicikl',
                                'Televizor do 55 incha',
                                'Guma putnička',
                                'Guma poluteretna',
                                'Guma teretna',
                                'Guma putnička sa felnom',
                                'Guma poluteretna sa felnom',
                                'Guma teretna sa felnom',
                                'Traktorska guma',
                                'Traktorska guma sa felnom',
                                'Menjač manji',
                                'Menjač automatski',
                                'Auto motor'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 19,
                        child: Text(
                          kDelivery,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                      SizedBox(width: 330),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
                        child: Container(
                          width: 450,
                          height: 60,
                          padding: EdgeInsets.only(left: 8, top: 8),
                          decoration: BoxDecoration(color: Color(0xFFF9F9F9)),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 8.0, right: 8, left: 30),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: Container(color: Colors.transparent),
                              onChanged: (String? newValue) {
                                setState(() {
                                  startingValueSpecialDelivery = newValue!;
                                });
                              },
                              hint: startingValueSpecialDelivery == ""
                                  ? Text("Izaberite uslugu", style: TextStyle(fontSize: 14))
                                  : Text(startingValueSpecialDelivery, style: TextStyle(fontSize: 14)),
                              items: <String>['', 'Danas za danas', 'Danas za sutra do 12h', 'Danas za sutra do 18h']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  enabled: value == 'Danas za sutra do 12h' ? false : true,
                                  value: value,
                                  child: Text(
                                    value,
                                    style: value == 'Danas za sutra do 12h' ? TextStyle(color: Colors.black12) : TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 177,
                        height: 19,
                        child: Text(
                          kRSD,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                      SizedBox(width: 500),
                      CustomInputField(
                        label: kRSD,
                        controller: controllerSpecialAmountRSD,
                        startingValueSpecialDelivery: startingValueSpecialDelivery,
                        startingValueSpecialType: startingValueSpecialType,
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                ],
              ) : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingContainer(label: kSpecialDelivery),
                      SizedBox(height: 20),
                      Container(
                        width: 177,
                        height: 19,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Text(
                            kDeliveryType,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 20, left: 30, right: 30),
                        child: Container(
                          width: 450,
                          height: 60,
                          padding: EdgeInsets.only(left: 8, top: 8),
                          decoration: BoxDecoration(color: Color(0xFFF9F9F9)),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 8.0, right: 8, left: 30),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: Container(color: Colors.transparent),
                              onChanged: (String? newValue) {
                                setState(() {
                                  startingValueSpecialType = newValue!;
                                });
                              },
                              hint: startingValueSpecialType == ""
                                  ? Text("Izaberite", style: TextStyle(fontSize: 14))
                                  : Text(startingValueSpecialType, style: TextStyle(fontSize: 14)),
                              items: <String>[
                                '',
                                'Bicikl',
                                'Televizor do 55 incha',
                                'Guma putnička',
                                'Guma poluteretna',
                                'Guma teretna',
                                'Guma putnička sa felnom',
                                'Guma poluteretna sa felnom',
                                'Guma teretna sa felnom',
                                'Traktorska guma',
                                'Traktorska guma sa felnom',
                                'Menjač manji',
                                'Menjač automatski',
                                'Auto motor'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 19,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Text(
                            kDelivery,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 20, left: 30, right: 30),
                        child: Container(
                          width: 450,
                          height: 60,
                          padding: EdgeInsets.only(left: 8, top: 8),
                          decoration: BoxDecoration(color: Color(0xFFF9F9F9)),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 8.0, right: 8, left: 30),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: Container(color: Colors.transparent),
                              onChanged: (String? newValue) {
                                setState(() {
                                  startingValueSpecialDelivery = newValue!;
                                });
                              },
                              hint: startingValueSpecialDelivery == ""
                                  ? Text("Izaberite uslugu", style: TextStyle(fontSize: 14))
                                  : Text(startingValueSpecialDelivery, style: TextStyle(fontSize: 14)),
                              items: <String>['', 'Danas za danas', 'Danas za sutra do 12h', 'Danas za sutra do 18h']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  enabled: value == 'Danas za sutra do 12h' ? false : true,
                                  value: value,
                                  child: Text(
                                    value,
                                    style: value == 'Danas za sutra do 12h' ? TextStyle(color: Colors.black12) : TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 177,
                        height: 19,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Text(
                            kRSD,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, bottom: 20),
                        child: CustomInputField(
                          label: kRSD,
                          controller: controllerSpecialAmountRSD,
                          startingValueSpecialDelivery: startingValueSpecialDelivery,
                          startingValueSpecialType: startingValueSpecialType,
                        ),
                      ),
                    ],
                  ),
                  AdditionalServicesColumn(
                    isClicked: isClicked,
                    isStandard: false,
                    controllerBackDocumentation: controllerSpecialBackDocumentation,
                    controllerBuyOut: controllerSpecialBuyOut,
                    controllerPaidResponse: controllerSpecialPaidResponse,
                    controllerPersonalDelivery: controllerSpecialPersonalDelivery,
                    controllerReturnReceipt: controllerSpecialReturnReceipt,
                    controllerSendValue: controllerSpecialSendValue,
                    controllerSMSReports: controllerSpecialSMSReports,
                    controllerFinalAmount: controllerSpecialFinalAmount,
                    controllerStandardAmountRSD: controllerStandardAmountRSD,
                    controllerSpecialAmountRSD: controllerSpecialAmountRSD,
                  ),
                  SizedBox(height: 70),
                  MediaQuery.of(context).size.width > 950 ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 230),
                      SizedBox(width: 390),
                      GestureDetector(
                        child: Container(
                          height: 50,
                          width: 300,
                          color: Color(0xFFFF2121),
                          child: Padding(
                            padding: EdgeInsets.only(top: 11, bottom: 11),
                            child: Text(
                              kCheckPrice,
                              style: TextStyle(fontSize: 24, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        onTap: (){
                          setState(() {
                            cutStandardRSD = controllerStandardAmountRSD.text.length == 10 ? controllerStandardAmountRSD.text.substring(0, 3) : controllerStandardAmountRSD.text.length == 11 ? controllerStandardAmountRSD.text.substring(0, 4) : controllerStandardAmountRSD.text.length == 0 ? "0" : "0";
                            cutStandardAdditionalServicesRSD = context.read<Sum>().sumStandard.text.length == 10 ? context.read<Sum>().sumStandard.text.substring(0, 3) : context.read<Sum>().sumStandard.text.length == 11 ? context.read<Sum>().sumStandard.text.substring(0, 4) : "0";
                            finalStandardAmountNote = double.parse(cutStandardRSD) + double.parse(cutStandardAdditionalServicesRSD);
                            cutSpecialRSD = controllerSpecialAmountRSD.text.length == 10 ? controllerSpecialAmountRSD.text.substring(0, 3) : controllerSpecialAmountRSD.text.length == 11 ? controllerSpecialAmountRSD.text.substring(0, 4) : "0";
                            cutSpecialAdditionalServicesRSD = context.read<Sum>().sumSpecial.text.length == 10 ? context.read<Sum>().sumSpecial.text.substring(0, 3) : context.read<Sum>().sumSpecial.text.length == 11 ? context.read<Sum>().sumSpecial.text.substring(0, 4) : "0";
                            finalSpecialAmountNote = double.parse(cutSpecialRSD) + double.parse(cutSpecialAdditionalServicesRSD);
                            isClicked = true;
                          });
                        },
                      ),
                    ],
                  ) : Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width > 420 ? 375 : 250,
                            color: Color(0xFFFF2121),
                            child: Padding(
                              padding: EdgeInsets.only(top: 11, bottom: 11, right: 38),
                              child: Text(
                                kCheckPrice,
                                style: TextStyle(fontSize: 24, color: Colors.white,),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              cutStandardRSD = controllerStandardAmountRSD.text.length == 10 ? controllerStandardAmountRSD.text.substring(0, 3) : controllerStandardAmountRSD.text.length == 11 ? controllerStandardAmountRSD.text.substring(0, 4) : controllerStandardAmountRSD.text.length == 0 ? "0" : "0";
                              cutStandardAdditionalServicesRSD = context.read<Sum>().sumStandard.text.length == 10 ? context.read<Sum>().sumStandard.text.substring(0, 3) : context.read<Sum>().sumStandard.text.length == 11 ? context.read<Sum>().sumStandard.text.substring(0, 4) : "0";
                              finalStandardAmountNote = double.parse(cutStandardRSD) + double.parse(cutStandardAdditionalServicesRSD);
                              cutSpecialRSD = controllerSpecialAmountRSD.text.length == 10 ? controllerSpecialAmountRSD.text.substring(0, 3) : controllerSpecialAmountRSD.text.length == 11 ? controllerSpecialAmountRSD.text.substring(0, 4) : "0";
                              cutSpecialAdditionalServicesRSD = context.read<Sum>().sumSpecial.text.length == 10 ? context.read<Sum>().sumSpecial.text.substring(0, 3) : context.read<Sum>().sumSpecial.text.length == 11 ? context.read<Sum>().sumSpecial.text.substring(0, 4) : "0";
                              finalSpecialAmountNote = double.parse(cutSpecialRSD) + double.parse(cutSpecialAdditionalServicesRSD);
                              isClicked = true;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  if(isClicked)
                  MediaQuery.of(context).size.width > 900 ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 352),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(kStandardDelivery, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              SizedBox(height: 15,),
                              (startingValueStandardWeight.isEmpty) ? Container() : Text(kDeliveryMass + startingValueStandardWeight),
                              SizedBox(height: 5,),
                              (startingValueStandardDelivery.isEmpty) ? Container() : Text(kDelivery + startingValueStandardDelivery),
                              SizedBox(height: 5,),
                              (controllerStandardAmountRSD.text.length == 1) ? Container() : Text(kStandardDeliveryNote + controllerStandardAmountRSD.text),
                              SizedBox(height: 5,),
                              (controllerStandardReturnReceipt.text.isEmpty) ? Container() : Text(kReturnReceipt + controllerStandardReturnReceipt.text),
                              SizedBox(height: 5,),
                              (controllerStandardBackDocumentation.text.isEmpty) ? Container() : Text(kBackDocumentation + controllerStandardBackDocumentation.text),
                              SizedBox(height: 5,),
                              (controllerStandardPaidResponse.text.isEmpty) ? Container() : Text(kPaidResponse + controllerStandardPaidResponse.text),
                              SizedBox(height: 5,),
                              (controllerStandardSMSReports.text.isEmpty) ? Container() : Text(kSMSReports + controllerStandardSMSReports.text),
                              SizedBox(height: 5,),
                              (controllerStandardBuyOut.text.isEmpty) ? Container() : Text(kBuyOut + controllerStandardBuyOut.text),
                              SizedBox(height: 5,),
                              (controllerStandardSendValue.text.isEmpty) ? Container() : Text(kSendValue + controllerStandardSendValue.text),
                              SizedBox(height: 5,),
                              (controllerStandardPersonalDelivery.text.isEmpty) ? Container() : Text(kPersonalDelivery + controllerStandardPersonalDelivery.text),
                              SizedBox(height: 15,),
                              Text("Ukupna vrednost Vaše pošiljke iznosi $finalStandardAmountNote.00 RSD"),
                            ],
                          ),
                          SizedBox(width: 40),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(kSpecialDelivery, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              SizedBox(height: 15,),
                              (startingValueSpecialType.isEmpty) ? Container() : Text(kDeliveryMass + startingValueSpecialType),
                              SizedBox(height: 5,),
                              (startingValueSpecialDelivery.isEmpty) ? Container() : Text(kDelivery + startingValueSpecialDelivery),
                              SizedBox(height: 5,),
                              (controllerSpecialAmountRSD.text.length == 1) ? Container() : Text(kSpecialDeliveryNote + controllerSpecialAmountRSD.text),
                              SizedBox(height: 5,),
                              (controllerSpecialReturnReceipt.text.isEmpty) ? Container() : Text(kReturnReceipt + controllerSpecialReturnReceipt.text),
                              SizedBox(height: 5,),
                              (controllerSpecialBackDocumentation.text.isEmpty) ? Container() : Text(kBackDocumentation + controllerSpecialBackDocumentation.text),
                              SizedBox(height: 5,),
                              (controllerSpecialPaidResponse.text.isEmpty) ? Container() : Text(kPaidResponse + controllerSpecialPaidResponse.text),
                              SizedBox(height: 5,),
                              (controllerSpecialSMSReports.text.isEmpty) ? Container() : Text(kSMSReports + controllerSpecialSMSReports.text),
                              SizedBox(height: 5,),
                              (controllerSpecialBuyOut.text.isEmpty) ? Container() : Text(kBuyOut + controllerSpecialBuyOut.text),
                              SizedBox(height: 5,),
                              (controllerSpecialSendValue.text.isEmpty) ? Container() : Text(kSendValue + controllerSpecialSendValue.text),
                              SizedBox(height: 5,),
                              (controllerSpecialPersonalDelivery.text.isEmpty) ? Container() : Text(kPersonalDelivery + controllerSpecialPersonalDelivery.text),
                              SizedBox(height: 15,),
                              Text("Ukupna vrednost vaše pošiljke iznosi $finalSpecialAmountNote.00 RSD"),
                            ],
                          ),
                        ],
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: Text(konClickTermsMessage, style: TextStyle(color: Colors.black, fontSize: 20),),
                        ),
                      ),
                    ],
                  ) : Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(kStandardDelivery, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        if(startingValueStandardWeight.isNotEmpty) Text(kDeliveryMass + startingValueStandardWeight),
                        if(startingValueStandardWeight.isNotEmpty) SizedBox(height: 15,),
                        if(startingValueStandardDelivery.isNotEmpty) Text(kDelivery + startingValueStandardDelivery),
                        if(startingValueStandardDelivery.isNotEmpty)SizedBox(height: 15,),
                        if(controllerStandardReturnReceipt.text.isNotEmpty) Text(kReturnReceipt + controllerStandardReturnReceipt.text),
                        if(controllerStandardReturnReceipt.text.isNotEmpty)SizedBox(height: 15,),
                        if(controllerStandardBackDocumentation.text.isNotEmpty) Text(kBackDocumentation + controllerStandardBackDocumentation.text),
                        if(controllerStandardBackDocumentation.text.isNotEmpty)SizedBox(height: 15,),
                        if(controllerStandardPaidResponse.text.isNotEmpty) Text(kPaidResponse + controllerStandardPaidResponse.text),
                        if(controllerStandardPaidResponse.text.isNotEmpty)SizedBox(height: 15,),
                        if(controllerStandardSMSReports.text.isNotEmpty) Text(kSMSReports + controllerStandardSMSReports.text),
                        if(controllerStandardSMSReports.text.isNotEmpty)SizedBox(height: 15,),
                        if(controllerStandardBuyOut.text.isNotEmpty) Text(kBuyOut + controllerStandardBuyOut.text),
                        if(controllerStandardBuyOut.text.isNotEmpty)SizedBox(height: 15,),
                        if(controllerStandardSendValue.text.isNotEmpty) Text(kSendValue + controllerStandardSendValue.text),
                        if(controllerStandardSendValue.text.isNotEmpty)SizedBox(height: 15,),
                        if(controllerStandardPersonalDelivery.text.isNotEmpty) Text(kPersonalDelivery + controllerStandardPersonalDelivery.text),
                        SizedBox(height: 15,),
                        Text("Ukupna vrednost Vaše pošiljke iznosi $finalStandardAmountNote.00 RSD"),
                        SizedBox(height: 40),
                        Text(kSpecialDelivery, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        if(startingValueSpecialType.isNotEmpty) Text(kDeliveryMass + startingValueSpecialType),
                        if(startingValueSpecialType.isNotEmpty)SizedBox(height: 15,),
                        if(startingValueSpecialDelivery.isNotEmpty) Text(kDelivery + startingValueSpecialDelivery),
                        if(startingValueSpecialDelivery.isNotEmpty)SizedBox(height: 15,),
                        if(controllerSpecialReturnReceipt.text.isNotEmpty) Text(kReturnReceipt + controllerSpecialReturnReceipt.text),
                        if(controllerSpecialReturnReceipt.text.isNotEmpty)SizedBox(height: 15,),
                        if(controllerSpecialBackDocumentation.text.isNotEmpty) Text(kBackDocumentation + controllerSpecialBackDocumentation.text),
                        if(controllerSpecialBackDocumentation.text.isNotEmpty)SizedBox(height: 15,),
                        if(controllerSpecialPaidResponse.text.isNotEmpty) Text(kPaidResponse + controllerSpecialPaidResponse.text),
                        if(controllerSpecialPaidResponse.text.isNotEmpty)SizedBox(height: 15,),
                        if(controllerSpecialSMSReports.text.isNotEmpty) Text(kSMSReports + controllerSpecialSMSReports.text),
                        if(controllerSpecialSMSReports.text.isNotEmpty)SizedBox(height: 15,),
                        if(controllerSpecialBuyOut.text.isNotEmpty) Text(kBuyOut + controllerSpecialBuyOut.text),
                        if(controllerSpecialBuyOut.text.isNotEmpty)SizedBox(height: 15,),
                        if(controllerSpecialSendValue.text.isNotEmpty) Text(kSendValue + controllerSpecialSendValue.text),
                        if(controllerSpecialSendValue.text.isNotEmpty)SizedBox(height: 15,),
                        if(controllerSpecialPersonalDelivery.text.isNotEmpty) Text(kPersonalDelivery + controllerSpecialPersonalDelivery.text),
                        SizedBox(height: 15,),
                        Text("Ukupna vrednost vaše pošiljke iznosi $finalSpecialAmountNote.00 RSD"),
                        SizedBox(height: 40),
                        Text(konClickTermsMessage, style: TextStyle(color: Colors.black, fontSize: 20), textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  // SizedBox(height: 150),
                  // CustomAppFooter(),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
