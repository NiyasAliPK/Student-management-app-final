import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_app/db/functions/db_functions.dart';
import 'package:student_management_app/screens/home/Screen_editor.dart';
import 'package:student_management_app/screens/home/screen_add.dart';
import 'package:student_management_app/screens/home/screen_search.dart';
import 'package:student_management_app/screens/home/screen_updater.dart';

var images;

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);
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
          automaticallyImplyLeading: false,
          title: const Text('Student List'),
          actions: [
            IconButton(
              onPressed: () {
                searchStudent('');
                Get.to(ScreenSearch());
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: SafeArea(
          child: Obx(
            () {
              return ListView.separated(
                  itemBuilder: (ctx, index) {
                    var data = studentlistNotifier[index];
                    var encodedimg = data.img;
                    images = const Base64Decoder().convert(encodedimg);
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 8, left: 8),
                      child: Card(
                        color: const Color.fromARGB(255, 255, 226, 123),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage: MemoryImage(images),
                          ),
                          title: Text(data.name.toUpperCase()),
                          subtitle: const Text('Click here to see profile'),
                          trailing: Wrap(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.to(ScreenEditing(
                                    data: data,
                                    editorClicked: true,
                                  ));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Color.fromARGB(255, 0, 151, 5),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text(
                                              'Alert',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                            content: const Text(
                                                'Are you sure you want to delete this profile'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Get.offAll(
                                                      const ScreenHome());
                                                },
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    if (data.id != null) {
                                                      deleteStudent(data.id!);
                                                      Get.offAll(
                                                          const ScreenHome());
                                                    }
                                                  },
                                                  child: const Text('Yes'))
                                            ],
                                          );
                                        });
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                          onTap: () {
                            Get.to(ScreenProfile(data: data));
                          },
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const SizedBox();
                  },
                  itemCount: studentlistNotifier.length);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 10, 230, 17),
          onPressed: () {
            img = '';
            Get.to(ScreenAdding());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
