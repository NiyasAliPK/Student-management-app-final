import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_app/screens/home/screen_home.dart';

class ScreenUsers extends StatelessWidget {
  const ScreenUsers({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.amberAccent.shade200, Colors.amber],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Users'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.offAll(const ScreenHome());
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber[200],
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset.zero,
                            blurRadius: 10,
                            blurStyle: BlurStyle.normal,
                            spreadRadius: 5),
                      ],
                      border: Border.all(width: 0.2, style: BorderStyle.solid),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/images/Abhinand.jpg'),
                        ),
                        Text(
                          'Abhinand',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.offAll(const ScreenHome());
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber[200],
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset.zero,
                            blurRadius: 10,
                            blurStyle: BlurStyle.normal,
                            spreadRadius: 5),
                      ],
                      border: Border.all(width: 0.2, style: BorderStyle.solid),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/images/Ameer.jpg'),
                        ),
                        Text(
                          'Ameer',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(const ScreenHome());
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber[200],
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset.zero,
                            blurRadius: 10,
                            blurStyle: BlurStyle.normal,
                            spreadRadius: 5),
                      ],
                      border: Border.all(width: 0.2, style: BorderStyle.solid),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/images/Shanid.jpg'),
                        ),
                        Text(
                          'Shanid',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(const ScreenHome());
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber[200],
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset.zero,
                            blurRadius: 10,
                            blurStyle: BlurStyle.normal,
                            spreadRadius: 5),
                      ],
                      border: Border.all(width: 0.2, style: BorderStyle.solid),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/images/Shibili.jpg'),
                        ),
                        Text(
                          'Shibili',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
