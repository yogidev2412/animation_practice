import 'package:flutter/material.dart';

class DraggableScrollablePage extends StatefulWidget {
  const DraggableScrollablePage({super.key});

  @override
  State<DraggableScrollablePage> createState() =>
      _DraggableScrollablePageState();
}

class _DraggableScrollablePageState extends State<DraggableScrollablePage> {
  double sizeOfCard = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: MediaQuery.of(context).size.height * .3,
            child: Image.network(
              "https://i.sstatic.net/B6fEt.png",
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            child: NotificationListener<DraggableScrollableNotification>(
              onNotification: ((notification) {
                setState(() {
                  sizeOfCard = 2 * notification.extent - 0.7;
                });
                return true;
              }),
              child: DraggableScrollableSheet(
                maxChildSize: 0.9,
                minChildSize: 0.31,
                builder: (context, controller) {
                  return Material(
                    elevation: 15,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, left: 20, right: 10),
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        children: [
                          Center(
                            child: Container(
                              height: 3,
                              width: 50,
                              color: Colors.black45,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text("Are you ready to start your journey"),
                          Text(
                            "Where are you going?",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search, size: 25),
                              hintText: "Search your Destination",
                            ),
                          ),
                          SizedBox(height: 5),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: 15,
                              controller: controller,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Icon(
                                    Icons.location_on_outlined,
                                    size: 25,
                                  ),
                                  title: Text(
                                    "Address $index",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text("city : $index"),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            top: -200 * (1 - sizeOfCard),
            child: Opacity(
              opacity: sizeOfCard.clamp(0.0, 1.0),
              child: Material(
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Text(
                        "Choose your destination",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.grey[100],
                          filled: true,
                          hintText: "What is your name?",
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.grey[100],
                          filled: true,
                          hintText: "Where are you going",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
