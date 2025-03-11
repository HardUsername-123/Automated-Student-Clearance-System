import 'package:flutter/material.dart';

class Clearance extends StatefulWidget {
  const Clearance({super.key});

  @override
  State<Clearance> createState() => _ClearanceState();
}

class _ClearanceState extends State<Clearance> {
  // Dummy data for the table
  final List<Map<String, String>> courseData = [
    {
      'courseCode': 'CS101',
      'section': 'A',
      'requirements': 'Calculator program',
      'instructor': 'Girly Aguilar',
      'status': 'Sign',
    },
    {
      'courseCode': 'CC107',
      'section': 'B',
      'requirements': 'POS System',
      'instructor': 'Shayne Llup',
      'status': 'In complete',
    },
    {
      'courseCode': 'SE101',
      'section': 'A',
      'requirements': 'Hardware System',
      'instructor': 'Jone Casipong',
      'status': 'Sign',
    },
    {
      'courseCode': 'CS Elect 1',
      'section': 'C',
      'requirements': 'CS101',
      'instructor': 'Rosalyn Luzon',
      'status': 'Missing',
    },
    // Add more dummy data as needed
  ];

  // Method to get color based on status
  Color getStatusColor(String status) {
    switch (status) {
      case 'Sign':
        return Colors.green;
      case 'In complete':
        return Colors.orange;
      case 'Missing':
        return Colors.red;
      default:
        return Colors.black; // Default color
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check the screen width to decide the layout
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clearance'),
        leading: Icon(Icons.school),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              isMobile
                  ? ListView.builder(
                    itemCount: courseData.length,
                    itemBuilder: (context, index) {
                      final course = courseData[index];

                      // Get the color based on the status
                      Color statusColor = getStatusColor(course['status']!);

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Course Code: ${course['courseCode']}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text('Section: ${course['section']}'),
                                Text('Requirements: ${course['requirements']}'),
                                Text('Instructor: ${course['instructor']}'),
                                Row(
                                  children: [
                                    const Text('Status: '),
                                    Text(
                                      course['status']!,
                                      style: TextStyle(
                                        color:
                                            statusColor, // Apply color to status only
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                  : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: 20, // Adjust column spacing
                      headingRowColor: WidgetStateProperty.all(
                        Colors.blueAccent,
                      ), // Header background color
                      columns: const [
                        DataColumn(label: Text('Course Code')),
                        DataColumn(label: Text('Section')),
                        DataColumn(label: Text('Requirements')),
                        DataColumn(label: Text('Instructor')),
                        DataColumn(label: Text('Status')),
                      ],
                      rows:
                          courseData.map((course) {
                            // Get the color based on the status
                            Color statusColor = getStatusColor(
                              course['status']!,
                            );

                            return DataRow(
                              cells: [
                                DataCell(Text(course['courseCode']!)),
                                DataCell(Text(course['section']!)),
                                DataCell(Text(course['requirements']!)),
                                DataCell(Text(course['instructor']!)),
                                DataCell(
                                  Text(
                                    course['status']!,
                                    style: TextStyle(
                                      color: statusColor,
                                    ), // Apply color to status only
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                    ),
                  ),
        ),
      ),
    );
  }
}
