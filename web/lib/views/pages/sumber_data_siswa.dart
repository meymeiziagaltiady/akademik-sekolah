import 'package:flutter/material.dart';

class StudentDataSource extends DataTableSource {
  final List<Map<String, String>> students;

  StudentDataSource({required this.students});

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= students.length) return null;
    final student = students[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(student['NISN']!)),
        DataCell(Text(student['Nama']!)),
        DataCell(Text(student['Sekolah']!)),
        DataCell(Text(student['Kelas']!)),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit, color: Colors.blue),
                onPressed: () {
                  // Tambahkan logika untuk edit siswa
                },
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // Tambahkan logika untuk hapus siswa
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => students.length;

  @override
  int get selectedRowCount => 0;
}
