import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintScreen extends StatefulWidget {
  PrintScreen();

  @override
  _PrintScreenState createState() => _PrintScreenState();
}

class _PrintScreenState extends State<PrintScreen> {
  // late AutoScrollController _scrollController;
  // @override
  // void initState() {
  //   _scrollController = AutoScrollController(
  //       viewportBoundaryGetter: () =>
  //           Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
  //       axis: Axis.vertical);
  //   super.initState();
  //   // context.read<InventorysearchCubit>().getSearch("code").then((value) {
  //   //   print("ak test"+value.toString());
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: PdfPreview(
        build: (format) => _generatePdf(format, context),
      ),
    );
  }
}

Future<Uint8List> _generatePdf(
  PdfPageFormat format,
  BuildContext context,
) async {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
  final font = await PdfGoogleFonts.nunitoExtraLight();
  // final logo = await networkImage('https://rgcdynamics-logos.s3.ap-south-1.amazonaws.com/Ahlan%20New-03.png');

  pdf.addPage(
    pw.Page(
      pageFormat: format.copyWith(
          marginLeft: 0, marginTop: 0, marginRight: 0, marginBottom: 0),
      build: (context) {
        return pw.Container(
          // backgroundColor: Colors.white,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                padding: pw.EdgeInsets.all(20),
                // height: height * .155,
                color: PdfColor.fromInt(0xAAF7F7F7),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    // pw.  Container(
                    //
                    //     height: 16,
                    //     width: 16,
                    //     // decoration: pw. BoxDecoration(
                    //     //     image:pw. DecorationImage(
                    //     //         image: NetworkImage("https://i.pinimg.com/736x/d2/53/fb/d253fbcb29b2c743b57816b23746fe12--portugal-national-team-cristiano-ronaldo-portugal.jpg")
                    //     //     )
                    //     // ),
                    //     child: pw. Container(
                    //         child: pw.Image(logo)),
                    //
                    //   ),
                    pw.Spacer(),
                    pw.Container(
                      margin: pw.EdgeInsets.symmetric(horizontal: width / 103),
                      // padding:pw. EdgeInsets.only(right: width*.01),

                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: [
                          pw.Text(
                            "Kumrakam",
                            style: pw.TextStyle(
                              // color:Color(0xff565555) ,
                              fontSize: 22,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.SizedBox(
                            height: height * .005,
                          ),
                          pw.Text(
                            "Cheepankal po,kumarakom,kerala-686543",
                            style: pw.TextStyle(
                                // color:Color(0xff565555) ,
                                fontSize: 22),
                          ),
                          pw.SizedBox(
                            height: height * .009,
                          ),
                          pw.Text(
                            "email: akshay@gmail.com",
                            style: pw.TextStyle(
                                // color:Color(0xff565555) ,
                                fontSize: 22),
                          ),
                          pw.SizedBox(
                            height: height * .009,
                          ),
                          pw.Text(
                            "Mobile:999552886/973562719",
                            style: pw.TextStyle(
                                // color:Color(0xff565555) ,
                                fontSize: 22),
                          ),
                          pw.SizedBox(
                            height: height * .009,
                          ),
                          pw.SizedBox(
                            height: height * .009,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              pw.Container(
                  padding: pw.EdgeInsets.all(20),
                  height: 233,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "Patient details",
                          style: pw.TextStyle(
                              color: PdfColor.fromInt(0xAA00A64F),
                              fontSize: 33),
                        ),
                        pw.SizedBox(
                          height: height * .009,
                        ),
                        pw.Row(
                          children: [
                            pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Row(children: [
                                    pw.Text("Name",
                                        style: pw.TextStyle(
                                            fontSize: 20,
                                            fontWeight: pw.FontWeight.bold)),
                                    pw.SizedBox(width: 90),
                                    pw.Text("Salih",
                                        style: pw.TextStyle(
                                          fontSize: 20,
                                        )),
                                  ]),
                                  pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      children: [
                                        pw.Text("Address",
                                            style: pw.TextStyle(
                                                fontSize: 20,
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                        pw.SizedBox(width: 30),
                                        pw.Text("Nadakav.kozhikode",
                                            style: pw.TextStyle(
                                              fontSize: 20,
                                            )),
                                      ]),
                                  pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      children: [
                                        pw.Text("Whtasapp number",
                                            style: pw.TextStyle(
                                                fontSize: 20,
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                        pw.SizedBox(width: 10),
                                        pw.Text("9995528886",
                                            style: pw.TextStyle(
                                              fontSize: 20,
                                            )),
                                      ])
                                ]),
                            pw.SizedBox(width: 10),
                            pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Row(children: [
                                    pw.Text("Booked on",
                                        style: pw.TextStyle(
                                            fontSize: 20,
                                            fontWeight: pw.FontWeight.bold)),
                                    pw.SizedBox(width: 20),
                                    pw.Text("Salih",
                                        style: pw.TextStyle(
                                          fontSize: 20,
                                        )),
                                  ]),
                                  pw.SizedBox(width: 5),
                                  pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      children: [
                                        pw.Text("TreatmentDate ",
                                            style: pw.TextStyle(
                                                fontSize: 20,
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                        pw.SizedBox(width: 10),
                                        pw.Text("21/02/2023",
                                            style: pw.TextStyle(
                                              fontSize: 20,
                                            )),
                                      ]),
                                  pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      children: [
                                        pw.Text("Treatment Time",
                                            style: pw.TextStyle(
                                                fontSize: 20,
                                                fontWeight:
                                                    pw.FontWeight.bold)),
                                        pw.SizedBox(width: 10),
                                        pw.Text("11.am",
                                            style: pw.TextStyle(
                                              fontSize: 20,
                                            )),
                                      ])
                                ])
                          ],
                        ),
                        pw.SizedBox(height: 20),
                        pw.Container(
                            // height: 400,
                            margin: pw.EdgeInsets.symmetric(
                                horizontal: width / 103),
                            child: pw.Table(
                                border: pw.TableBorder(
                                  bottom: pw.BorderSide(
                                      width: .5,
                                      color: PdfColors.grey,
                                      style: pw.BorderStyle.solid),
                                  right: pw.BorderSide(
                                      width: .5,
                                      color: PdfColors.grey,
                                      style: pw.BorderStyle.solid),
                                  left: pw.BorderSide(
                                      width: .5,
                                      color: PdfColors.grey,
                                      style: pw.BorderStyle.solid),
                                  verticalInside: pw.BorderSide(
                                      width: .5,
                                      color: PdfColors.grey,
                                      style: pw.BorderStyle.solid),
                                  // horizontalInside:
                                  // pw.   BorderSide(
                                  //
                                  //     width: .5,
                                  //     color: PdfColors.grey,
                                  //     style:
                                  //     pw.  BorderStyle.solid)
                                ),
                                // tableWidth:.5,
                                columnWidths: {
                                  0: pw.FlexColumnWidth(2),
                                  1: pw.FlexColumnWidth(3),
                                  2: pw.FlexColumnWidth(5),
                                  3: pw.FlexColumnWidth(3),
                                  4: pw.FlexColumnWidth(3),
                                  5: pw.FlexColumnWidth(2),
                                  6: pw.FlexColumnWidth(2),
                                  7: pw.FlexColumnWidth(2),
                                  8: pw.FlexColumnWidth(3),
                                  9: pw.FlexColumnWidth(2),
                                  10: pw.FlexColumnWidth(2),
                                  11: pw.FlexColumnWidth(4),
                                  12: pw.FlexColumnWidth(4),
                                  13: pw.FlexColumnWidth(4),
                                  14: pw.FlexColumnWidth(4),
                                  15: pw.FlexColumnWidth(3),
                                  16: pw.FlexColumnWidth(3),
                                  17: pw.FlexColumnWidth(3),
                                },
                                children: [
                                  pw.TableRow(children: [
                                    pw.Container(
                                      // color: PdfColor.fromInt(0xAA1F6BA9),
                                      alignment: pw.Alignment.center,
                                      child: pw.Text('Treatment',
                                          style: pw.TextStyle(
                                            fontSize: height * .012,
                                            color: PdfColors.green,
                                          )),
                                      height: 35,
                                    ),
                                    pw.Container(
                                      // color: PdfColor.fromInt(0xAA1F6BA9),
                                      alignment: pw.Alignment.center,
                                      child: pw.Text('Price ',
                                          style: pw.TextStyle(
                                            fontSize: height * .012,
                                            color: PdfColors.green,
                                          )),
                                      height: 35,
                                    ),

                                    pw.Container(
                                      // color: PdfColor.fromInt(0xAA1F6BA9),
                                      alignment: pw.Alignment.center,
                                      child: pw.Text('Male',
                                          style: pw.TextStyle(
                                            fontSize: height * .012,
                                            color: PdfColors.green,
                                          )),
                                      height: 35,
                                    ),
                                    pw.Container(
                                      // color: PdfColor.fromInt(0xAA1F6BA9),
                                      alignment: pw.Alignment.center,
                                      child: pw.Text('Female',
                                          style: pw.TextStyle(
                                            fontSize: height * .012,
                                            color: PdfColors.green,
                                          )),
                                      height: 35,
                                    ),
                                    pw.Container(
                                      // color: PdfColor.fromInt(0xAA1F6BA9),
                                      alignment: pw.Alignment.center,
                                      child: pw.Text('Total',
                                          style: pw.TextStyle(
                                            fontSize: height * .012,
                                            color: PdfColors.green,
                                          )),
                                      height: 35,
                                    ),

                                    // tableHeadtext(
                                    //   'Is free',
                                    //   padding:
                                    //   EdgeInsets.all(15),
                                    //   height: 80,
                                    //   size: 13,
                                    //     color:  Color(0xff1F6BA9)
                                    // ),
                                  ]),
                                ]))
                      ])),
              pw.SizedBox(height: 40),
              pw.Container(
                  margin: pw.EdgeInsets.symmetric(horizontal: 10),
                  width: 8000,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.end,
                            children: [
                              pw.Text("Total Amount",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 20)),
                              pw.SizedBox(
                                width: 10,
                              ),
                              pw.Text("760", style: pw.TextStyle(fontSize: 20))
                            ]),
                        pw.SizedBox(height: 20),
                        pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.end,
                            children: [
                              pw.Text("Discount",
                                  style: pw.TextStyle(fontSize: 20)),
                              pw.SizedBox(
                                width: 10,
                              ),
                              pw.Text("500", style: pw.TextStyle(fontSize: 20))
                            ]),
                        pw.SizedBox(height: 10),
                        pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.end,
                            children: [
                              pw.Text("Advance",
                                  style: pw.TextStyle(
                                      // fontWeight: pw.FontWeight.bold,
                                      fontSize: 20)),
                              pw.SizedBox(
                                width: 10,
                              ),
                              pw.Text("1200",
                                  style: pw.TextStyle(
                                      // fontWeight: pw.FontWeight.bold,
                                      fontSize: 20))
                            ]),
                        pw.SizedBox(height: 10),
                        pw.Divider(),
                        pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.end,
                            children: [
                              pw.Text("Total Amount",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 20)),
                              pw.SizedBox(
                                width: 10,
                              ),
                              pw.Text("760",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 20))
                            ]),
                        pw.SizedBox(height: 20),
                        pw.Text("Thank you for choosing us",
                            style: pw.TextStyle(
                                color: PdfColors.green,
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 20)),
                        pw.SizedBox(height: 10),
                        pw.Text("Your well_being is our commitment",
                            style: pw.TextStyle(
                                color: PdfColors.grey, fontSize: 20)),
                      ]))
              // pw.   PrintTitleScreen(),
            ],
          ),
        );

        //   pw.Column(
        //   children: [
        //     pw.SizedBox(
        //       width: double.infinity,
        //       child: pw.FittedBox(
        //         child: pw.Text(title, style: pw.TextStyle(font: font)),
        //       ),
        //     ),
        //     pw.SizedBox(height: 20),
        //     pw.Flexible(child: pw.FlutterLogo())
        //   ],
        // );
      },
    ),
  );

  return pdf.save();
}
