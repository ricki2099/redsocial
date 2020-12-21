import 'package:flutter/material.dart';
import 'package:redsocial/presentation/register/register.view.dart';

class LoginView extends StatelessWidget {

  static String routeName = 'loginScreen';

  double size = 0;

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
                        _textLogin(context),
                        _textPassword(context),
                        SizedBox(height: 20,),
                        _buttonLogin(context),
                        _textLink(context),
                        SizedBox(height: 40,),
                        _buttonCreate(context)
                      ],
                    ),
                    
                  ),                    
                ],
              ),                
            ),            
      ),
    );
  }

  Widget _textLogin(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: "correo electrónico",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0XFFD1D1D1),
            width: 2
          ),
        )
      ),
    );
  }

  Widget _textPassword(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0XFFD1D1D1),
            width: 2
          ),
        )
      ),
    );
  }

  Widget _buttonLogin(BuildContext context) {
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
      onPressed: (){
      },
    );
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
        Navigator.pushNamed(context, RegisterView.routeName);
      },
    );
  }

  

}