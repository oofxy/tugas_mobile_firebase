import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String formatTimestamp(dynamic timestamp, bool hasSeconds) {
  if (timestamp == null) {
    return 'Unknown Date';
  } else if (hasSeconds) {
    final DateTime dateTime = (timestamp as Timestamp).toDate();
    return DateFormat('MMMM d y, h:mm a').format(dateTime);
  } else {
    final DateTime dateTime = (timestamp as Timestamp).toDate();
    return DateFormat('MMMM d, y').format(dateTime);
  }
}