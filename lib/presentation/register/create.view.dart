import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateView extends StatefulWidget {
  
  static String routeName = 'yournameScreen';  

  @override
  _CreateViewState createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView> {
  
  String _value = '-';

  final now = DateTime.now();
  String _fecha  = '';

  TextEditingController _inputFieldDateController = new TextEditingController();  

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
                _crearDropdown(),
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

  Widget _dateBirthday(BuildContext context){
    
    //final today = new DateTime(now.year, now.month, now.day);
    //DateTime _dateTime = DateTime.now();

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
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
          _inputFieldDateController.text = _fecha;
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
      color: Color(0XFF1877F2),
      textColor: Colors.white,
      onPressed: (){
      },
    );
  }

  Widget _crearDropdown() {

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
}