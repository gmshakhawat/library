import 'package:cant_lib/src/constents/skt_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SktInputField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final String? label;
  final ValidationType? valdationType, secondaryValidation;
  final bool? onlyRead;
  final FocusNode? focus;
  final Function? onChange, validator,onSubmit;
  final int? minLen;
  final int? maxLen;
  final Widget? prefix, sufix;
  final TextInputType? keyboardType;

  var fKey;

  SktInputField(
      {Key? key,
      required this.textEditingController,
      required this.label,
      this.valdationType,
      this.keyboardType = TextInputType.text,
      this.onlyRead = false,
      this.focus,
      this.minLen = 0,
      this.fKey,
      this.onChange,
      this.maxLen = 45,
      this.prefix,
      this.sufix,
      this.secondaryValidation = ValidationType.NO_VALIDATION,
      this.validator, this.onSubmit})
      : super(key: key);

  @override
  _SKTInputFieldState createState() => _SKTInputFieldState();
}

class _SKTInputFieldState extends State<SktInputField> {
  late GlobalKey<FormState> _key;

  bool? isVisible;
  void validateAndSave() {
    final FormState? form = _key.currentState;
    if (form!.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  Color? errorTextColor;
  Color? errorBorderColor;
  Color? errorFocusBorderColor;
  Color? errorUnFocusTextColor;

  @override
  void initState() {
    super.initState();
    isVisible = widget.valdationType == ValidationType.PASSWORD || widget.valdationType == ValidationType.PIN ? false : true;
    setState(() {
      if (widget.valdationType == ValidationType.AMOUNT &&
          widget.textEditingController!.text.length > 0) {
        errorTextColor = SktColors.warning;
        errorUnFocusTextColor = SktColors.warning;
        errorFocusBorderColor = SktColors.warning;
      } else {
        errorTextColor =  SktColors.warning;
        errorBorderColor =  SktColors.warning;
        errorFocusBorderColor =  SktColors.warning;
        errorUnFocusTextColor =  SktColors.warning;
      }
    });

    if (widget.fKey != null) {
      print("CUSTOM KEY ");
      _key = widget.fKey;
    } else {
      _key = GlobalKey<FormState>();
    }
  }

  FocusNode _onFocus = new FocusNode(canRequestFocus: false);

  @override
  Widget build(BuildContext context) {
    _onFocus.addListener(() {
      if (!_onFocus.hasFocus) {
        validateAndSave();
      }
    });

     if (widget.valdationType == ValidationType.AMOUNT &&
          widget.textEditingController!.text.length > 0) {
        errorTextColor =  SktColors.warning;
        errorUnFocusTextColor =  SktColors.warning;
        errorFocusBorderColor =  SktColors.warning;
      } else {
        errorTextColor =  SktColors.warning;
        errorBorderColor =  SktColors.warning;
        errorFocusBorderColor =  SktColors.warning;
        errorUnFocusTextColor =  SktColors.warning;
      }

    return Container(
      child: Form(
        key: _key,
        child: TextFormField(
          cursorColor: SktColors.text,
          controller: widget.textEditingController,
          keyboardType: widget.valdationType==ValidationType.AMOUNT?TextInputType.numberWithOptions(decimal: true): widget.keyboardType,
          focusNode: widget.focus != null ? widget.focus : _onFocus,
          maxLengthEnforced: true,
          obscureText: !isVisible!,
          autofocus: false,
          onEditingComplete:() {
            print("sdas");
          },
          onFieldSubmitted:(data){
            print("saved");

            if(widget.onSubmit!=null){
              widget.onSubmit!(data);
            }
            
          }, 
          maxLength: widget.valdationType == ValidationType.AMOUNT
              ? 10
              : widget.valdationType == ValidationType.PHONE
                  ? 11
                  : widget.maxLen,
          readOnly: widget.onlyRead!,
          onChanged: widget.onChange != null
              ? (val) {
                  widget.onChange!();
                }
              : (val) {
                  print(
                      "ON CHANGE)${val.length} ${widget.valdationType}->$val");

                  if (val.length > 0 &&
                      errorTextColor ==  SktColors.warning &&
                      widget.valdationType == ValidationType.AMOUNT) {
                    print("Color Changing..");
                    setState(() {
                      errorTextColor = SktColors.warning;
                      errorUnFocusTextColor =  SktColors.warning;
                      errorFocusBorderColor =
                          SktColors.warning;
                    });
                  } else if (val.length == 0 &&
                      widget.valdationType == ValidationType.AMOUNT) {
                    setState(() {
                      errorTextColor =  SktColors.warning;
                      errorFocusBorderColor =  SktColors.warning;
                    });
                  }

                  // widget.onChange!();
                },
          validator: widget.validator != null
              ? (val) {
                  return widget.validator!(val);
                }
              : (val) {
                 
                    if (val!.length == 0) {
                      return "${widget.label} can't be empty";
                    }
                 
              },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextStyle(color: SktColors.text),
          inputFormatters: <TextInputFormatter>[
            if (ValidationType.NAME == widget.valdationType)
              FilteringTextInputFormatter.allow(
                  RegExp(r'^(?![\s.]$)[a-zA-Z\s.]*'),
                  replacementString: ""),
            if (ValidationType.NUMBER == widget.valdationType || widget.valdationType == ValidationType.PIN)
              FilteringTextInputFormatter.allow(RegExp(r'\d'),
                  replacementString: ""),
            if (ValidationType.PHONE == widget.valdationType ||
                ValidationType.PHONE == widget.secondaryValidation)
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]*'),
                  replacementString: ""),
            if (ValidationType.NON_ZERO == widget.valdationType)
              FilteringTextInputFormatter.allow(RegExp(r'^[1-9]*$')),
          
            if (ValidationType.EMAIL == widget.valdationType ||
                ValidationType.EMAIL == widget.secondaryValidation)
              FilteringTextInputFormatter.deny(new RegExp(r'\ '),
                  replacementString: "")

            // if (ValidationType.AppLocalization.of(context).getTranslatedValues('AMOUNT') == valdationType)
            //   FilteringTextInputFormatter.allow(
            //       RegExp(r'^-?(?:0|[1-9]\d{0,2}(?:,?\d{3})*)(?:\.\d+)?')),
          ],
          decoration: InputDecoration(
            // hintText: this.widget.label,
            hintStyle: TextStyle(color: Colors.grey.withAlpha(150)),
            counterText: "",
            labelStyle: TextStyle(
                color:SktColors.text, fontSize: 13),
            labelText: widget.label,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            suffixIcon: widget.valdationType == ValidationType.PASSWORD || widget.valdationType == ValidationType.PIN
                ? IconButton(
                    icon: Icon(
                      isVisible!
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      color: isVisible!
                          ? SktColors.text
                          : SktColors.background,
                    ),
                    onPressed: () {
                      print("v: $isVisible");
                      setState(() {
                        isVisible = !isVisible!;
                      });
                    })
                : widget.sufix != null
                    ? Container(
                        margin: EdgeInsets.all(7),
                        child: widget.sufix,
                      )
                    : null,
            prefixIcon: widget.prefix != null
                ? Container(
                    margin: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        // color: AppConfig.of(context).appColor,
                        borderRadius: BorderRadius.circular(11)),
                    // padding: EdgeInsets.all(10),

                    child: widget.prefix,
                  )
                : null,
            errorStyle: TextStyle(color: errorTextColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(color: SktColors.border, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(color: SktColors.warning, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(color: SktColors.warning, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(
                  color:SktColors.text, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}

enum ValidationType {
  EMAIL,
  PASSWORD,
  PIN,
  PHONE,
  NAME,
  NOT_EMPTY,
  AMOUNT,
  NO_VALIDATION,
  NUMBER,
  NON_ZERO
}
