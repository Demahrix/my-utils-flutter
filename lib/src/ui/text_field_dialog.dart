import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Affiche un dialog avec un textfield et les button "enregister" et "annuler" à l'intérieur
Future<String?> showTextFieldDialog({
    required BuildContext context,
    required String title,
    required String placeholder,
    String initialValue = "",
    String primaryLabel = "Enregister",
    String secondaryLabel = "Annuler",
    String Function(String?)? validator,
    List<TextInputFormatter> inputFormatter = const []
  }) {
  return showDialog<String?>(
    context: context,
    builder: (_) => _TextFieldDialog(
      title: title,
      placeholder: placeholder,
      initialValue: initialValue,
      primaryLabel: primaryLabel,
      secondaryLabel: secondaryLabel,
      validator: validator,
      inputFormatter: inputFormatter,
    )
  );
}

class _TextFieldDialog extends StatefulWidget {

  final String title;
  final String placeholder;
  final String initialValue;
  final String primaryLabel;
  final String secondaryLabel;
  final String Function(String?)? validator;
  final List<TextInputFormatter> inputFormatter;

  const _TextFieldDialog({
    required this.title,
    required this.placeholder,
    required this.initialValue,
    required this.primaryLabel,
    required this.secondaryLabel,
    required this.validator,
    this.inputFormatter = const []
  });

  @override
  __TextFieldDialogState createState() => __TextFieldDialogState();
}

class __TextFieldDialogState extends State<_TextFieldDialog> {

  String? _value;
  String? _errorText;

  static final ButtonStyle _buttonStyle = ButtonStyle(
    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0)),
    elevation: MaterialStateProperty.all(0.0)
  );

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  void _onChanged(String value) {
    setState(() {
      _value = value;
      if (widget.validator != null)
        _errorText = widget.validator!(_value);
    });
  }

  void _onDone() {
    Navigator.of(context, rootNavigator: true).pop(_value);
  }

  void _onCancel() {
    Navigator.of(context, rootNavigator: true).pop(null);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Dialog(
      child: Container(
        width: width * 0.6,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 5.0),

            Text(
             widget.title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600
              ),
            ),

            const SizedBox(height: 20.0),

            TextFormField(
              initialValue: _value,
              inputFormatters: widget.inputFormatter,
              onChanged: _onChanged,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: widget.placeholder,
                errorText: _errorText
              ),
            ),

            const SizedBox(height: 25.0,),

            _actionWidget()

          ],
        ),
      ),
    );
  }

  Widget _actionWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        OutlinedButton(
          onPressed: _onCancel,
          style: _buttonStyle,
          child: const Text("Annuler")
        ),

        const SizedBox(width: 15.0),

        ElevatedButton(
          onPressed: _errorText == null ? _onDone : null,
          style: _buttonStyle,
          child: const Text("Enregister")
        )

      ],
    );
  }

}
