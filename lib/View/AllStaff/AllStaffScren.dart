// import 'package:again/controller/staff_controller.dart';
// import 'package:again/model/staff_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AllStaffScreen extends StatelessWidget {
//   const AllStaffScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<StaffController>(
//       init: StaffController(),
//       builder: (controller) {
//         return Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             foregroundColor: Colors.white,
//             backgroundColor: const Color(0xFF5E35B1),
//             title: Text(
//               'All Staff',
//               style: GoogleFonts.poppins(
//                   fontWeight: FontWeight.w600, fontSize: 20),
//             ),
//             centerTitle: true,
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Search Staff...',
//                     hintStyle: GoogleFonts.poppins(),
//                     prefixIcon: const Icon(Icons.search),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     fillColor: Colors.white,
//                     filled: true,
//                   ),
//                   onChanged: (value) {
//                     controller.searchVal = value;
//                     controller.tempSearchList();
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: controller.searchVal.isNotEmpty
//                         ? controller.staffListTemp.length
//                         : controller.staffList.length,
//                     itemBuilder: (context, index) {
//                       Staff staff = controller.searchVal.isNotEmpty
//                           ? controller.staffListTemp[index]
//                           : controller.staffList[index];
//                       return Card(
//                         elevation: 4,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(16),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   CircleAvatar(
//                                     radius: 28,
//                                     backgroundColor: const Color(0xFFD1C4E9),
//                                     // child: const Icon(
//                                     //   Icons.person,
//                                     //   size: 28,
//                                     //   color: Color(0xFF5E35B1),
//                                     // ),
//                                     child: Text(
//                                       staff.firstName!
//                                           .substring(0, 2)
//                                           .toUpperCase()
//                                           .toString(),
//                                       style: GoogleFonts.poppins(
//                                           color: Color(0xff5e35b1),
//                                           fontSize: 24,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                   const SizedBox(width: 12),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         '${staff.firstName} ${staff.lastName}',
//                                         style: GoogleFonts.poppins(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold,
//                                           color: const Color(0xFF4527A0),
//                                         ),
//                                       ),
//                                       Text(
//                                         '${staff.role}',
//                                         style: GoogleFonts.poppins(
//                                           fontSize: 14,
//                                           color: Colors.grey.shade700,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 12),
//                               const Divider(color: Colors.grey, height: 1),
//                               const SizedBox(height: 8),
//                               _buildDetailRow('Email', '${staff.email}'),
//                               _buildDetailRow('Phone', '${staff.phone}'),
//                               _buildDetailRow('Block', 'A'),
//                               const SizedBox(height: 12),
//                               SizedBox(
//                                 width: double.infinity,
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     showDialog(
//                                       context: context,
//                                       builder: (context) => AlertDialog(
//                                         title: Text(
//                                           'Delete  ${staff.firstName} ${staff.lastName}?',
//                                           style: GoogleFonts.poppins(),
//                                         ),
//                                         content: Text(
//                                           'Are you sure you want to delete this staff member?',
//                                           style: GoogleFonts.poppins(),
//                                         ),
//                                         actions: [
//                                           TextButton(
//                                             onPressed: () =>
//                                                 Navigator.pop(context),
//                                             child: Text('Cancel',
//                                                 style: GoogleFonts.poppins(
//                                                     color: Colors.grey)),
//                                           ),
//                                           ElevatedButton(
//                                               onPressed: () {
//                                                 controller.deleteStaff(
//                                                     staff.staffId ?? '');
//                                                 Navigator.pop(context);
//                                               },
//                                               child: Text('Delete',
//                                                   style: GoogleFonts.poppins(
//                                                       fontWeight:
//                                                           FontWeight.w500)),
//                                               style: ElevatedButton.styleFrom(
//                                                 backgroundColor: Colors.red,
//                                                 foregroundColor: Colors.white,
//                                               )),
//                                         ],
//                                       ),
//                                     );
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Color(0XFF5E35B1),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                   ),
//                                   child: Text(
//                                     'Delete',
//                                     style: GoogleFonts.poppins(
//                                         color: Colors.white,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildDetailRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             '$label:',
//             style: GoogleFonts.poppins(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//               color: Colors.grey.shade700,
//             ),
//           ),
//           Text(
//             value,
//             style: GoogleFonts.poppins(
//               fontSize: 14,
//               color: Colors.grey.shade700,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:again/controller/staff_controller.dart';
import 'package:again/model/staff_model.dart';

class AllStaffScreen extends StatelessWidget {
  const AllStaffScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StaffController>(
      init: StaffController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFFF5F5F5),
          appBar: AppBar(
            elevation: 0,
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF5E35B1),
            title: Text(
              'All Staff',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Staff...',
                      hintStyle: GoogleFonts.poppins(),
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onChanged: (value) {
                      controller.searchVal = value;
                      controller.tempSearchList();
                    },
                  ),
                ),
                const SizedBox(height: 16),
                // Staff List
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.searchVal.isNotEmpty
                        ? controller.staffListTemp.length
                        : controller.staffList.length,
                    itemBuilder: (context, index) {
                      Staff staff = controller.searchVal.isNotEmpty
                          ? controller.staffListTemp[index]
                          : controller.staffList[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header Section
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: const Color(0xFF5E35B1)
                                        .withOpacity(0.1),
                                    radius: 25,
                                    child: Text(
                                      '${staff.firstName?.substring(0, 1)}${staff.lastName?.substring(0, 1)}',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFF5E35B1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${staff.firstName} ${staff.lastName}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        staff.role ?? '',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'CONTACT INFORMATION',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF5E35B1),
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8F7FC),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    _buildInfoRow(Icons.email_outlined,
                                        staff.email ?? ''),
                                    const SizedBox(height: 8),
                                    _buildInfoRow(Icons.phone_outlined,
                                        staff.phone ?? ''),
                                    const SizedBox(height: 8),
                                    _buildInfoRow(
                                        Icons.business_center_outlined,
                                        ' ${staff.role ?? ""}'),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text(
                                          'Delete ${staff.firstName} ${staff.lastName}?',
                                          style: GoogleFonts.poppins(),
                                        ),
                                        content: Text(
                                          'Are you sure you want to delete this staff member?',
                                          style: GoogleFonts.poppins(),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text(
                                              'Cancel',
                                              style: GoogleFonts.poppins(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              controller.deleteStaff(
                                                  staff.staffId ?? '');
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xFF5E35B1),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: Text(
                                              'Delete',
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF5E35B1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'Delete',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: const Color(0xFF5E35B1),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
