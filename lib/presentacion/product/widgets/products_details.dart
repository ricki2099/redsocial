import 'package:flutter/material.dart';
import 'package:redsocial/domain/entities/product.dart';

class CharacterDetail extends StatelessWidget {
  final Product _character;
  const CharacterDetail(this._character);

  @override
  Widget build(BuildContext context) {
    return _character == null
        ? _buildForNullCharacter()
        : _buildForNonNullCharacter(context);
  }

  Widget _buildForNullCharacter() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'Ningún producto por mostrar',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
    );
  }

  Widget _buildForNonNullCharacter(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                _character.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
          ),
          _buildInformationWidget(
              Icons.all_inclusive, 'Nombre', _character.name),
          _buildInformationWidget(Icons.payment, 'Precio', _character.price),
          _buildInformationWidget(
              Icons.money_off, 'Descuento', _character.discount_amount),

          _buildInformationWidget(
            Icons.description,
            'Descripcion',
            _character.description,
          ),
          // _buildInformationWidget(Icons.public, 'Origen', _character.name),
          // _buildInformationWidget(Icons.place, 'Url ', _character.image),
        ],
      ),
    );
  }

  Widget _buildInformationWidget(IconData icon, String key, String value) {
    return Row(
      children: [
        new Padding(
          padding: EdgeInsets.only(
            top: 16.0,
            left: 16.0,
            right: 20.0,
            bottom: 16.0,
          ),
          child: Icon(icon, color: Colors.grey[600]),
        ),
        _buildKeyValueWidget(key, value),
      ],
    );
  }

  Widget _buildKeyValueWidget(String key, String value) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            key,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.justify,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
