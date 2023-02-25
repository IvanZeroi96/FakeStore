import 'package:flutter/material.dart';

class FSTextFormField extends FormField<String> {
  FSTextFormField({
    super.key,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    String initialValue = '',
    bool autovalidate = false,
    bool moneymask = false,
    TextEditingController? controller,
    bool enabled = true,
    bool dropdown = false,
    int? maxLength,
    TextInputType keyboardType = TextInputType.text,
    TextCapitalization textCapitalization = TextCapitalization.sentences,
    String label = '',
    String counterText = '',
    bool obscureText = false,
    Function(String)? onChanged,
    Widget? suffixIcon,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          enabled: enabled,
          builder: (FormFieldState<String> state) {
            return _FSTextFormField(
              state: state,
              maxLength: maxLength,
              label: label,
              keyboardType: keyboardType,
              counterText: counterText,
              textCapitalization: textCapitalization,
              onChanged: onChanged,
              moneyMask: moneymask,
              controller: controller,
              enabled: enabled,
              dropdown: dropdown,
              obscureText: obscureText,
              suffixIcon: suffixIcon,
            );
          },
        );
}

class _FSTextFormField extends StatefulWidget {
  final int? maxLength;
  final String label;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final FormFieldState<String>? state;
  final String? counterText;
  final Function(String)? onChanged;
  final bool moneyMask;
  final TextEditingController? controller;
  final bool enabled;
  final bool dropdown;
  final bool obscureText;
  final Widget? suffixIcon;

  const _FSTextFormField({
    this.maxLength,
    this.label = '',
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.characters,
    this.state,
    this.counterText,
    this.onChanged,
    this.moneyMask = false,
    this.controller,
    this.enabled = true,
    this.dropdown = false,
    this.obscureText = false,
    this.suffixIcon,
  });
  @override
  State<StatefulWidget> createState() => _FSTextFormFieldState();
}

class _FSTextFormFieldState extends State<_FSTextFormField> {
  TextEditingController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.controller != null) {
      widget.controller!.addListener(() {
        widget.state!.didChange(widget.controller!.text);
      });
    } else {
      controller = TextEditingController(text: widget.state!.value ?? '');
      controller!.addListener(() {
        widget.state!.didChange(controller!.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.label,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: widget.state!.hasError
                              ? Theme.of(context).errorColor
                              : Colors.purple,
                          fontSize: 15.0,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: TextFormField(
                    controller: widget.controller ?? controller,
                    maxLength: widget.maxLength,
                    keyboardType: widget.keyboardType,
                    style: Theme.of(context).textTheme.bodyText1,
                    textCapitalization: widget.textCapitalization,
                    onChanged: widget.onChanged,
                    enabled: widget.enabled,
                    obscureText: widget.obscureText,
                    decoration: InputDecoration(
                      suffixIcon: widget.suffixIcon,
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      counterText: widget.counterText,
                      labelStyle: Theme.of(context).textTheme.bodyText1,
                    ),
                    onEditingComplete: () {
                      widget.state!.didChange(controller!.text);
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        widget.state!.hasError
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.state!.errorText!,
                    style: TextStyle(
                        color: Theme.of(context).errorColor, fontSize: 12.0),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
