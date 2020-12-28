import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redsocial/bloc/provider.dart';
import 'package:redsocial/bloc/users_bloc.dart';
import 'package:redsocial/data/remote/users_api.dart';
import 'package:redsocial/domain/entities/users.model.dart';

class CreateView extends StatefulWidget {  

  static String routeName = 'registerusersScreen';

  @override
  _CreateViewState createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView> {
  String _value = '-';

  String _valueStatus = '-';

  final now = DateTime.now();

  String _fecha  = '';

  TextEditingController _birthdayController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    final bloc = Provider.ofUsers(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('Nombre'),),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(              
              children: [
                Text(
                  'Registrate',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                _textName(bloc),
                _textEmail(bloc),
                _crearGender(),
                _crearStatus(),
                SizedBox(height: 40,),
                _buttonCreate(bloc),
              ],
            ),
          )
        ),
      )
    );
  }

  Widget _textName(UsersBloc bloc) {
    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          decoration: InputDecoration(
            labelText: "Nombres y Apellidos",
            errorText: snapshot.error,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0XFFD1D1D1),
                width: 2
              ),
            )
          ),
          onChanged: bloc.changeName,
        );
      },
    );
  }

  Widget _textEmail(UsersBloc bloc) {
    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Correo electrónico",
            errorText: snapshot.error,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0XFFD1D1D1),
                width: 2
              ),
            )
          ),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget _buttonCreate(UsersBloc bloc) {    
     return StreamBuilder(
       stream: bloc.formValidStream,
       builder: (BuildContext context, AsyncSnapshot snapshot){
         return RaisedButton(
              child: Container(
                width: double.infinity,        
                //padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
                child: Text("Registrarme", textAlign: TextAlign.center, style: TextStyle(fontSize: 12),),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)
              ),
              elevation: 0.0,      
              color: Color(0XFF30A24B),
              textColor: Colors.white,
              onPressed: snapshot.hasData ? ()=> _createUser(bloc, context) : null,
          );
       }
     );
  }

  // Widget _crearGenderBloc(UsersBloc bloc) {
  //   return StreamBuilder(
  //     stream: bloc.genderStream,
  //     builder: (BuildContext context, AsyncSnapshot snapshot) {
  //       return InputDecorator(
  //         decoration: InputDecoration(
  //           labelText: 'con qué género te identificas',
  //           labelStyle: TextStyle(fontSize: 22),        
  //         ),
  //         child: DropdownButton(
  //           isExpanded: true,
  //           isDense: true,
  //           icon: Icon(Icons.keyboard_arrow_down),
  //           value: _value, //snapshot.data, 
  //             items: [
  //               DropdownMenuItem(
  //                 child: Text("--seleccione--"),
  //                 value: '-',
  //               ),
  //               DropdownMenuItem(
  //                 child: Text("Masculino"),
  //                 value: 'Male',
  //               ),
  //               DropdownMenuItem(
  //                 child: Text("Femenino"),
  //                 value: 'Female'
  //               )
  //           ],
  //           onChanged: bloc.changeGender,
  //         )
  //       );
  //     },
  //   );
  // }

  Widget _crearGender() {

    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'con qué género te identificas',
        labelStyle: TextStyle(fontSize: 22),        
      ),
      child: DropdownButton(
        isExpanded: true,
         isDense: true,
         icon: Icon(Icons.keyboard_arrow_down),
         value: _value,
           items: [
             DropdownMenuItem(
               child: Text("--seleccione--"),
               value: '-',
             ),
             DropdownMenuItem(
               child: Text("Masculino"),
               value: 'Male',
             ),
             DropdownMenuItem(
               child: Text("Femenino"),
               value: 'Female'
             )
         ],         
         onChanged: (value) {
          setState(() {
            _value = value;            
          });
        }
      )
    );
  }

  // Widget _crearStatusBloc(UsersBloc bloc) {
  //   return StreamBuilder(
  //     stream: bloc.statusStream,
  //     builder: (BuildContext context, AsyncSnapshot snapshot) {
  //       return InputDecorator(
  //         decoration: InputDecoration(
  //           labelText: 'Estado',
  //           labelStyle: TextStyle(fontSize: 22),
  //         ),
  //         child: DropdownButton(
  //           isExpanded: true,
  //           isDense: true,
  //           icon: Icon(Icons.keyboard_arrow_down),
  //           value: _valueStatus, //bloc.changeStatus.toString(),
  //             items: [
  //               DropdownMenuItem(
  //                 child: Text("--seleccione--"),
  //                 value: '-',
  //               ),
  //               DropdownMenuItem(
  //                 child: Text("Activado"),
  //                 value: 'Active',
  //               ),
  //               DropdownMenuItem(
  //                 child: Text("Inactivo"),
  //                 value: 'Inactive'
  //               )
  //           ],
  //           onChanged: bloc.changeStatus
  //           // onChanged: (value) {
  //           //   // setState(() {
  //           //   //   _valueStatus = value;
  //           //   //   print(_valueStatus);
  //           //   // });
  //           // }
  //         )
  //       );
  //     },
  //   );
  // }

  Widget _crearStatus() {

    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'Estado',
        labelStyle: TextStyle(fontSize: 22),        
      ),
      child: DropdownButton(
        isExpanded: true,
         isDense: true,
         icon: Icon(Icons.keyboard_arrow_down),
         value: _valueStatus,
           items: [
             DropdownMenuItem(
               child: Text("--seleccione--"),
               value: '-',
             ),
             DropdownMenuItem(
               child: Text("Activado"),
               value: 'Active',
             ),
             DropdownMenuItem(
               child: Text("Inactivo"),
               value: 'Inactive'
             )
         ],
         onChanged: (value) {
          setState(() {
            _valueStatus = value;            
          });
        }
      )
    );
  }

  _createUser(UsersBloc bloc, BuildContext context) async {    
    
    UsersAPI repository = UsersAPI();
    UsersModel iModel = new UsersModel();    

    iModel.name = bloc.name;
    iModel.email = bloc.email;
    iModel.gender = 'Male';
    iModel.status = 'Active';

    iModel = await repository.createUsers(iModel);
    print('RESULT');
    print(iModel.id);

    if (iModel != null) {
      mostrarAlerta( context, 'Crear Usuario', 'Te has registrado exitosamente, Usuario: ' + iModel.email + ' tu clave es: ' + iModel.id.toString());      

      //Navigator.of(context).pop();
      //Falta redireccionar y mostrar la Clave
    } else {
      mostrarAlerta( context, 'Algo salió mal', 'El registro no se pudo realizar, intente nuevamente.');
    }

    // if ( resp.length > 0 ) {       
    //    if (resp[0].email == bloc.email && resp[0].id == int.parse(bloc.password)){
    //      //Navigator.pushReplacementNamed(context, 'home');
    //      mostrarAlerta( context, 'Te has logueado exitosamente');
    //    }
    // } else {
    //   mostrarAlerta( context, 'El usuario o la contraseña es incorrecta');
    // }
  }

  void mostrarAlerta(BuildContext context, String title, String mensaje ) {
    showDialog(
      context: context,
      builder: ( context ) {
        return AlertDialog(
          title: Text(title),
          content: Text(mensaje),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: ()=> Navigator.of(context).pop(),
            )
          ],
        );
      }
    );
  }

}

