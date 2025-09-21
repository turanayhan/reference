import 'package:flutter/material.dart';
import 'package:view_ref/dialog/detail_dialog_extensions.dart';
import 'package:view_ref/home_widget/permissions_widget.dart';
import 'package:view_ref/list.dart';
import 'package:view_ref/model/leave_data.dart';

class PermissionsPage extends StatelessWidget {
  const PermissionsPage({super.key});

  void _showLeaveDialog(BuildContext context, LeaveData leave) {

    DetailDialogFactory.showLeave(context, leave);

  }

  @override
  Widget build(BuildContext context) {
    final leaves = LeaveDummyData.getLeaves();

    return Scaffold(
      appBar: AppBar(title: const Text("İzinlerim")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: leaves.length,
        itemBuilder: (context, index) {
          final leave = leaves[index];
          return GestureDetector(
            onTap: () => _showLeaveDialog(context, leave),
            child: PermissionsItemCard(leave: leave),
          );
        },
      ),
    );
  }
}



