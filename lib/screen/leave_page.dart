import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:view_ref/app_color.dart';
import 'package:view_ref/config_widgets/custom_dropdown.dart';
import 'package:view_ref/config_widgets/custom_text_field.dart';
import 'package:view_ref/custom_app_bar.dart';
import 'package:view_ref/extensions.dart';
import 'package:view_ref/mixin/create_leave_mixin.dart';
import 'package:view_ref/model/leave_data.dart';
import 'package:view_ref/model/leave_model.dart';
import 'package:view_ref/riverpod/forms_provider.dart';
import 'package:view_ref/riverpod/theme_provider.dart';
import 'package:view_ref/utils/util.dart';

class CreateLeavePage extends ConsumerStatefulWidget {
  const CreateLeavePage({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateLeavePage> createState() => _CreateLeavePageState();
}

class _CreateLeavePageState extends ConsumerState<CreateLeavePage>
    with LeaveFormMixin {
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(selectedLeaveRuleProvider.notifier).state = null;
      ref.read(startDateProvider.notifier).state = null;
      ref.read(endDateProvider.notifier).state = null;
      ref.read(returnDateProvider.notifier).state = null;
      ref.read(descriptionProvider.notifier).state = '';
    });
  }

String formatDuration(Duration duration) {
  final totalMinutes = duration.inMinutes;
  final days = totalMinutes ~/ (24 * 60);
  final hours = (totalMinutes % (24 * 60)) ~/ 60;
  final minutes = totalMinutes % 60;

  String result = '';
  if (days > 0) result += '$days gün ';
  if (hours > 0) result += '$hours saat ';
  if (minutes > 0) result += '$minutes dakika';
  if (result.isEmpty) result = '0 dakika';
  return result.trim();
}


  @override
  Widget build(BuildContext context) {
    final leaveRules = ref.watch(leaveRulesProvider);
    final startDate = ref.watch(startDateProvider);
    final endDate = ref.watch(endDateProvider);
    final returnDate = ref.watch(returnDateProvider);
    final description = ref.watch(descriptionProvider);
    final totalDuration = ref.watch(totalLeaveDurationProvider);
    final selectedRule = ref.watch(selectedLeaveRuleProvider);
    ref.watch(themeProvider);

    final totalDurationText =
        totalDuration != null ? formatDuration(totalDuration) : '0 saat';

    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: const CustomAppBar(
        title: 'Yeni İzin Oluştur',
        showBackButton: true,
        showLogo: false,
      ),
      body: Padding(
        padding:
            context.paddingHorizontalDefault + context.paddingVerticalDefault,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropdownField<LeaveRule>(
                title: "İzin Türü *",
                hintText: "İzin Türü Seçiniz",
                hintStyle: TextStyle(color: AppColors.cursorColor),
                style: TextStyle(color: AppColors.cursorColor),
                items: leaveRules,
                itemAsString: (rule) => rule.name ?? "İsimsiz Kural",
                provider: selectedLeaveRuleProvider,
              ),
              SizedBox(height: context.defaultValue),

              // Burada toplam izin süresini gün ve saat olarak gösteriyoruz
              CustomTextFormField(
                title: 'Toplam İzin Süresi *',
                readOnly: true,
                controller: TextEditingController(
                  text: totalDurationText,
                ),
                hintText: '0 saat',
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
              ),
              SizedBox(height: context.defaultValue),

              buildDateField(
                context: context,
                title: 'Bitiş Tarihi *',
                date: endDate,
                onDateSelected: (date) {
                  ref.read(endDateProvider.notifier).state = date;
                },
                minTime: startDate ?? DateTime.now(),
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

            

              buildButtons(context, () => Navigator.pop(context), () async {
                if (selectedRule == null) {
                  showFlushbar(
                    context,
                    FlushbarErrorModel(
                      title: 'Uyarı',
                      subtitle: 'Lütfen izin türünü seçiniz',
                    ),
                  );
                  return;
                }
                if (startDate == null) {
                  showFlushbar(
                    context,
                    FlushbarErrorModel(
                      title: 'Uyarı',
                      subtitle: 'Lütfen başlangıç tarihini seçiniz',
                    ),
                  );
                  return;
                }
                if (endDate == null) {
                  showFlushbar(
                    context,
                    FlushbarErrorModel(
                      title: 'Uyarı',
                      subtitle: 'Lütfen bitiş tarihini seçiniz',
                    ),
                  );
                  return;
                }

                // İzin gün sayısını saat bazlı tam gün olarak hesapla (ör: 1 gün 2 saat -> 2 gün)
                final totalDays = totalDuration != null
                    ? (totalDuration.inMinutes / (60 * 24)).ceil()
                    : 0;

                final leaveData = LeaveData(
                  leaveRuleId: selectedRule.id,
                  startDate: startDate.toString(),
                  endDate: endDate.toString(),
                  days: totalDays,
                  description: description,
                  leavePolicyId: selectedRule.leavePolicyId,
                  returnDate: returnDate?.toString(),
                );

                // Buraya leaveData ile API çağrısı veya başka işlem yapabilirsin

                // Örnek başarı mesajı göster
                showFlushbar(
                  context,
                  FlushbarSuccessModel(
                    title: 'Başarılı',
                    subtitle: 'İzin başarıyla oluşturuldu',
                  ),
                );

                // Sayfayı geri kapat
                Navigator.pop(context);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDateTimePicker({
    required BuildContext context,
    required ValueChanged<DateTime> onConfirm,
    DateTime? minTime,
    DateTime? maxTime,
  }) async {
    picker.DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: minTime,
      maxTime: maxTime,
      theme: picker.DatePickerTheme(
        backgroundColor: AppColors.inputBackground,
        itemStyle: TextStyle(
          color: AppColors.textUnselected,
          fontSize: context.responsiveFontSize(0.018, max: 18),
        ),
        doneStyle: TextStyle(
          color: AppColors.primaryColor,
          fontSize: context.responsiveFontSize(0.016, max: 16),
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
    VoidCallback onCancel,
    Future<void> Function() onSubmit,
  ) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: _isSubmitting ? null : onCancel,
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
              side: BorderSide(color: AppColors.inputBorderGrey, width: 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              backgroundColor: AppColors.inputBackground,
            ),
            child: Text(
              'İptal Et',
              style: TextStyle(
                color: AppColors.textUnselected,
                fontSize: context.responsiveFontSize(0.018, max: 16),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(width: context.lowValue),
        Expanded(
          child: ElevatedButton(
            onPressed: _isSubmitting
                ? null
                : () async {
                    setState(() => _isSubmitting = true);
                    await onSubmit();
                    if (mounted) setState(() => _isSubmitting = false);
                  },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: _isSubmitting
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 2.5,
                    ),
                  )
                : Text(
                    'Oluştur',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: context.responsiveFontSize(0.018, max: 16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  void showFlushbar(
    BuildContext context,
    FlushbarNotificationModel notificationModel,
  ) {
    if (!context.mounted) return;

  
  }
}