import 'package:flutter/material.dart';
import 'package:redsocial/presentation/login/login.view.dart';
import 'package:redsocial/presentation/register/register.view.dart';
import 'package:redsocial/presentation/register/create.view.dart';

final Map<String, WidgetBuilder> appRoutes = {  
  LoginView.routeName: (_) => LoginView(),
  RegisterView.routeName: (_) => RegisterView(),
  CreateView.routeName: (_) => CreateView(),
};