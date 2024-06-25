import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:space/common/components/elevated_button.dart';
import 'package:space/common/components/input_title.dart';
import 'package:space/common/datasource/datasource.dart';
import 'package:space/features/spaceupload/Presentation/bloc/post_space_bloc.dart';

class PostSpace extends StatefulWidget {
  const PostSpace({super.key});

  @override
  State<PostSpace> createState() => _PostSpaceState();
}

class _PostSpaceState extends State<PostSpace> {
  final _spaceKey = GlobalKey<FormState>();
  File? image;
  File? spaceImage;
  List<File> spaceImages = [];
  String nameOfSpace = '';
  String spaceDesc = '';
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      // print(image);
      // SpaceAppRequestsImplementation().uploadImageAndData(image!);
    }
  }

  Future<void> _pickSpaceImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        spaceImage = File(pickedFile.path);
        spaceImages.add(spaceImage!);
      });
      print('spaces ${spaceImages.length}');
      //SpaceAppRequestsImplementation().uploadImageAndData(spaceImage!);
    }
  }

  void submitFormHandler() {
    if (_spaceKey.currentState!.validate()) {
      _spaceKey.currentState!.save();
      if (image != null && spaceImage!.length != 0) {
        print('hp$spaceImages');
        context.read<PostSpaceBloc>().add(OnRegisterSpace(
            imageFile: image!,
            spaceDesc: spaceDesc,
            spaceName: nameOfSpace,
            spaceImages: spaceImages));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Make sure you choose an image for Cover photo and Select photo.',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.amber,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          'Post Space',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
        child: Form(
          key: _spaceKey,
          child: ListView(
            children: [
              const InputTitle(
                  title: 'These feeds are available to all users.'),
              SizedBox(
                height: size.height * .02,
              ),
              const InputTitle(title: 'Name of space'),
              SizedBox(
                height: size.height * .005,
              ),
              TextFormField(
                onSaved: (String? value) {
                  nameOfSpace = value!;
                },
                validator: (String? value) {
                  if (value!.isEmpty || value.length < 4) {
                    return 'Value should not be less than four characters';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Name of space',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 15)),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              const InputTitle(title: 'Space Description'),
              SizedBox(
                height: size.height * .005,
              ),
              TextFormField(
                onSaved: (String? value) {
                  spaceDesc = value!;
                },
                validator: (String? value) {
                  if (value!.isEmpty || value.length < 4) {
                    return 'Value should not be less than four characters';
                  }
                  return null;
                },
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Space Description',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 15)),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        height: size.height * .25,
                        width: size.width,
                        decoration: BoxDecoration(border: Border.all()),
                        child: image == null
                            ? const Center(
                                child: Text(
                                'No cover photo selected',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
                            : Image.file(
                                image!,
                                fit: BoxFit.cover,
                              )),
                  )
                ],
              ),
              SizedBox(
                height: size.height * .02,
              ),
              spaceImages.isEmpty
                  ? const Center(
                      child: Text(
                        'No Space Images To Display',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Container(
                              height: size.height * .2,
                              width: size.width,
                              decoration: BoxDecoration(border: Border.all()),
                              child: Image.file(
                                spaceImages[index],
                                fit: BoxFit.cover,
                              )),
                        );
                      },
                      itemCount: spaceImages.length,
                    ),
              SizedBox(
                height: size.height * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Cover Photo',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * .007,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                            onPressed: () {
                              _pickImage();
                            },
                            icon: const Icon(
                              Icons.photo_album,
                              size: 40,
                            )),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Select Photo',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * .007,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                            onPressed: () {
                              if (spaceImages.length < 5) {
                                _pickSpaceImage();
                              } else {
                                return;
                              }
                            },
                            icon: const Icon(
                              Icons.add_photo_alternate,
                              size: 40,
                            )),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: size.height * .02,
              ),
              ElevatedButtonComponent(
                  buttonTitle: 'Post Space',
                  execute: () {
                    submitFormHandler();
                  }),
              SizedBox(
                height: size.height * .02,
              ),
              BlocListener<PostSpaceBloc, PostSpaceState>(
                listener: (context, state) {
                  if (state is PostSpaceError) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ));
                  }
                  if (state is PostSpaceLoaded) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        state.message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ));
                  }
                },
                child: BlocBuilder<PostSpaceBloc, PostSpaceState>(
                    builder: (context, state) {
                  if (state is PostSpaceLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const SizedBox();
                }),
              ),
              SizedBox(
                height: size.height * .02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
