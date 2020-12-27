import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redsocial/bloc/provider.dart';
import 'package:redsocial/bloc/users_bloc.dart';

class CreateView extends StatelessWidget {  

  static String routeName = 'registerusersScreen';

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
                _textFirsName(bloc),
                _textLastName(bloc),                
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

  Widget _textFirsName(UsersBloc bloc) {
    return StreamBuilder(
      stream: bloc.firstNameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          decoration: InputDecoration(
            labelText: "Nombres",
            errorText: snapshot.error,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0XFFD1D1D1),
                width: 2
              ),
            )
          ),
          onChanged: bloc.changeFirstName,
        );
      },
    );
  }

  Widget _textLastName(UsersBloc bloc) {
    return StreamBuilder(
      stream: bloc.lastNameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return TextField(
          decoration: InputDecoration(
            labelText: "Apellidos",
            errorText: snapshot.error,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0XFFD1D1D1),
                width: 2
              ),
            )
          ),
          onChanged: bloc.changeLastName,
        );
      },
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
      // setState(() {
      //     _fecha = picked.toString();
      //     _birthdayController.text = _fecha;
      // }); 
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
          // setState(() {
          //   _value = value;
          //   print(_value);
          // });
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
          // setState(() {
          //   _valueStatus = value;
          //   print(_valueStatus);
          // });
        }
      )
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