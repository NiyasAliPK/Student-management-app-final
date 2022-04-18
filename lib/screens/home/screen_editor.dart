import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_app/db/functions/db_functions.dart';
import 'package:student_management_app/db/model/data_model.dart';
import 'package:student_management_app/screens/home/screen_home.dart';

class ScreenEditing extends StatelessWidget {
  // final String name;
  // final String age;
  // final String admissionNumber;
  // final String std;
  // final String parentName;
  // final String place;
  // final int? id;
  final Studentmodel? data;
  bool? editorClicked = false;
  final _nameFromController = TextEditingController();
  final _ageFromController = TextEditingController();
  final _adNoFromController = TextEditingController();
  final _stdFromController = TextEditingController();
  final _parentFromController = TextEditingController();
  final _placeFromController = TextEditingController();

  ScreenEditing({Key? key, this.data, this.editorClicked}) : super(key: key);
  final Controller _controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    _nameFromController.text = data!.name;
    _ageFromController.text = data!.age;
    _adNoFromController.text = data!.admissionNumber;
    _stdFromController.text = data!.std;
    _parentFromController.text = data!.parentName;
    _placeFromController.text = data!.place;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Edit Student Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _nameFromController,
                  decoration: const InputDecoration(
                    label: Text('Name'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _ageFromController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('age'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _adNoFromController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Admission No'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _stdFromController,
                  decoration: const InputDecoration(
                    label: Text('Class'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _parentFromController,
                  decoration: const InputDecoration(
                    label: Text('Parent Name'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _placeFromController,
                  decoration: const InputDecoration(
                    label: Text('Place'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GetBuilder<Controller>(builder: (controller) {
                    if (editorClicked == true) {
                      img = data!.img;
                      editorClicked = false;
                    }
                    return CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          MemoryImage(const Base64Decoder().convert(img)),
                    );
                  }),
                  IconButton(
                    onPressed: () async {
                      _controller.pickimage();
                    },
                    icon: const Icon(Icons.add_a_photo),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  submission(context);
                },
                icon: const Icon(Icons.update),
                label: const Text('Update Profile'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void clear() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _nameFromController.clear();
    _ageFromController.clear();
    _adNoFromController.clear();
    _stdFromController.clear();
    _parentFromController.clear();
    _placeFromController.clear();
  }

  void submission(BuildContext context) async {
    final _name = _nameFromController.text;
    final _age = _ageFromController.text;
    final _admn = _adNoFromController.text;
    final _std = _stdFromController.text;
    final _parent = _parentFromController.text;
    final _place = _placeFromController.text;

    if (_name.isEmpty ||
        _age.isEmpty ||
        _admn.isEmpty ||
        _std.isEmpty ||
        _parent.isEmpty ||
        _place.isEmpty ||
        img.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Padding(
            padding: EdgeInsets.only(left: 50),
            child: Text('Please fill all seven fields including image.'),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      final _student = Studentmodel(
        name: _name,
        age: _age,
        admissionNumber: _admn,
        std: _std,
        parentName: _parent,
        place: _place,
        id: data!.id,
        img: img,
      );
      updateStudent(_student);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Padding(
          padding: EdgeInsets.only(left: 90),
          child: Text('Profile Updated Successfully.'),
        ),
        backgroundColor: Colors.greenAccent[400],
      ));

      await Future.delayed(const Duration(milliseconds: 500));
      Navigator.of(context).pushAndRemoveUntil(
          (MaterialPageRoute(
            builder: (context) => const ScreenHome(),
          )),
          (route) => false);
    }
  }
}
