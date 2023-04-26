import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_tech_final_flutter/widgets/a_post.dart';

class FeedWidget extends StatefulWidget {
  @override
  _FeedWidgetState createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
      .collection('comments')
      .orderBy('timestamp', descending: true)
      .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData) {
          return Text('Loading...');
        }

        return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = snapshot.data!.docs[index];

              // Add another stream builder to get user's data
              return StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users_data')
                    .where('email', isEqualTo: document['email'])
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> userSnapshot) {
                  if (userSnapshot.hasError) {
                    return Text('Error: ${userSnapshot.error}');
                  }
                  if (!userSnapshot.hasData) {
                    return Text('Loading...');
                  }

                  // Retrieve user's name from the 'users' collection
                  String userName =
                      userSnapshot.data!.docs[0]['full_name'] ?? "Unknown User";

                  return PostCard(
                    timestamp: document['timestamp'],
                    text: document['text'],
                    name: userName,
                  );
                },
              );
            },
          
        );
      },
    );
  }
}
