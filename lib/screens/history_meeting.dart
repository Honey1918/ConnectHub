import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone/resources/firestoremethods.dart';
//import 'package:zoom_clone/resources/firestoremethods.dart';

class HistoryMeeting extends StatelessWidget {
  const HistoryMeeting({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestoremethods().meetingHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(
                'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}'),
            subtitle: Text(
              'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
            ),
          ),
        );
      },
    );
  }
}
