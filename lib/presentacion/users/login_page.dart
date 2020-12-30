import 'package:flutter/material.dart';
import 'package:redsocial/bloc/login_bloc.dart';
import 'package:redsocial/bloc/provider.dart';
import 'package:redsocial/data/remote/user_api.dart';
import 'package:redsocial/domain/entities/user_entity.dart';
import 'package:redsocial/presentacion/product/product.dart';
//LoginPage


class LoginPage extends StatelessWidget {
  //const LoginPage({Key key}) : super(key: key);

  static String routeName = 'loginScreen';

  double size = 0;

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size.width;
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0XFF003D87),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/imglogin.png"
                  ),
                  fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(height: 5,),
            Center(
              child: Text("Español * Englis * Más"),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  _textLogin(bloc),
                  _textPassword(bloc),
                  SizedBox(height: 20,),
                  _buttonLogin(bloc),
                  _textLink(context),
                  SizedBox(height: 40,),
                  _buttonCreate(context)
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget _textLogin(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Correo electrónico',
            //counterText: snapshot.data,
            errorText: snapshot.error,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0XFFD1D1D1),
                width: 2
              ),
            ),
          ),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget _textPassword(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
        return TextField(
            obscureText: true,
            decoration: InputDecoration(              
              labelText: "Password",
              //counterText: snapshot.data,
              errorText: snapshot.error,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0XFFD1D1D1),
                  width: 2
                ),
              ),
            ),
            onChanged: bloc.changePassword,
          );
      },
    );
  }

  Widget _buttonLogin( LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
        return RaisedButton(
          child: Container(
            width: double.infinity,        
            //padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
            child: Text("Iniciar sesión", textAlign: TextAlign.center, style: TextStyle(fontSize: 12),),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Color(0XFF1878F3),
          textColor: Colors.white,
          onPressed: snapshot.hasData ? ()=> _login(bloc, context) : null
        );
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) async {    
    
    UserApi repository = UserApi();

    UserEntity resp = await repository.getLogin(bloc.password);

    if ( resp != null ) {       
       if (resp.email == bloc.email && resp.id == int.parse(bloc.password)){         
         Navigator.pushReplacementNamed(context, 'homeScreen');
       }
    } else {
      mostrarAlerta( context, 'El usuario o la contraseña es incorrecta');
    }
  }

  Widget _textLink(BuildContext context) {
    return InkWell(
      onTap: ()=>(){},
      child: Text(
        '¿Has olvidadao tu contraseña?',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.blue
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _buttonCreate(BuildContext context) {
    return RaisedButton(
      child: Container(
        width: size * 0.6,
        //padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
        child: Text("Crear cuenta de Facebook", textAlign: TextAlign.center, style: TextStyle(fontSize: 12),),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      elevation: 0.0,
      color: Color(0XFF30A24B),
      textColor: Colors.white,
      onPressed: (){
        Navigator.pushNamed(context, 'registerScreen');
      },
    );
  }

  void mostrarAlerta(BuildContext context, String mensaje ) {
    showDialog(
      context: context,
      builder: ( context ) {
        return AlertDialog(
          title: Text('Información incorrecta'),
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