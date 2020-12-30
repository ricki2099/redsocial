import 'package:flutter/material.dart';
import 'package:redsocial/data/remote/product_api.dart';
import 'package:redsocial/domain/entities/product.dart';
import 'package:redsocial/presentacion/product/share/backdrop.dart';
import 'package:redsocial/presentacion/product/widgets/products_details.dart';
import 'package:redsocial/presentacion/product/widgets/products_item.dart';

final _characterGridViewMargin = 48.0;
final _characterGridViewSpanCountPortrait = 2;
final _characterGridViewSpanCountLandscape = 4;

final _frontTitle = 'Detalles';
final _backTitle = 'Productos';

class ProductsPage extends StatefulWidget {
  ProductsPage({Key key}) : super(key: key);

  static String routeName = 'productScreen';

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final _characters = <Product>[];
  Product _currentCharacter;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_characters.isEmpty) {
      await _loadCharacters();
    }
  }

  Future _loadCharacters() async {
    final api = ProductApi();
    final characters = await api.getProducts();
    setState(() {
      _characters.addAll(characters);
    });
  }

  void _onCharacterTapped(Product character) {
    setState(() {
      _currentCharacter = character;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Backdrop(
      frontTitle: Text(
        _frontTitle,
        style: TextStyle(color: Colors.grey),
      ),
      backTitle: Text(_backTitle,
          style: TextStyle(
            color: Colors.grey,
          )),
      currentCharacter: _currentCharacter,
      backPanel: _buildBackPanel(),
      frontPanel: _buildFrontPanel(),
    );
  }

  Widget _buildFrontPanel() {
    return CharacterDetail(_currentCharacter);
  }

  Widget _buildBackPanel() {
    if (_characters.isEmpty) {
      return _buildForLoadingState();
    } else {
      return _buildForLoadedState();
    }
  }

  Widget _buildForLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildForLoadedState() {
    return Padding(
      padding: EdgeInsets.only(bottom: _characterGridViewMargin),
      child: GridView.count(
          crossAxisCount: _getCharacterGridViewSpanCount(),
          children: _characters
              .map((character) => CharacterItem(character, _onCharacterTapped))
              .toList()),
    );
  }

  int _getCharacterGridViewSpanCount() {
    if (MediaQuery.of(context).orientation == Orientation.portrait)
      return _characterGridViewSpanCountPortrait;
    return _characterGridViewSpanCountLandscape;
  }
}
