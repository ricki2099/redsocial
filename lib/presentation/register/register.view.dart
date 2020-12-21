import 'package:flutter/material.dart';
import 'package:redsocial/presentation/register/create.view.dart';

class RegisterView extends StatelessWidget {  

  static String routeName = 'registerScreen';
  double size = 0;

  @override
  Widget build(BuildContext context) {
    
    size = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text("Crear cuenta"),),
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/imgregisterfirst.png',                          
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Únete a Red Social',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Te ayudaremos a crear una cuenta en pocos pasos.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),                        
                    ),
                    SizedBox(height: 40,),
                    _buttonNext(context),
                  ],
                ),
              ),
              _textLink(context),                
            ],
          ),
        ),
      ),
    );

  }

  Widget _buttonNext(BuildContext context) {
    return RaisedButton(
      child: Container(
        width: double.infinity,        
        //padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
        child: Text("Siguiente", textAlign: TextAlign.center, style: TextStyle(fontSize: 12),),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      elevation: 0.0,
      color: Color(0XFF1877F2),
      textColor: Colors.white,
      onPressed: (){
        Navigator.pushNamed(context, CreateView.routeName);
      },
    );
  }

  Widget _textLink(BuildContext context) {
    return InkWell(
      onTap: ()=>(){},
      child: Text(
        '¿Ta tienes una cuenta?',
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

}