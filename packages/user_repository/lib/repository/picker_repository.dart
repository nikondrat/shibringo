import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

import '../models/models.dart';

abstract class PickerRepository {
  Future pickAvatar(
      {required Function(Uint8List data, String fileName, XFile file) onDone,
      required Function(PickerStateException exception) onError});
}
