import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:user_repository/models/models.dart';
import 'package:user_repository/repository/repository.dart';

class PickerService extends PickerRepository {
  final ImagePicker _picker = ImagePicker();

  @override
  Future pickAvatar(
      {required Function(Uint8List data, String path, XFile file) onDone,
      required Function(PickerStateException exception) onError}) async {
    final imageFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 300,
      maxHeight: 300,
    );
    if (imageFile == null) return;
    try {
      final bytes = await imageFile.readAsBytes();
      final fileExt = imageFile.path.split('.').last;
      final fileName = '${DateTime.now().toIso8601String()}.$fileExt';
      onDone(bytes, fileName, imageFile);
    } catch (e) {
      return onError(PickerStateException.unknown);
    }
  }
}
