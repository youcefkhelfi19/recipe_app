import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textValueController;
  final String valueKey;
  final Function onValidate;
  final Function onEditComplete;
  final Function onSave;
  final String hint;
  final FocusNode node;
  final Icon icon;
  CustomTextField(
      {this.textValueController,
        this.onEditComplete,
      this.onValidate,
      this.onSave,
      this.valueKey,
      this.icon,
      this.hint,
      this.node});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: textValueController,
       key: ValueKey(valueKey),
        validator: onValidate,
        textInputAction: TextInputAction.next,
     onEditingComplete: onEditComplete,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(

            fillColor: Colors.transparent,
            filled: true,
            prefixIcon: icon,
            //
            hintText: hint),
             );
  }
}
