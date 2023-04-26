import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_tech_final_flutter/globals.dart';
import 'a_post.dart';

class indivPostFeed extends StatefulWidget {
  @override
  _indivPostFeedState createState() => _indivPostFeedState();
}

class _indivPostFeedState extends State<indivPostFeed> {
  late String userEmail;

   @override
  void initState(){
    super.initState();
    userEmail = loggedInUser!.email;
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('comments') 
            .where('email', isEqualTo: userEmail)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData) {
            return Text('Loading...');
          }

          // Display the user's details
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = snapshot.data!.docs[index];
              return PostCard(
                    timestamp: document['timestamp'],
                    text: document['text'],
                    name: loggedInUser!.full_name,
                  );
            },
          );
        },
      );
    
  }
}
