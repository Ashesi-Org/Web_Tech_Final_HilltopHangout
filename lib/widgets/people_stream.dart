import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_tech_final_flutter/future_functions.dart';
import 'package:web_tech_final_flutter/widgets/a_post.dart';
import 'package:web_tech_final_flutter/home.dart';

class PeopleWidget extends StatefulWidget {
  @override
  _PeopleWidgetState createState() => _PeopleWidgetState();
}

class _PeopleWidgetState extends State<PeopleWidget> {
  late Stream<QuerySnapshot> _usersStream;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _usersStream =
        FirebaseFirestore.instance.collection('users_data').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 60,
          child: TextField(
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 0, 201, 183),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              labelText: 'Search',
              hintStyle: TextStyle(color: Colors.black),
              hintText: 'Search Users...',
              prefixIcon: Icon(
                Icons.search,
                size: 20,
                color: Color.fromARGB(255, 0, 201, 183),
              ),
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (!snapshot.hasData) {
                return Text('Loading...');
              }

              final filteredDocs = snapshot.data!.docs.where((doc) =>
                  doc['full_name']
                      .toLowerCase()
                      .contains(_searchQuery.toLowerCase()));

              return ListView.builder(
                itemCount: filteredDocs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = filteredDocs.elementAt(index);
                  return Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.1,
                          ),
                          image: const DecorationImage(
                            image: AssetImage('images/profile.jpeg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          getUser(document['user_id'], context);
                        },
                        child: Text(
                          document['full_name'],
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 201, 183),
                            fontSize: 20,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
