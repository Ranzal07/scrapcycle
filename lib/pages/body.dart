// ignore_for_file: avoid_print
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scrapcycle/database/add_to_database.dart';

class BodyPage extends StatefulWidget {
    const BodyPage({Key? key}) : super(key: key);

    @override
    State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
    DateTime date = DateTime.now();
    Stream<DocumentSnapshot> getSchedDate = FirebaseFirestore.instance.collection('collection-date').doc('Admin').snapshots();     // DocumentID: 'Admin'     Document Field: schedule-date: <timestamp> value

    List<String> plastics = [
        "Plastic Bottles",
        "Plastic Cups", 
        "Water Bottles", 
        "Coke Mismo", 
        "Sprite Mismo", 
        "250ml Royal Bottle", 
        "Monobloc Chairs", 
        "Hangers", 
        "Shampoo Bottles", 
        "Water Jugs",
        "1.5 Litres Beverage"
    ];

    List<String> glasses = [
        "Kulafu",
        "Tanduay",
        "Garapa",
        "Ketchup",
        "Mallorca",
        "Coke Litro",
        "Kasalo/Pepsi",
        "RedHorse Litro",
        "Coke Litro w/ Case",
        "Pepsi Litro w/ Case",
        "RedHorse Litro w/ Case",
        "Coke Small",
        "Pepsi Small",
        "Cobra",
        "RedHorse Small",
    ];

    List<String> metals = [
        "Assorted",
        "Solid",
        "Light Bulbs (Pundido)",
        "Tin Can",
        "Sin Roof",
        "Alloy (Mixed)",
        "Cooking Pot",
        "Aluminum Can",
        "Lead",
        "Copper",
        "Brass",
        "Light/Thin Metals",
        "Heavy/Thick Metals",
        "Steel Plate Metal",
        "Sardines Can", 
        "Tuna Can",
        "Corrugated Roofing Material",
        "Steel/Bronze",
        "Steel/Bronze (Mixed)",
        "Caldero",
        "Beverage Cans", 
        "Spray Cans",
        "Lead Sinker (Tingga)",
        "Copper Tubing", 
        "Wlectric Cords",
        "Locks", 
        "Hinges", 
        "Zippers", 
        "Drawer Knobs",
    ];

    List<String> batteries = [
        "Motorcycle Battery",
        "Car Battery",
        "MCB",
        "5 Plates",
        "7 Plates",
        "9 Plates",
        "11 Plates",
        "13 Plates",
        "17 Plates",
        "21 Plates",
    ];

