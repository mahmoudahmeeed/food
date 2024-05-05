import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/button.dart';
import 'package:flutter_application_1/customizedtext.dart';
import 'package:flutter_application_1/setting.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
   final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //PhoneNumber? _phoneNumber;
  Uint8List? _image;
  File? selectedImage;

  @override
  dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Color.fromRGBO(17, 24, 39, 1),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 130,
                child:Center(
                  child: Stack(
                    children: [
                      _image!=null?
                      CircleAvatar(
                        radius: 45,
                        backgroundImage:MemoryImage(_image!) ,
                        
                      ):
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage("images/profile-circle.256x256.png"),
                        
                      ),
                      Positioned(
                        bottom: -0,
                        left: 56,
                        child:IconButton(onPressed: (){
                          showImagePickerOption(context);
                        }, icon: Icon(Icons.add_a_photo)) )
                    ],
                  ),
                ) ,
              ),
              const SizedBox(height: 20),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Name',
                        style: TextStyle(
                          color: Color.fromRGBO(156, 163, 175, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CustomizedTextFormField(
                        controller: _nameController,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Address',
                        style: TextStyle(
                          color: Color.fromRGBO(156, 163, 175, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CustomizedTextFormField(
                        controller: _addressController,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                 const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RoundButton(title: "Save",
                  fontSize: 16,
                  fontWeight:FontWeight.w500,
                   onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>setting()));
                   }),
                )
            ],
          ),
          )),
      ),
    );
  }
  void showImagePickerOption(BuildContext context){
    showModalBottomSheet(context: context, builder: (builder){
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/4,
          child: Row(children: [
            Expanded(
              child: InkWell(
                onTap: (){
                  _pickImageFromGallary();
                },
                child: SizedBox(
                  child: Column(
                    children: [Icon(Icons.image,size: 70,),Text("Gallary")
                    ],
                  ),
                ),
              ),
            ),
             Expanded(
               child: InkWell(
                onTap: (){
                  _pickImageFromCamera();
                },
                child: SizedBox(
                  child: Column(
                    children: [Icon(Icons.camera_alt,size: 70,),Text("Camera")
                    ],
                  ),
                ),
                         ),
             ),
          ],),
        ),
      );

    });
  }
  Future _pickImageFromGallary()async{
    final returnImage=await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage==null)return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
  Future _pickImageFromCamera()async{
    final returnImage=await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage==null)return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}