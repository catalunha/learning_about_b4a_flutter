import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learning_about_b4a_flutter/app/view/controllers/user/profile/user_profile_controller.dart';
import 'package:learning_about_b4a_flutter/app/view/pages/user/profile/part/user_profile_photo.dart';
import 'package:learning_about_b4a_flutter/app/view/pages/utils/app_textformfield.dart';
import 'package:validatorless/validatorless.dart';

class UserProfilePage extends StatefulWidget {
  UserProfilePage({Key? key}) : super(key: key);
  final _profileController = Get.find<UserProfileController>();

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final dateFormat = DateFormat('dd/MM/y');

  final _formKey = GlobalKey<FormState>();
  final _typeStringTEC = TextEditingController();
  @override
  void initState() {
    super.initState();
    _typeStringTEC.text = widget._profileController.profile?.typeString ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar seu perfil'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.cloud_upload),
        onPressed: () async {
          var result = await saveProfile();
          if (result) {
            Get.back();
          } else {
            Get.snackbar(
              'Atenção',
              'Campos obrigatórios não foram preenchidos.',
              backgroundColor: Colors.red,
            );
          }
        },
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Profile.objectId: ${widget._profileController.profile!.objectId}',
                    ),
                    const SizedBox(height: 5),
                    AppTextFormField(
                      label: '* Seu nome completo.',
                      controller: _typeStringTEC,
                      validator: Validatorless.required('Nome é obrigatório'),
                    ),
                    UserProfilePhoto(
                      photoUrl: widget._profileController.profile!.typeFile,
                      setXFile: (value) =>
                          widget._profileController.xfile = value,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> saveProfile() async {
    final formValid = _formKey.currentState?.validate() ?? false;
    if (formValid) {
      await widget._profileController.append(
        typeString: _typeStringTEC.text,
      );
      return true;
    }
    return false;
  }
}
