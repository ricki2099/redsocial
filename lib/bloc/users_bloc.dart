
import 'package:redsocial/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class UsersBloc with Validators {


  final _firstNameController = BehaviorSubject<String>();
  final _lastNameController = BehaviorSubject<String>();
  final _dateBirthdayController = BehaviorSubject<String>();
  final _emailController    = BehaviorSubject<String>();
  final _genderController    = BehaviorSubject<String>();
  final _statusController    = BehaviorSubject<String>();

  //final _passwordController = BehaviorSubject<String>();

  Stream<String> get firstNameStream    => _firstNameController.stream.transform(validateField);
  Stream<String> get lastNameStream    => _lastNameController.stream.transform(validateField);
  Stream<String> get dateBirthdayStream    => _dateBirthdayController.stream.transform(validateField);
  Stream<String> get emailStream    => _emailController.stream.transform(validarEmail);
  Stream<String> get genderStream    => _genderController.stream.transform(validateField);
  Stream<String> get statusStream    => _statusController.stream.transform(validateField);

  // Stream<bool> get formValidStream => 
  //     Observable.combineLatest2(emailStream, passwordStream, (e, p) => true );

  Stream<bool> get formValidStream => 
      Observable.combineLatest6(
        firstNameStream, 
        lastNameStream, 
        dateBirthdayStream, 
        emailStream, 
        genderStream, 
        statusStream, (a, b, c, d, e, f) => true );

  Function(String) get changeFirstName => _firstNameController.sink.add;
  Function(String) get changeLastName => _lastNameController.sink.add;  
  Function(String) get changeBirthday => _dateBirthdayController.sink.add;  
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changeGender => _genderController.sink.add;
  Function(String) get changeStatus => _statusController.sink.add;

  // Obtener el último valor ingresado a los streams
  String get firstName    => _firstNameController.value;
  String get lastName     => _lastNameController.value;
  String get birthDay     => _lastNameController.value;
  String get email        => _emailController.value;
  String get gender        => _genderController.value;
  String get status        => _statusController.value;  

  dispose() {    
    _firstNameController?.close();
    _lastNameController?.close();
    _dateBirthdayController?.close();
    _emailController?.close();
    _genderController?.close();
    _statusController?.close();    
  }

}
