import 'package:fixhome2/compnent/services.dart';
import 'package:fixhome2/compnent/user_info.dart';
import 'package:fixhome2/screens/services_provider.dart';
import 'package:fixhome2/sharedwidget/bottomnav.dart';
import 'package:fixhome2/sharedwidget/drawer.dart';
import 'package:fixhome2/sharedwidget/floatig%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Body2 extends StatelessWidget {
  const Body2({Key key}) : super(key: key);

  get w800 => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC2185B),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: MyDrawer(),
      body: MyHomePagee(),
      floatingActionButton: Floart(),
      bottomNavigationBar: Mynav(),
    );
  }
}

class MyHomePagee extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyHomePagee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getUser(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                       ServicesProvider(serviceName:  "${snapshot.data[index].name}")));
                          },
                          child: CustomCard(
                              borderRadius: 10,
                              height: MediaQuery.of(context).size.height * 0.14,
                              width: MediaQuery.of(context).size.width * 0.85,
                              elevation: 10,
                              childPadding: 3,
                              color: Colors.white,
                              borderColor: Colors.grey.shade500,
                              borderWidth: 2,
                              hoverColor: Colors.pink.shade50,
                              child: ListView(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 45.0,
                                        ),
                                        child: Image.network(
                                          "${snapshot.data[index].image}",
                                          width: 75,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 45.0),
                                        child: Text(
                                          "${snapshot.data[index].name}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ],
                                    //             ),

                                    // child: ListTile(
                                    //   leading: Text("${snapshot.data[index].Id}"),
                                    //   title: Text("${snapshot.data[index].name}"),

                                    // ),
                                  ),

                                  // child: Container(
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.center,
                                  //     children: <Widget>[
                                  //       CustomCard(
                                  //         borderRadius: 10,
                                  //         height: MediaQuery.of(context).size.height * 0.14,
                                  //         width: MediaQuery.of(context).size.width * 0.85,
                                  //         elevation: 10,
                                  //         childPadding: 3,
                                  //         color: Colors.white,
                                  //         borderColor: Colors.grey.shade500,
                                  //         borderWidth: 2,
                                  //         hoverColor: Colors.pink.shade50,
                                  //         onTap: () {
                                  //           // Navigator.push(
                                  //           //   context,
                                  //           //   MaterialPageRoute(
                                  //           //     builder: (context) {
                                  //           //       return Viewmp();
                                  //           //     },
                                  //           //   ),
                                  //           // );
                                  //         },
                                  //         child: ListView(
                                  //           children: [
                                  //             Row(
                                  //               mainAxisAlignment:
                                  //                   MainAxisAlignment.spaceBetween,
                                  //               children: [
                                  //                 Padding(
                                  //                   padding: const EdgeInsets.only(
                                  //                     left: 45.0,
                                  //                   ),
                                  //                   child: Image.network(
                                  //                     "${snapshot.data[index].image}",
                                  //                     width: 75,
                                  //                   ),
                                  //                 ),
                                  //                 Padding(
                                  //                   padding:
                                  //                       const EdgeInsets.only(right: 45.0),
                                  //                   child: Text(
                                  //                     "${snapshot.data[index].name}",
                                  //                     style: TextStyle(
                                  //                         fontWeight: FontWeight.bold,
                                  //                         fontSize: 18),
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              )));
                    }),
              );
            }
          }
          ),
    );
  }
}
