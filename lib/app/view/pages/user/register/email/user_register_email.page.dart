import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/user/register/email/user_register_email_controller.dart';
import 'package:learning_about_b4a_flutter/app/view/pages/utils/app_button.dart';
import 'package:learning_about_b4a_flutter/app/view/pages/utils/app_textformfield.dart';
import 'package:validatorless/validatorless.dart';

class UserRegisterEmailPage extends StatefulWidget {
  final _authRegisterEmailController = Get.find<UserRegisterEmailController>();

  UserRegisterEmailPage({Key? key}) : super(key: key);

  @override
  State<UserRegisterEmailPage> createState() => _UserRegisterEmailPageState();
}

class _UserRegisterEmailPageState extends State<UserRegisterEmailPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _phoneEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _phoneEC.dispose();
    _passwordEC.dispose();
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
                            'Cadastro',
                            style: context.textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                              'Preencha os campos abaixo para criar o seu cadastro.'),
                          const SizedBox(height: 20),
                          AppTextFormField(
                            label: 'E-mail',
                            controller: _emailEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('email obrigatório.'),
                              Validatorless.email('Email inválido.'),
                            ]),
                          ),
                          const SizedBox(height: 20),
                          AppTextFormField(
                            label: 'Senha',
                            obscureText: true,
                            controller: _passwordEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('Senha obrigatória.'),
                              Validatorless.min(6, 'Minimo de 6 caracteres.'),
                            ]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppTextFormField(
                            label: 'Confirme senha',
                            obscureText: true,
                            validator: Validatorless.multiple(
                              [
                                Validatorless.required(
                                    'confirmação de senha obrigatória.'),
                                Validatorless.min(6, 'Minimo de 6 caracteres.'),
                                Validatorless.compare(_passwordEC,
                                    'Senha diferente do informado anteriormente.')
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                              'Após clicar em CADASTRAR você receberá um email para validação deste cadastro. É necessário ir na caixa de entrada do email informado aqui e validar seu cadastro antes de tentar login.'),
                          const SizedBox(
                            height: 20,
                          ),
                          AppButton(
                            label: 'Cadastrar',
                            onPressed: () {
                              final formValid =
                                  _formKey.currentState?.validate() ?? false;
                              if (formValid) {
                                log('formValid');
                                widget._authRegisterEmailController
                                    .registerEmail(
                                  email: _emailEC.text.trim(),
                                  password: _passwordEC.text.trim(),
                                );
                              } else {
                                log('formNotValid');
                              }
                            },
                            width: context.width,
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
