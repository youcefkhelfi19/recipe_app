import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController textValueController;
  final String valueKey;
  final Function onEditComplete;
  final String hint;
  final Function onValidate;
  final FocusNode node;

  PasswordTextField(
      {this.textValueController,
        this.hint,
        this.onEditComplete,
        this.onValidate,
        this.valueKey,
        this.node});

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      key: ValueKey(widget.valueKey),
      controller: widget.textValueController ,
      focusNode: widget.node,
      validator: widget.onValidate,
      textInputAction: TextInputAction.next,
      onEditingComplete: widget.onEditComplete,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          focusColor: Colors.brown,

          fillColor: Colors.transparent,
          filled: true,
          prefixIcon: Icon(Icons.lock,color: Color(0xff8C0000),),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(_obscureText
                ? Icons.visibility
                : Icons.visibility_off,color:Colors.brown,),
          ),


          hintText: widget.hint,
      ),
      obscureText: _obscureText,

    );
  }
}
