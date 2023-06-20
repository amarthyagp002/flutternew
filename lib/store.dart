import "dart:io";
import "dart:typed_data";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_storage/firebase_storage.dart";

final FirebaseStorage storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadSellCarImage(Uint8List file, String image) async {
    try {
      Reference ref = storage.ref().child("sellcar").child("sellcarimage");
      UploadTask uploadTask = ref.putData(file);
      TaskSnapshot snapshot = uploadTask.snapshot;
      if (snapshot.state == TaskState.success) {
        print("success");
        String downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      } else {
        print("error");
        return "error";
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> uploadImage(
      {required String image,
      required String profile,
      required Uint8List file}) async {
    try {
      print(image);
      Reference ref = storage.ref().child(image).child(profile);

      UploadTask uploadTask = ref.putData(file);
      print('12');
      TaskSnapshot snapshot = await uploadTask;
      print('few');
      String downloadUrl = await snapshot.ref.getDownloadURL();
      print('hi');
      return downloadUrl;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> addImage({
    required String image,
    required String profile,
    required String description,
    required String price,
    required Uint8List file,
  }) async {
    print('hello');
    try {
//       secureStorage.readSecureData('role').then((value){
// Finalrole=value;
//       });
      String res = "something went wrong";

      String imageUrl =
          await uploadImage(image: image, profile: profile, file: file);
      print(imageUrl);
      await FirebaseFirestore.instance
          .collection('staff')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("items")
          .doc()
          .set(
        {
          "image": imageUrl,
          'part-name': image,
          'company': profile,
          'price': price,
          'description': description
        },
      );

      res = "success";
      return res;
    } catch (e) {
      return e.toString();
    }
  }
}
