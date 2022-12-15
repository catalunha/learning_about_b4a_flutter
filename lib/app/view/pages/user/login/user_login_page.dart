import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_about_b4a_flutter/app/routes.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/user/login/user_login_controller.dart';
import 'package:learning_about_b4a_flutter/app/view/pages/utils/app_button.dart';
import 'package:learning_about_b4a_flutter/app/view/pages/utils/app_textformfield.dart';
import 'package:validatorless/validatorless.dart';

class UserLoginPage extends StatefulWidget {
  final UserLoginController _loginController = Get.find<UserLoginController>();

  UserLoginPage({Key? key}) : super(key: key);

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailTec = TextEditingController();
  final _passwordTec = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _emailTec.dispose();
    _passwordTec.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constrainsts) {
          return Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constrainsts.maxHeight,
                  maxWidth: 400,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: context.textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          AppTextFormField(
                            label: 'Informe seu e-mail',
                            controller: _emailTec,
                            validator: Validatorless.multiple([
                              Validatorless.required('email obrigatório.'),
                              Validatorless.email('Email inválido.'),
                            ]),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          AppTextFormField(
                            label: 'Informe a Senha',
                            controller: _passwordTec,
                            obscureText: true,
                            validator: Validatorless.multiple(
                              [
                                Validatorless.required('Senha obrigatória.'),
                                Validatorless.min(6, 'Minimo de 6 caracteres.'),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          AppButton(
                            label: 'Acessar',
                            onPressed: () {
                              final formValid =
                                  _formKey.currentState?.validate() ?? false;
                              if (formValid) {
                                log('formValid');
                                widget._loginController.loginEmail(
                                    _emailTec.text.trim(),
                                    _passwordTec.text.trim());
                              } else {
                                log('formNotValid');
                              }
                            },
                            width: context.width,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Esqueceu sua senha ?'),
                              TextButton(
                                onPressed: () {
                                  if (_emailTec.text.isNotEmpty) {
                                    widget._loginController
                                        .forgotPassword(_emailTec.text.trim());
                                  } else {
                                    Get.snackbar(
                                      'Oops',
                                      'Digite email para prosseguir',
                                      // backgroundColor: Colors.red,
                                      margin: const EdgeInsets.all(10),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Criar uma nova.',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Não possui uma conta ?'),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.userRegisterEmail);
                                },
                                child: const Text(
                                  'CADASTRE-SE.',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
