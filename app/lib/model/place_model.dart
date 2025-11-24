import 'dart:core';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> savePlacesToFirebase() async {
  final collectionRef = FirebaseFirestore.instance.collection("airbnbAppCollection");
  for (final Place place in listOfPlace){
    final String id = DateTime.now().toIso8601String() + Random().nextInt(100).toString();
    collectionRef.doc("das");
    try{
      final doc = await collectionRef.doc(id).get();
      if (doc.exists){
        print("Document with id $id already exists. Skipping...");
        continue;
      }

      await collectionRef.doc(id).set(place.toMap());
      print("Document added successfully ${doc.id}");
    }
    catch(e){
      print("Error checking document not added: $e");
    }
  }
}

class Place{
  final String title;
  bool isActive = false;
  final String image;
  final double rating;
  final String date;
  final int price;
  final String address;
  final String vendor;
  final String vendorProfession;
  final String vendorProfile;
  final int review;
  final String bedAndBathroom;
  final int yearOfHosting;
  final double latitude;
  final double longitude;
  final List<String> imageUrls;
  Place({required this.title, required this.image, required this.rating, required this.date, required this.price,required this.address,  required this.vendor, required this.vendorProfession, required this.vendorProfile, required this.review,required this.bedAndBathroom, required this.yearOfHosting,required this.latitude, required this.longitude,required this.imageUrls});

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      'title': title,
      'isActive': isActive,
      'image': image,
      'rating': rating,
      'date': date,
      'price': price,
      'address': address,
      'vendor': vendor,
      'vendorProfession': vendorProfession,
      'vendorProfile': vendorProfile,
      'review': review,
      'bedAndBathroom': bedAndBathroom,
      'yearOfHosting': yearOfHosting,
      'latitude': latitude,
      'longitude': longitude,
      'imageUrls': imageUrls,
    };
  }


}
final List<Place> listOfPlace = [
  Place(
    title: "Modern Apartment in Downtown",
    image: "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YXBhcnRtZW50fGVufDB8fDB8fHww&w=1000&q=80",
    rating: 4.8,
    date: "Nov 12-17",
    price: 120,
    address: "123 Main St, New York, NY",
    vendor: "Sarah Johnson",
    vendorProfession: "Architect",
    vendorProfile: "https://images.unsplash.com/photo-1494790108755-2616b612b786?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZSUyMHBvcnRyYWl0fGVufDB8fDB8fHww&w=1000&q=80",
    review: 142,
    bedAndBathroom: "2 beds • 1 bath",
    yearOfHosting: 3,
    latitude: 40.7128,
    longitude: -74.0060,
    imageUrls: [
      "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YXBhcnRtZW50fGVufDB8fDB8fHww&w=1000&q=80",
      "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGFwYXJ0bWVudHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
      "https://images.unsplash.com/photo-1484154218962-a197022b5858?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGFwYXJ0bWVudHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"
    ],
  ),
  Place(
    title: "Cozy Beachfront Villa",
    image: "https://images.unsplash.com/photo-1510798831971-661eb04b3739?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhY2glMjBob3VzZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    rating: 4.9,
    date: "Dec 1-8",
    price: 250,
    address: "456 Ocean Drive, Miami, FL",
    vendor: "Carlos Rodriguez",
    vendorProfession: "Surf Instructor",
    vendorProfile: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHByb2ZpbGUlMjBwb3J0cmFpdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    review: 89,
    bedAndBathroom: "3 beds • 2 baths",
    yearOfHosting: 5,
    latitude: 25.7617,
    longitude: -80.1918,
    imageUrls: [
      "https://images.unsplash.com/photo-1510798831971-661eb04b3739?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhY2glMjBob3VzZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
      "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YmVhY2glMjBob3VzZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
      "https://images.unsplash.com/photo-1480714378408-67cf0d13bc1b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2l0eXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"
    ],
  ),
  Place(
    title: "Mountain View Cabin",
    image: "https://images.unsplash.com/photo-1449824913935-59a10b8d2000?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FiaW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
    rating: 4.7,
    date: "Jan 15-20",
    price: 180,
    address: "789 Mountain Road, Aspen, CO",
    vendor: "Emily Wilson",
    vendorProfession: "Park Ranger",
    vendorProfile: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&w=1000&q=80",
    review: 203,
    bedAndBathroom: "1 bed • 1 bath",
    yearOfHosting: 7,
    latitude: 39.1911,
    longitude: -106.8175,
    imageUrls: [
      "https://images.unsplash.com/photo-1449824913935-59a10b8d2000?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FiaW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
      "https://images.unsplash.com/photo-1578662996442-48f60103fc96?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2FiaW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
      "https://images.unsplash.com/photo-1586375300773-8384e3e4916f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y2FiaW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"
    ],
  ),
  Place(
    title: "Luxury Penthouse with City Views",
    image: "https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVudGhvdXNlfGVufDB8fDB8fHww&w=1000&q=80",
    rating: 4.9,
    date: "Feb 5-12",
    price: 450,
    address: "101 Skyline Blvd, Los Angeles, CA",
    vendor: "Michael Chen",
    vendorProfession: "Real Estate Developer",
    vendorProfile: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHByb2ZpbGUlMjBwb3J0cmFpdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    review: 67,
    bedAndBathroom: "4 beds • 3 baths",
    yearOfHosting: 2,
    latitude: 34.0522,
    longitude: -118.2437,
    imageUrls: [
      "https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVudGhvdXNlfGVufDB8fDB8fHww&w=1000&q=80",
      "https://images.unsplash.com/photo-1513584684374-8bab748fbf90?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cGVudGhvdXNlfGVufDB8fDB8fHww&w=1000&q=80",
      "https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXBhcnRtZW50fGVufDB8fDB8fHww&w=1000&q=80"
    ],
  ),
  Place(
    title: "Charming Studio in Historic District",
    image: "https://images.unsplash.com/photo-1502672023488-70e25813eb80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YXBhcnRtZW50fGVufDB8fDB8fHww&w=1000&q=80",
    rating: 4.6,
    date: "Mar 10-15",
    price: 85,
    address: "222 French Quarter, New Orleans, LA",
    vendor: "Marie LeBlanc",
    vendorProfession: "Artist",
    vendorProfile: "https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHByb2ZpbGUlMjBwb3J0cmFpdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    review: 156,
    bedAndBathroom: "1 bed • 1 bath",
    yearOfHosting: 4,
    latitude: 29.9511,
    longitude: -90.0715,
    imageUrls: [
      "https://images.unsplash.com/photo-1502672023488-70e25813eb80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YXBhcnRtZW50fGVufDB8fDB8fHww&w=1000&q=80",
      "https://images.unsplash.com/photo-1560185127-6ed189bf02f4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8YXBhcnRtZW50fGVufDB8fDB8fHww&w=1000&q=80",
      "https://images.unsplash.com/photo-1560185007-cde436f6a4d0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YXBhcnRtZW50fGVufDB8fDB8fHww&w=1000&q=80"
    ],
  ),
  Place(
    title: "Modern Loft in Tech District",
    image: "https://images.unsplash.com/photo-1536376072261-38c75010e6c9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bG9mdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    rating: 4.8,
    date: "Apr 20-25",
    price: 195,
    address: "333 Silicon Valley, San Francisco, CA",
    vendor: "Alex Thompson",
    vendorProfession: "Software Engineer",
    vendorProfile: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHByb2ZpbGUlMjBwb3J0cmFpdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    review: 98,
    bedAndBathroom: "2 beds • 2 baths",
    yearOfHosting: 3,
    latitude: 37.7749,
    longitude: -122.4194,
    imageUrls: [
      "https://images.unsplash.com/photo-1536376072261-38c75010e6c9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bG9mdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
      "https://images.unsplash.com/photo-1516455590571-18256e5bb9ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bG9mdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
      "https://images.unsplash.com/photo-1484154218962-a197022b5858?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGFwYXJ0bWVudHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"
    ],
  ),
];
