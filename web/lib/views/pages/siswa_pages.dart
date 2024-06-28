import 'package:aplikasi_sekolah/controllers/siswa_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aplikasi_sekolah/views/components/sidebar.dart';  
import 'sumber_data_siswa.dart';

class StudentPage extends StatefulWidget {
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final StudentController controller = Get.put(StudentController());
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _rowsOffset = 0;
  int? _sortColumnIndex;
  bool _sortAscending = true;

  void _sort<T>(Comparable<T> Function(Map<String, String> student) getField, int columnIndex, bool ascending) {
    controller.students.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }
      final aValue = getField(a);
      final bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Daftar Siswa',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              // Tambahkan logika untuk menambahkan siswa
                            },
                            icon: Icon(Icons.add),
                            label: Text('Add'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton.icon(
                            onPressed: () {
                              // Tambahkan logika untuk upload
                            },
                            icon: Icon(Icons.upload),
                            label: Text('Upload'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Obx(() {
                    if (controller.students.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    }
                    int rowCount = controller.students.length;
                    return Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(minWidth: Get.width - 100),
                              child: DataTable(
                                sortColumnIndex: _sortColumnIndex,
                                sortAscending: _sortAscending,
                                columns: [
                                  DataColumn(
                                    label: Row(
                                      children: [
                                        Text('NISN'),
                                        Icon(
                                          _sortColumnIndex == 0
                                              ? (_sortAscending
                                                  ? Icons.arrow_drop_up
                                                  : Icons.arrow_drop_down)
                                              : Icons.unfold_more,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                    onSort: (columnIndex, ascending) {
                                      _sort<String>((student) => student['NISN']!, columnIndex, ascending);
                                    },
                                  ),
                                  DataColumn(
                                    label: Row(
                                      children: [
                                        Text('Nama'),
                                        Icon(
                                          _sortColumnIndex == 1
                                              ? (_sortAscending
                                                  ? Icons.arrow_drop_up
                                                  : Icons.arrow_drop_down)
                                              : Icons.unfold_more,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                    onSort: (columnIndex, ascending) {
                                      _sort<String>((student) => student['Nama']!, columnIndex, ascending);
                                    },
                                  ),
                                  DataColumn(
                                    label: Row(
                                      children: [
                                        Text('Sekolah'),
                                        Icon(
                                          _sortColumnIndex == 2
                                              ? (_sortAscending
                                                  ? Icons.arrow_drop_up
                                                  : Icons.arrow_drop_down)
                                              : Icons.unfold_more,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                    onSort: (columnIndex, ascending) {
                                      _sort<String>((student) => student['Sekolah']!, columnIndex, ascending);
                                    },
                                  ),
                                  DataColumn(
                                    label: Row(
                                      children: [
                                        Text('Kelas'),
                                        Icon(
                                          _sortColumnIndex == 3
                                              ? (_sortAscending
                                                  ? Icons.arrow_drop_up
                                                  : Icons.arrow_drop_down)
                                              : Icons.unfold_more,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                    onSort: (columnIndex, ascending) {
                                      _sort<String>((student) => student['Kelas']!, columnIndex, ascending);
                                    },
                                  ),
                                  DataColumn(
                                    label: Text('Aksi'),
                                  ),
                                ],
                                rows: controller.students
                                    .skip(_rowsOffset)
                                    .take(_rowsPerPage)
                                    .map(
                                      (student) => DataRow(
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
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Rows per page:'),
                            SizedBox(width: 10),
                            DropdownButton<int>(
                              value: _rowsPerPage,
                              items: [5, 10, 20]
                                  .map((value) => DropdownMenuItem<int>(
                                        value: value,
                                        child: Text(value.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _rowsPerPage = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: _rowsOffset == 0
                                  ? null
                                  : () {
                                      setState(() {
                                        _rowsOffset = _rowsOffset - _rowsPerPage;
                                      });
                                    },
                            ),
                            Text(
                              '${_rowsOffset + 1}-${_rowsOffset + _rowsPerPage > rowCount ? rowCount : _rowsOffset + _rowsPerPage} of $rowCount',
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: _rowsOffset + _rowsPerPage >= rowCount
                                  ? null
                                  : () {
                                      setState(() {
                                        _rowsOffset = _rowsOffset + _rowsPerPage;
                                      });
                                    },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
