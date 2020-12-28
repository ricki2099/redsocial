import 'dart:async';

class Validators {


  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: ( email, sink ) {


      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp   = new RegExp(pattern);

      if ( regExp.hasMatch( email ) ) {
        sink.add( email );
      } else {
        sink.addError('Email no es correcto');
      }

    }
  );


  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: ( password, sink ) {

      if ( password.length >= 1 ) {
        sink.add( password );
      } else {
        sink.addError('La contraseña es requerida');
      }

    }
  );

  final validateField = StreamTransformer<String, String>.fromHandlers(
    handleData: ( value, sink ) {

      if ( value.length >= 1 ) {
        sink.add( value );
      } else {
        sink.addError('El campo es requerido');
      }
    }
  );

  final validateDropDown = StreamTransformer<String, String>.fromHandlers(
    handleData: ( value, sink ) {

      if ( value.length >= 0 ) {
        sink.add( value );
      } else {
        sink.addError('El campo es requerido');
      }
    }
  );


}
