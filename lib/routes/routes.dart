import 'package:flutter/material.dart';
import 'package:redsocial/presentacion/Comment/comment.dart';
import 'package:redsocial/presentacion/post/home_page.dart';
import 'package:redsocial/presentacion/product/product.dart';
import 'package:redsocial/presentacion/users/login_page.dart';
import 'package:redsocial/presentacion/users/register_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  LoginPage.routeName: (_) => LoginPage(),
  HomePage.routeName: (_) => HomePage(),
  ProductsPage.routeName: (_) => ProductsPage(),
  CommentPage.routeName: (_) => CommentPage(),
  RegisterPage.routeName: (_) => RegisterPage(),
};