/*
class CreateView extends StatefulWidget {
  
  static String routeName = 'yournameScreen';  

  
  @override
  _CreateViewState createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView> {
  
  String _value = '-';
  String _valueStatus = '-';

  final now = DateTime.now();
  String _fecha  = '';

  TextEditingController _birthdayController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('Nombre'),),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(              
              children: [
                Text(
                  'Registrate',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                _textFirsName(context),
                _textLastName(context),                
                _dateBirthday(context),
                _textEmail(context),
                _crearGender(),
                _crearStatus(),
                SizedBox(height: 40,),
                _buttonCreate(context),
              ],
            ),
          )
        ),
      )
    );
  }

  Widget _textFirsName(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: "Nombres",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0XFFD1D1D1),
            width: 2
          ),
        )
      ),
    );
  }

  Widget _textLastName(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: "Apellidos",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0XFFD1D1D1),
            width: 2
          ),
        )
      ),
    );
  }

  Widget _textEmail(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,      
      decoration: InputDecoration(
        labelText: "Correo Electrónico",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0XFFD1D1D1),
            width: 2
          ),
        )
      ),
    );
  }

  Widget _dateBirthday(BuildContext context){
    
    //final today = new DateTime(now.year, now.month, now.day);
    //DateTime _dateTime = DateTime.now();

    return TextField(
      enableInteractiveSelection: false,
      controller: _birthdayController,
      decoration: InputDecoration(
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(1.0)
        // ),
        //hintText: '¿Cuando Naciste?',
        labelText: '¿Cuando Naciste?',
        suffixIcon: Icon( Icons.date_range_outlined ),
        //icon: Icon( Icons.calendar_today )
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );
      },
    );
  }

  _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if ( picked != null ) {
      setState(() {
          _fecha = picked.toString();
          _birthdayController.text = _fecha;
      }); 
    }

  }

  Widget _buttonCreate(BuildContext context) {    
     return RaisedButton(
      child: Container(
        width: double.infinity,        
        //padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
        child: Text("Registrarme", textAlign: TextAlign.center, style: TextStyle(fontSize: 12),),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      elevation: 0.0,      
      color: Color(0XFF30A24B),
      textColor: Colors.white,
      onPressed: (){
      },
    );
  }

  Widget _crearGender() {

    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'con qué género te identificas',
        labelStyle: TextStyle(fontSize: 22),        
      ),
      child: DropdownButton(
        isExpanded: true,
         isDense: true,
         icon: Icon(Icons.keyboard_arrow_down),
         value: _value,
           items: [
             DropdownMenuItem(
               child: Text("--seleccione--"),
               value: '-',
             ),
             DropdownMenuItem(
               child: Text("Masculino"),
               value: 'Male',
             ),
             DropdownMenuItem(
               child: Text("Femenino"),
               value: 'Female'
             )
         ],
         onChanged: (value) {
          setState(() {
            _value = value;
            print(_value);
          });
        }
      )
    );
  }

  Widget _crearStatus() {

    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'Estado',
        labelStyle: TextStyle(fontSize: 22),        
      ),
      child: DropdownButton(
        isExpanded: true,
         isDense: true,
         icon: Icon(Icons.keyboard_arrow_down),
         value: _valueStatus,
           items: [
             DropdownMenuItem(
               child: Text("--seleccione--"),
               value: '-',
             ),
             DropdownMenuItem(
               child: Text("Activado"),
               value: 'Active',
             ),
             DropdownMenuItem(
               child: Text("Inactivo"),
               value: 'Inactive'
             )
         ],
         onChanged: (value) {
          setState(() {
            _valueStatus = value;
            print(_valueStatus);
          });
        }
      )
    );
  }
}
*/