import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:view_ref/app_color.dart';
import 'package:view_ref/config_widgets/custom_dropdown.dart';
import 'package:view_ref/config_widgets/custom_text_field.dart';
import 'package:view_ref/custom_app_bar.dart';
import 'package:view_ref/extensions.dart';
import 'package:view_ref/mixin/create_leave_mixin.dart';
import 'package:view_ref/model/leave_data.dart';
import 'package:view_ref/riverpod/forms_provider.dart';
import 'package:view_ref/riverpod/theme_provider.dart';

class CreateLeavePage extends ConsumerStatefulWidget {
  const CreateLeavePage({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateLeavePage> createState() => _CreateLeavePageState();
}

class _CreateLeavePageState extends ConsumerState<CreateLeavePage> with LeaveFormMixin {
  final selectedLeaveTypeProvider = StateProvider<String?>((ref) => null);

  @override
  Widget build(BuildContext context) {
    final leaveTypes = ref.watch(leaveTypesProvider);
    final selectedLeaveType = ref.watch(selectedLeaveTypeProvider);
    final startDate = ref.watch(startDateProvider);
    final endDate = ref.watch(endDateProvider);
    final returnDate = ref.watch(returnDateProvider);
    final description = ref.watch(descriptionProvider);
    final totalLeaveDays = ref.watch(totalLeaveDaysProvider);
    final themeMode = ref.watch(themeProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite(themeMode),
      appBar: const CustomAppBar(
        title: 'Yeni İzin Oluştur',
        showBackButton: true,
      ),
      body: Padding(
        padding: context.paddingHorizontalDefault + context.paddingVerticalDefault,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropdownField<String>(
                title: "İzin Türü *",
                hintText: "İzin Türü Seçiniz",
                items: ["Yıllık", "Mazeret", "Doğum"],
                provider: selectedLeaveTypeProvider,
              ),
              SizedBox(height: context.defaultValue),

              CustomTextFormField(
                title: 'Toplam İzin Günü *',
                readOnly: true,
                controller: TextEditingController(
                  text: totalLeaveDays.toString(),
                ),
                hintText: '0',
                style: TextStyle(color: AppColors.textUnselected(themeMode)),
                maxLines: 1,
                minLines: 1,
              ),
              SizedBox(height: context.defaultValue),

              buildDateField(
                context: context,
                title: 'Başlangıç Tarihi *',
                date: startDate,
                onDateSelected: (date) {
                  ref.read(startDateProvider.notifier).state = date;

                  final currentEndDate = ref.read(endDateProvider);
                  if (currentEndDate != null && currentEndDate.isBefore(date)) {
                    ref.read(endDateProvider.notifier).state = null;
                  }
                },
                themeMode: themeMode,
              ),
              SizedBox(height: context.defaultValue),

              buildDateField(
                context: context,
                title: 'Bitiş Tarihi *',
                date: endDate,
                onDateSelected: (date) {
                  ref.read(endDateProvider.notifier).state = date;
                },
                themeMode: themeMode,
                minTime: startDate,
              ),
              SizedBox(height: context.defaultValue),

              CustomTextFormField(
                title: 'Açıklama',
                maxLines: 2,
                initialValue: description,
                onChanged: (text) {
                  ref.read(descriptionProvider.notifier).state = text;
                },
                hintText: 'Açıklama',
              ),
              SizedBox(height: context.defaultValue),

              buildDateField(
                context: context,
                title: 'Geri Dönüş Tarihi',
                date: returnDate,
                onDateSelected: (date) {
                  ref.read(returnDateProvider.notifier).state = date;
                },
                themeMode: themeMode,
                minTime: endDate,
              ),
              SizedBox(height: context.defaultValue),

              buildButtons(
                context,
                themeMode, // <- themeMode parametresi burada geçirildi
                () => Navigator.pop(context),
                () async {
                  if (startDate != null && endDate != null) {
                    final leaveData = LeaveData(
                      leaveRuleId: 1,
                      startDate: startDate.toString(),
                      endDate: endDate.toString(),
                      days: totalLeaveDays,
                      description: description ?? '',
                      leavePolicyId: 1,
                      caregiverId: 1,
                      returnDate: returnDate?.toString(),
                    );
                    // leaveData gönderilebilir
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDateTimePicker({
    required BuildContext context,
    required ValueChanged<DateTime> onConfirm,
    required ThemeMode themeMode,
    DateTime? minTime,
    DateTime? maxTime,
  }) async {
    picker.DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: minTime,
      maxTime: maxTime,
      theme: picker.DatePickerTheme(
        backgroundColor: AppColors.inputBackground(themeMode),
        itemStyle: TextStyle(
          color: AppColors.textUnselected(themeMode),
          fontSize: 18,
        ),
        doneStyle: TextStyle(
          color: AppColors.primaryColor(themeMode),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      onConfirm: onConfirm,
      currentTime: DateTime.now(),
      locale: picker.LocaleType.tr,
    );
  }

  Widget buildDateField({
    required BuildContext context,
    required String title,
    required DateTime? date,
    required void Function(DateTime) onDateSelected,
    required ThemeMode themeMode,
    String? hintText,
    DateTime? minTime,
    DateTime? maxTime,
  }) {
    return CustomTextFormField(
      title: title,
      readOnly: true,
      controller: TextEditingController(text: formatDate(date)),
      onTap: () => _showDateTimePicker(
        context: context,
        onConfirm: onDateSelected,
        themeMode: themeMode,
        minTime: minTime,
        maxTime: maxTime,
      ),
      hintText: hintText ?? title,
    );
  }

  String formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year} '
        '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  Widget buildButtons(
    BuildContext context,
    ThemeMode themeMode,
    VoidCallback onCancel,
    VoidCallback onSubmit,
  ) {
    return Row(
      children: [
        // İptal Butonu
        Expanded(
          child: OutlinedButton(
            onPressed: onCancel,
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
              side: BorderSide(color: AppColors.inputBorderGrey(themeMode), width: 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              backgroundColor: AppColors.inputBackground(themeMode),
            ),
            child: Text(
              'İptal Et',
              style: TextStyle(
                color: AppColors.textUnselected(themeMode),
                fontSize: context.defaultValue.clampFont(12, 16),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(width: context.lowValue),

        // Oluştur Butonu
        Expanded(
          child: ElevatedButton(
            onPressed: onSubmit,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
              backgroundColor: AppColors.primaryColor(themeMode),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Text(
              'Oluştur',
              style: TextStyle(
                color: AppColors.whiteColor(themeMode),
                fontSize: context.defaultValue.clampFont(12, 16),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
