import 'package:animation/animation_two/model/user_model.dart';
import 'package:flutter/material.dart';

class ListViewAnimation extends StatefulWidget {
  const ListViewAnimation({super.key});

  @override
  State<ListViewAnimation> createState() => _ListViewAnimationState();
}

class _ListViewAnimationState extends State<ListViewAnimation> {
  double width = 0.0;
  bool myAnimation = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      setState(() {
        myAnimation = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 36, 49),
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Text(
                "List View Animation",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: users.length,
              itemBuilder: (context, index) {
                final myUser = users[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    duration: Duration(milliseconds: 400 + (index * 250)),
                    curve: Curves.easeIn,
                    transform: Matrix4.translationValues(
                      myAnimation ? 0 : width,
                      0,
                      0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(myUser.image),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                myUser.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(myUser.username, style: TextStyle()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
