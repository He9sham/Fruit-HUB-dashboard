import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onImageSelected});
  final ValueChanged<File?> onImageSelected;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isloading = false;
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isloading,
      child: GestureDetector(
        onTap: () async {
          isloading = true;
          setState(() {});
          await pickImageForGallery();
          isloading = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                // color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: fileImage != null
                    ? Image.file(fileImage!)
                    : Icon(
                        Icons.image_rounded,
                        size: 50,
                        color: Colors.grey,
                      ),
              ),
            ),
            Visibility(
              visible: fileImage != null,
              child: IconButton(
                onPressed: () {
                  fileImage = null;
                  widget.onImageSelected(fileImage);
                  setState(() {});
                },
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> pickImageForGallery() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        fileImage = File(image.path);
      } else {
        isloading = false;
        setState(() {});
      }
      widget.onImageSelected(fileImage);
    } on Exception {
      SnackBar(
        content: Text('Error picking image , please try again'),
      );
    }
  }
}
