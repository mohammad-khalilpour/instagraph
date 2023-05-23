import 'dart:developer';

import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file;
  try {
    file = await imagePicker.pickImage(source: source);
  } catch (e) {
    log(e.toString());
  }
  if (file != null) {
    final bytes = await file.readAsBytes();
    return bytes;
  }
}
