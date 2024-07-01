import 'package:flutter/material.dart';

class StudentTile extends StatelessWidget {
  final Map<String, String> student;

  StudentTile({required this.student});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(student["NISN"] ?? ''),
      title: Text(student["Nama"] ?? ''),
      subtitle: Text('${student["Sekolah"]} - ${student["Kelas"]}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Tambahkan logika untuk mengedit
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Tambahkan logika untuk menghapus
            },
          ),
        ],
      ),
    );
  }
}
