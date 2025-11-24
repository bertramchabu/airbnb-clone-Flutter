import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'image': image,
    };
  }
}

// List of example categories for Airbnb-style app
final List<Category> listOfCategories = [
  Category(
    title: "Beach",
    image: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhY2h8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
  ),
  Category(
    title: "Mountain",
    image: "https://images.unsplash.com/photo-1464822759844-4c8c2c93a7e7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bW91bnRhaW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
  ),
  Category(
    title: "City",
    image: "https://images.unsplash.com/photo-1449824913935-59a10b8d2000?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2l0eXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
  ),
  Category(
    title: "Luxury",
    image: "https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bHV4dXJ5JTIwaG9tZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
  ),
  Category(
    title: "Cabins",
    image: "https://images.unsplash.com/photo-1586375300773-8384e3e4916f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y2FiaW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
  ),
  Category(
    title: "Tiny Homes",
    image: "https://images.unsplash.com/photo-1567496898669-ee935f5f647a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dGlueSUyMGhvbWV8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
  ),
  Category(
    title: "Lakefront",
    image: "https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bGFrZXxlbnwwfHwwfHx8MA%3D3D&w=1000&q=80",
  ),
  Category(
    title: "Trending",
    image: "https://images.unsplash.com/photo-1510798831971-661eb04b3739?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dHJlbmRpbmclMjBkZXN0aW5hdGlvbnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
  ),
  Category(
    title: "Amazing Views",
    image: "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YW1hemluZyUyMHZpZXdzfGVufDB8fDB8fHww&w=1000&q=80",
  ),
  Category(
    title: "Tropical",
    image: "https://images.unsplash.com/photo-1505142468610-359e7d316be0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dHJvcGljYWx8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
  ),
  Category(
    title: "Skiing",
    image: "https://images.unsplash.com/photo-1511882150382-421056c89033?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2tpaW5nfGVufDB8fDB8fHww&w=1000&q=80",
  ),
  Category(
    title: "Camping",
    image: "https://images.unsplash.com/photo-1478131143081-80f7f84ca84d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FtcGluZ3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
  ),
  Category(
    title: "Historical",
    image: "https://images.unsplash.com/photo-1502602898536-47ad22581b52?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aGlzdG9yaWNhbHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
  ),
  Category(
    title: "Countryside",
    image: "https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y291bnRyeXNpZGV8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
  ),
  Category(
    title: "Islands",
    image: "https://images.unsplash.com/photo-1539650116574-75c0c6d73f6e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aXNsYW5kc3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
  ),
];

// Function to save categories to Firebase
Future<void> saveCategoriesToFirebase() async {
  final collectionRef = FirebaseFirestore.instance.collection("categoriesCollection");
  for (final Category category in listOfCategories){
    final String id = DateTime.now().toIso8601String() + Random().nextInt(100).toString();
    try{
      await collectionRef.doc(id).set(category.toMap());
      print("Category ${category.title} saved successfully with ID: $id");
    } catch (e) {
      print("Error saving category ${category.title}: $e");
    }
  }
}