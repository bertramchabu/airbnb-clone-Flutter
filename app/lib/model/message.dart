import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  final String image;
  final String vendorImages;
  final String name;
  final String date;
  final String description;
  final String duration;

  Message({required this.image, required this.vendorImages, required this.name, required this.date, required this.description, required this.duration});

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      'image': image,
      'vendorImages': vendorImages,
      'name': name,
      'date': date,
      'description': description,
      'duration': duration,
    };
  }
}

// List of example messages
final List<Message> listOfMessages = [
  Message(
    image: "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YXBhcnRtZW50fGVufDB8fDB8fHww&w=1000&q=80",
    vendorImages: "https://images.unsplash.com/photo-1494790108755-2616b612b786?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZSUyMHBvcnRyYWl0fGVufDB8fDB8fHww&w=1000&q=80",
    name: "Sarah Johnson",
    date: "2 hours ago",
    description: "Hi! I'm interested in booking your apartment for next weekend. Is it available?",
    duration: "2 min ago",
  ),
  Message(
    image: "https://images.unsplash.com/photo-1510798831971-661eb04b3739?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhY2glMjBob3VzZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    vendorImages: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHByb2ZpbGUlMjBwb3J0cmFpdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    name: "Carlos Rodriguez",
    date: "1 day ago",
    description: "Thanks for staying with us! We'd love to have you back. Special discount available for returning guests.",
    duration: "1 day ago",
  ),
  Message(
    image: "https://images.unsplash.com/photo-1449824913935-59a10b8d2000?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FiaW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
    vendorImages: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&w=1000&q=80",
    name: "Emily Wilson",
    date: "3 days ago",
    description: "Just wanted to check if you need any recommendations for hiking trails during your stay!",
    duration: "3 days ago",
  ),
  Message(
    image: "https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVudGhvdXNlfGVufDB8fDB8fHww&w=1000&q=80",
    vendorImages: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHByb2ZpbGUlMjBwb3J0cmFpdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    name: "Michael Chen",
    date: "1 week ago",
    description: "Your reservation is confirmed! Here's the check-in information and parking details.",
    duration: "1 week ago",
  ),
  Message(
    image: "https://images.unsplash.com/photo-1502672023488-70e25813eb80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YXBhcnRtZW50fGVufDB8fDB8fHww&w=1000&q=80",
    vendorImages: "https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHByb2ZpbGUlMjBwb3J0cmFpdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    name: "Marie LeBlanc",
    date: "2 weeks ago",
    description: "Thank you for the wonderful review! We're so happy you enjoyed your stay in our studio.",
    duration: "2 weeks ago",
  ),
  Message(
    image: "https://images.unsplash.com/photo-1536376072261-38c75010e6c9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bG9mdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    vendorImages: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHByb2ZpbGUlMjBwb3J0cmFpdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    name: "Alex Thompson",
    date: "1 month ago",
    description: "Quick reminder: Check-out is at 11 AM. We hope you had a great stay!",
    duration: "1 month ago",
  ),
  Message(
    image: "https://images.unsplash.com/photo-1560185127-6ed189bf02f4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8YXBhcnRtZW50fGVufDB8fDB8fHww&w=1000&q=80",
    vendorImages: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHByb2ZpbGUlMjBwb3J0cmFpdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    name: "David Martinez",
    date: "2 months ago",
    description: "We've upgraded our WiFi system. The new password is available in your booking details.",
    duration: "2 months ago",
  ),
  Message(
    image: "https://images.unsplash.com/photo-1516455590571-18256e5bb9ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bG9mdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    vendorImages: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&w=1000&q=80",
    name: "Lisa Park",
    date: "3 months ago",
    description: "Emergency maintenance completed. Everything is back to normal. Sorry for the inconvenience!",
    duration: "3 months ago",
  ),
];

// Function to save messages to Firebase
Future<void> saveMessagesToFirebase() async {
  final collectionRef = FirebaseFirestore.instance.collection("messagesCollection");
  for (final Message message in listOfMessages){
    final String id = DateTime.now().toIso8601String() + Random().nextInt(100).toString();
    try{
      await collectionRef.doc(id).set(message.toMap());
      print("Message ${message.name} saved successfully with ID: $id");
    } catch (e) {
      print("Error saving message ${message.name}: $e");
    }
  }
}