import 'package:flutter/material.dart';
import 'package:view_ref/extensions.dart';

class DashboardBottomSheet extends StatefulWidget {
  final Map<String, dynamic> item;

  const DashboardBottomSheet({Key? key, required this.item}) : super(key: key);

  @override
  State<DashboardBottomSheet> createState() => _DashboardBottomSheetState();
}

class _DashboardBottomSheetState extends State<DashboardBottomSheet> {
  String? _selectedLeaveType;
  final TextEditingController _daysController = TextEditingController();

  final List<String> _leaveTypes = [
    "Yıllık İzin",
    "Hastalık İzni",
    "Mazeret İzni",
  ];

  @override
  void dispose() {
    _daysController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.defaultValue),
      height: context.dynamicHeight(0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.item['label'],
            style: TextStyle(
              fontSize: context.dynamicHeight(0.02),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: context.lowValue),

          // İzin Türü Seçimi
          Text(
            "İzin Türü",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: context.dynamicHeight(0.018)),
          ),
          SizedBox(height: context.lowValue / 2),
          DropdownButtonFormField<String>(
            value: _selectedLeaveType,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              contentPadding: EdgeInsets.symmetric(horizontal: context.defaultValue, vertical: context.lowValue),
            ),
            hint: const Text("Seçiniz"),
            items: _leaveTypes
                .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedLeaveType = value;
              });
            },
          ),

          SizedBox(height: context.lowValue),

          // Kaç Gün Olacağı
          Text(
            "Kaç Gün",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: context.dynamicHeight(0.018)),
          ),
          SizedBox(height: context.lowValue / 2),
          TextField(
            controller: _daysController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Gün sayısı",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              contentPadding: EdgeInsets.symmetric(horizontal: context.defaultValue, vertical: context.lowValue),
            ),
          ),

          const Spacer(),

          // Gönder Butonu
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_selectedLeaveType == null || _daysController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Lütfen tüm alanları doldurun")),
                  );
                  return;
                }
                // Burada formu backend veya state yönetimine gönder
                print("İzin Türü: $_selectedLeaveType, Gün: ${_daysController.text}");
                Navigator.pop(context);
              },
              child: const Text("Gönder"),
            ),
          ),
        ],
      ),
    );
  }
}