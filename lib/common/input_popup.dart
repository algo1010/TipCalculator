import '../config/theme_color.dart';
import '../config/theme_font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputPopup extends StatefulWidget {
  final String title;
  final String? message;
  final VoidCallback? onCancel;
  final void Function(int)? onChoose;

  const InputPopup({
    super.key,
    required this.title,
    this.message,
    this.onCancel,
    this.onChoose,
  });

  @override
  State<InputPopup> createState() => _InputPopupState();
}

class _InputPopupState extends State<InputPopup> {
  final TextEditingController controller = TextEditingController();
  var isError = false;
  var isAllowChoose = false;
  var value = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(handleTextChange);
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(handleTextChange);
  }

  void handleTextChange() {
    final value = int.tryParse(controller.text);
    setState(() {
      if (value != null && value <= 100) {
        isError = false;
        this.value = value;
        isAllowChoose = true;
      } else {
        if (controller.text.isNotEmpty) {
          isError = true;
        } else {
          isError = false;
          isAllowChoose = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.title,
                      style: ThemeFont.demibold(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    if (widget.message != null)
                      Text(
                        widget.message!,
                        textAlign: TextAlign.center,
                      ),
                    const SizedBox(height: 20),
                    TextField(
                      enableInteractiveSelection: false,
                      controller: controller,
                      style: ThemeFont.bold(fontSize: 24),
                      decoration: InputDecoration(
                        hintText: '25',
                        border: const OutlineInputBorder(),
                        errorText: isError ? "Maximum is 100%" : null,
                        errorStyle: ThemeFont.demibold(fontSize: 11),
                        suffixText: '%',
                        suffixStyle: ThemeFont.bold(fontSize: 18),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    //Buttons
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(0, 45),
                              backgroundColor: ThemeColor.separator,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: _onCancel,
                            child: Text(
                              'Cancel',
                              style: ThemeFont.demibold(fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color(0xFFFFFFFF),
                              backgroundColor: ThemeColor.primary,
                              minimumSize: const Size(0, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              shadowColor: Colors.transparent,
                            ),
                            onPressed:
                                !isAllowChoose || isError ? null : _onChoose,
                            child: Text(
                              'Choose',
                              style: ThemeFont.demibold(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onCancel() {
    Get.back();
  }

  void _onChoose() {
    if (widget.onChoose != null) {
      widget.onChoose!(value);
    }
    Get.back();
  }
}
