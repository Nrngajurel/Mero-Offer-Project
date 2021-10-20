import 'package:form_field_validator/form_field_validator.dart';

class NrnPhoneValidator extends TextFieldValidator{

  NrnPhoneValidator({String errorText = "Please Enter Valid Phone Number"}) : super(errorText);

  @override
  // TODO: implement ignoreEmptyValues
  bool get ignoreEmptyValues => false;
  @override
  bool isValid(String? value) {
    return hasMatch(r'^((+|00)?218|0?)?(9[0-9]{8})$', value!);
  }
  
}