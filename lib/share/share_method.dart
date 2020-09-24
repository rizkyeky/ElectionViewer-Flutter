part of 'share.dart';

// Future<File> getImage() async {
//   final ImagePicker imagePicker = ImagePicker();

//   final PickedFile image = await imagePicker.getImage(source: ImageSource.gallery);
//   return File.fromRawPath(await image.readAsBytes());
// }

// Future<String> uploadImage(File image) async {
//   final String fileName = basename(image.path);

//   final StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
//   final StorageUploadTask task = ref.putFile(image);
//   final StorageTaskSnapshot snapshot = await task.onComplete;

//   return snapshot.ref.getDownloadURL() as String;
// }

String convertCurr(int value) {
  final NumberFormat formatCurrency = NumberFormat.simpleCurrency(name: '', decimalDigits: 0);
  return formatCurrency.format(value);
}

String convertTime(int minute) {
   
    final str = StringBuffer();

    if (minute > 60) {
      str.write((minute / 60).floor());
      str.write('h ');
    }
    if (minute % 60 != 0) {
      str.write(minute % 60);
      str.write('m');
    }
    return str.toString();
  }

// Future<String> getImageFromFirebase(String imageName) async {
//   final FirebaseStorage storage = FirebaseStorage.instance;
//   final StorageReference ref = storage.ref();
//   final StorageUploadTask task = ref.child().;
//   final StorageTaskSnapshot snapshot = await task.onComplete;

//   return snapshot.ref.getDownloadURL() as String;
// }