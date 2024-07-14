import 'package:login/Custom_Imputs.dart';
import 'package:flutter/material.dart';

class Registro extends StatelessWidget {
  Registro({super.key});

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController contraseniaController = TextEditingController();

  // equivalente al controller del formulario
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Datos personales'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CuntomInput(
                    label: 'Nombre',
                    controller: nombreController,
                    
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El nombre es obligatorio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CuntomInput(
                    controller: correoController,
                    label: 'Correo',
                    icon: Icons.email,
                    maxLength: 50,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El correo electronico es obligatorio';
                      }

                      if (!value.contains('@')) {
                        return 'El correo no es válido';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CuntomInput(
                    controller: telefonoController,
                    label: 'Telefono',
                    maxLength: 10,
                    icon: Icons.phone,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El telefono es obligatorio';
                      }

                      if (int.tryParse(value) == null ||
                          !value.startsWith('9')) {
                        return 'El teléfono no es válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CuntomInput(
                    controller: contraseniaController,
                    label: 'Contraseña',
                    icon: Icons.lock,
                    obscureText: true,
                    maxLength: 30,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'La contrasenia es obligatoria';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save),
          onPressed: () {
            if (!formKey.currentState!.validate()) {
              return;
            }

            final data = {
              'nombre': nombreController.text,
              'correo': correoController.text,
              'telefono': telefonoController.text,
              'contrasenia': contraseniaController.text,
            };

            print(data);
          },
        ));
  }
}
