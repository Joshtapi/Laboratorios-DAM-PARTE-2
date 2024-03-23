// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage(

    
      {Key? key,
      required String currentName,
      required String currentEmail,
      required String currentPhone})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileEditPageState createState() => _ProfileEditPageState();

}

class _ProfileEditPageState extends State<ProfileEditPage> {
  // ignore: prefer_final_fields
  TextEditingController _nameController = TextEditingController();
  // ignore: prefer_final_fields
  TextEditingController _emailController = TextEditingController();
  // ignore: prefer_final_fields
  TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Teléfono'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción para guardar los datos editados
                _saveChanges();
                Navigator.pop(context); // Regresar a la página de perfil
              },
              child: const Text('Guardar cambios'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveChanges() {
    // ignore: unused_local_variable
    String newName = _nameController.text;
    // ignore: unused_local_variable
    String newEmail = _emailController.text;
    // ignore: unused_local_variable
    String newPhone = _phoneController.text;

  }
}
