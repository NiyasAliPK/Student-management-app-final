import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:student_management_app/db/functions/db_functions.dart';
import 'package:student_management_app/db/model/data_model.dart';
import 'package:student_management_app/screens/home/screen_home.dart';

class ScreenAdding extends StatelessWidget {
  final Studentmodel? data;
  final _nameFromController = TextEditingController();
  final _ageFromController = TextEditingController();
  final _adNoFromController = TextEditingController();
  final _stdFromController = TextEditingController();
  final _parentFromController = TextEditingController();
  final _placeFromController = TextEditingController();

  ScreenAdding({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller _controller = Get.put(Controller());
    // if (data != null) {
    //   _nameFromController.text = data!.name;
    //   _ageFromController.text = data!.age;
    //   _adNoFromController.text = data!.admissionNumber;
    //   _stdFromController.text = data!.std;
    //   _parentFromController.text = data!.parentName;
    //   _placeFromController.text = data!.place;
    //   img = data!.img;
    // }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Add Students'),
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
                    label: Text('Age'),
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
                    label: Text('Admission Number'),
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
                    return Container(
                      margin: const EdgeInsets.only(left: 15, bottom: 15),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/avatar.png"),
                        ),
                      ),
                      child: img.trim().isNotEmpty
                          ? CircleAvatar(
                              backgroundImage: MemoryImage(
                                  const Base64Decoder().convert(img)),
                            )
                          : Container(),
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
                icon: const Icon(Icons.add),
                label: const Text('Add Student'),
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
        _place.isEmpty) {
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
          img: img);
      addStudent(_student);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Padding(
          padding: EdgeInsets.only(left: 90),
          child: Text('Student added Succesfully.'),
        ),
        backgroundColor: Colors.greenAccent[400],
      ));

      clear();
      Get.to(const ScreenHome());
    }
  }
}
