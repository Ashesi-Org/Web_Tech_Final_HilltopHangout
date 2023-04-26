import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String timestamp;
  final String name;
  final String text;

  const PostCard(
      {required this.timestamp, required this.name, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
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
                        SizedBox(width: 10),
                        Text.rich(
                          TextSpan(
                            text: name,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 134, 0, 123),
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: ' '), // Add a space character
                              TextSpan(
                                text: timestamp,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 10,
                      ),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.favorite_border_sharp,
                        color: Color.fromARGB(255, 0, 201, 183)),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