    List<String> electronics = [
        "TV Board",
        "M2",
        "Single Check",
        "Double",
        "Radiator",
    ];

               
    @override 
    Widget build(BuildContext context) {
        return ListView(
                children: [  
                    Container(
                        padding: const EdgeInsets.all(15),
                        child: SingleChildScrollView(
                          child: Wrap(
                              children: [
                                    Container( 
                                        margin: const EdgeInsets.fromLTRB(0,10,0,10),
                                        alignment: Alignment.topCenter,
                                        child: const Text('Next scrap collection date:', style: TextStyle(fontSize: 15)),
                                    ),
                                    StreamBuilder<DocumentSnapshot>(
                                        stream: getSchedDate,
                                        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                                            if(snapshot.hasData){
                                                Map<String, dynamic> dateSnapshot = snapshot.data!.data() as Map<String, dynamic>;
                                                DateTime scheduleDate = dateSnapshot['schedule-date'].toDate();
                                                date = scheduleDate;
                                                return Container(
                                                    margin: const EdgeInsets.fromLTRB(0,10,0,0),
                                                    alignment: Alignment.topCenter,
                                                    child: Text('${DateFormat('MMMM').format(scheduleDate)} ${scheduleDate.day}, ${scheduleDate.year}', 
                                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Color(0xff219653))  
                                                    ),  
                                                ); 
                                            }
                                            return Container();   
                                        }
                                    ),                                 
                                    Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                                        child: Container(  
                                            alignment: Alignment.center,    
                                            height: 109.0,
                                            width: 333.0,
                                            decoration: BoxDecoration(  
                                                border: Border.all(color: Colors.black12),
                                                color: const Color.fromARGB(255, 60, 150, 123),
                                                borderRadius: BorderRadius.circular(11),               
                                                boxShadow: const [
                                                    BoxShadow(
                                                        color: Color.fromARGB(255, 189, 180, 179),
                                                        spreadRadius: 1,
                                                        blurRadius: 10,
                                                    ),
                                                ], 
                                            ),
                                            child: 
                                                ElevatedButton(
                                                    onPressed: () async{                                                                  
                                                            showDialog(
                                                                context: context,
                                                                builder: (context) {
                                                                    return AlertDialog(
                                                                        title: const Center(child: Text('Confirm your collection?', style: TextStyle(fontWeight: FontWeight.bold))),                                               
                                                                        actions: [
                                                                            TextButton(
                                                                                onPressed: (){Navigator.of(context).pop();}, 
                                                                                child: const Text('Back', style: TextStyle(color: Colors.red)),
                                                                            ),
                                                                            TextButton(
                                                                                onPressed: () {AddToDatabase.dataSend(context, date);},
                                                                                child: const Text('Confirm', style: TextStyle(color: Colors.green)),
                                                                            ),
                                                                        ],
                                                                        elevation: 25,   
                                                                    );
                                                                    
                                                                }
                                                            ); 
                                                        },                            
                                                    style: ElevatedButton.styleFrom(      
                                                        primary: const Color(0xFF27AE60),
                                                        onSurface: Colors.black,
                                                        shape: const StadiumBorder(),        
                                                    ),
                                                    child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                            const Text('Collect My Scraps! '),
                                                            Image.asset("assets/images/truck.png"),
                                                        ],
                                                    )                 
                                                ),
                                            ),
                                        ),                      
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                            Container(                                          
                                            alignment: Alignment.topLeft,
                                            child: const Text(
                                                'We buy:', 
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                ),
                                            ),
                                            ),
                                            Container(                                          
                                                alignment: Alignment.topLeft,
                                                child: Row(
                                                    children: [
                                                            InkWell(
                                                                onTap: () {DefaultTabController.of(context)!.animateTo(1); },
                                                                child: const Text('See the selling price', 
                                                                    style: TextStyle(
                                                                        fontSize: 14,
                                                                        fontWeight: FontWeight.bold,
                                                                        decoration: TextDecoration.underline,
                                                                        color: Color(0XFF219653),
                                                                    ),
                                                                ),
                                                            ),
                                                            Image.asset("assets/images/peso.png"),
                                                    ],
                                                ),
                                            ),
                                        ],
                                    ),
                                    Container(
                                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                        child: const Align(
                                            alignment: Alignment.topLeft,
                                            child: Text('Plastics:', 
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                ),
                                            ),
                                        ),  
                                    ),
                                    Wrap(
                                        spacing: 5,
                                        runSpacing: 10,
                                        children: [
                                            for(var i in plastics)
                                            Container(
                                                padding: const EdgeInsets.fromLTRB(5,2,5,2),
                                                decoration: const ShapeDecoration(
                                                    shape: StadiumBorder(side: BorderSide(color: Colors.black)),
                                                ),
                                                child: Text(i, style: const TextStyle(fontSize: 15)),
                                            ),
                                        ],
                                    ),
                                    Container(
                                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                                        child: const Align(
                                            alignment: Alignment.topLeft,
                                            child: Text('Glasses:', 
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                ),
                                            ),
                                        ),  
                                    ),
                                    Wrap(
                                        spacing: 5,
                                        runSpacing: 10,
                                        children: [
                                            for(var i in glasses)
                                            Container(
                                                padding: const EdgeInsets.fromLTRB(5,2,5,2),
                                                decoration: const ShapeDecoration(
                                                    shape: StadiumBorder(side: BorderSide(color: Colors.black)),
                                                ),
                                                child: Text(i, style: const TextStyle(fontSize: 15)),
                                            ),
                                        ],
                                    ),
                                    Container(
                                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                                        child: const Align(
                                            alignment: Alignment.topLeft,
                                            child: Text('Metals:', 
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                ),
                                            ),
                                        ),  
                                    ),
                                    Wrap(
                                        spacing: 5,
                                        runSpacing: 10,
                                        children: [
                                            for(var i in metals)
                                            Container(
                                                padding: const EdgeInsets.fromLTRB(5,2,5,2),
                                                decoration: const ShapeDecoration(
                                                    shape: StadiumBorder(side: BorderSide(color: Colors.black)),
                                                ),
                                                child: Text(i, style: const TextStyle(fontSize: 15)),
                                            ),
                                        ],
                                    ),
                                    Container(
                                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                                        child: const Align(
                                            alignment: Alignment.topLeft,
                                            child: Text('Batteries:', 
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                ),
                                            ),
                                        ),  
                                    ),
                                    Wrap(
                                        spacing: 5,
                                        runSpacing: 10,
                                        children: [
                                            for(var i in batteries)
                                            Container(
                                                padding: const EdgeInsets.fromLTRB(5,2,5,2),
                                                decoration: const ShapeDecoration(
                                                    shape: StadiumBorder(side: BorderSide(color: Colors.black)),
                                                ),
                                                child: Text(i, style: const TextStyle(fontSize: 15)),
                                            ),
                                        ],
                                    ),
                                    Container(
                                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                                        child: const Align(
                                            alignment: Alignment.topLeft,
                                            child: Text('Electronics:', 
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                ),
                                            ),
                                        ),  
                                    ),
                                    Wrap(
                                        spacing: 5,
                                        runSpacing: 10,
                                        children: [
                                            for(var i in electronics)
                                            Container(
                                                padding: const EdgeInsets.fromLTRB(5,2,5,2),
                                                decoration: const ShapeDecoration(
                                                    shape: StadiumBorder(side: BorderSide(color: Colors.black)),
                                                ),
                                                child: Text(i, style: const TextStyle(fontSize: 15)),
                                            ),
                                        ],
                                    ),                        
                                ],
                            ),
                        ),
                    ),
                    Container(
                        height: 200.0,                                    
                        width: 550.0,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(  
                            color: Colors.white,                     
                            image: 
                                DecorationImage(
                                    image: AssetImage("assets/images/playground.png"),
                                    fit: BoxFit.fill,
                            ),
                        ),  
                    ), 
                ],             
        );
    }
}
