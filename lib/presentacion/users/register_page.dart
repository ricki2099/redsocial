import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redsocial/bloc/provider.dart';
import 'package:redsocial/bloc/users_bloc.dart';
import 'package:redsocial/data/remote/user_api.dart';
import 'package:redsocial/domain/entities/user_entity.dart';

class RegisterPage extends StatefulWidget {  

  static String routeName = 'registerScreen';

  @override
  _RegisterPageState createState() => _RegisterPageState();
  
}

class _RegisterPageState extends State<RegisterPage> {  

  String _value = '-';  
  String _valueStatus = '-';
  final now = DateTime.now();  

  @override
  Widget build(BuildContext context) {
    
    final bloc = Provider.ofUsers(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Registro de Usuario'),),
      body: SafeArea(
        //bottom: false,
        child: SingleChildScrollView(
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
      ),
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
    
    UserApi repository = UserApi();
    UserEntity iModel = new UserEntity();    

    iModel.name = bloc.name;
    iModel.email = bloc.email;
    iModel.gender = 'Male';
    iModel.status = 'Active';

    iModel = await repository.registerUsers(iModel);
    //print('RESULT');
    if (iModel != null) {
      mostrarAlerta( context, 'Crear Usuario', 'Te has registrado exitosamente, Usuario: ' + iModel.email + ' tu clave es: ' + iModel.id.toString());
      //Navigator.of(context).pop();
    } else {
      mostrarAlerta( context, 'Algo salió mal', 'El registro no se pudo realizar, intente nuevamente.');
    }
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