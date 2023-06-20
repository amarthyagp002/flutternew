import 'dart:ui';

import 'package:akary/model/vehicle_part.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/cart_item.dart';

class FireStoreService {
  static final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');
  static final CollectionReference _staffCollectionReference =
      FirebaseFirestore.instance.collection('staff');

  static Future<List<VehiclePart>> getVehicleItems() async {
    try {
      final snapshot = await _staffCollectionReference
          .doc('ZORJDKCdPCgR23QIDx2DSEGWokG2')
          .collection('items')
          .get();
      final data =
          snapshot.docs.map((doc) => VehiclePart.fromJson(doc.data())).toList();
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  static Future<List<CartItem>> getCartItems() async {
    try {
      final snapshot = await _usersCollectionReference
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('cart-items')
          .where('status', isEqualTo: 'cart')
          .get();
      final data =
          snapshot.docs.map((doc) => CartItem.fromJson(doc.data())).toList();
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  static Future<bool> buyOrdersFromCart() async {
    try {
      final snapshot = await _usersCollectionReference
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('cart-items')
          .get();
      for (var doc in snapshot.docs) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('cart-items')
            .doc(doc.id)
            .update({'status': 'buy'});
      }
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  static Future<void> addPartToUserCart(VehiclePart part) async {
    try {
      await _usersCollectionReference
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('cart-items')
          .doc()
          .set({
        'item-name': part.name,
        'item-price': part.price,
        'item-company': part.company,
        'image': part.image,
        'status': 'cart'
      });
      Fluttertoast.showToast(
          msg: 'Item added to cart',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color.fromARGB(255, 96, 90, 90),
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void removeFromCart(CartItem item) async {
    try {
      final snapshot = await _usersCollectionReference
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('cart-items')
          .get();
      for (var doc in snapshot.docs) {
        if (doc['item-name'] == item.name &&
            doc['item-price'] == item.price &&
            doc['item-company'] == item.company) {
          await _usersCollectionReference
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('cart-items')
              .doc(doc.id)
              .delete();
          Fluttertoast.showToast(
              msg: 'Item removed from cart',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: const Color.fromARGB(255, 96, 90, 90),
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
