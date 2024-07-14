import 'package:login/custom_imputs.dart';
import 'package:flutter/material.dart';

class Registro extends StatelessWidget {
  Registro({super.key});

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController contraseniaController = TextEditingController();
  final TextEditingController contraseniaconfirmadaController = TextEditingController();

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
                  Customimput(
                    label: 'Nombre',
                    controller: nombreController,
                    
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El nombre es obligatorio';
                      }
                      if(value.length < 3 || value.length>10){
                        return 'El nombre es no tiene el formato correcto';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Customimput(
                    controller: correoController,
                    label: 'Correo',
                    icon: Icons.email,
                    maxLength: 50,
                     validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El correo electrónico es obligatorio';
                    }
                    if (value.split('@').length - 1 != 1 ||
                        !value.endsWith('.edu.hn')) {
                      return 'El correo no es válido';
                    }
                    return null;
                  },
                  ),
                  const SizedBox(height: 16),
                  Customimput(
                    controller: telefonoController,
                    label: 'Telefono',
                    maxLength: 10,
                    icon: Icons.phone,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El teléfono es obligatorio';
                    }
                    if (int.tryParse(value) == null ||
                        !(value.startsWith('3') || value.startsWith('9')) ||
                        value.length != 8) {
                      return 'El teléfono no es válido';
                    }
                    return null;
                  },
                  ),
                  const SizedBox(height: 16),
                  Customimput(
                    controller: contraseniaController,
                    label: 'Contraseña',
                    icon: Icons.lock,
                    obscureText: true,
                    maxLength: 30,
                    keyboardType: TextInputType.visiblePassword,
                   validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'La contraseña es obligatoria';
                    }
                    if (value.length < 8 ||
                        !RegExp(r'[A-Z]').hasMatch(value) ||
                        !RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                      return 'La contraseña debe tener al menos 8 caracteres, incluyendo una mayúscula y un carácter especial';
                    }
                    return null;
                  },
                  ),
                  const SizedBox(height: 16),
                  Customimput(
                  controller: contraseniaconfirmadaController,
                  label: 'Confirmación de Contraseña',
                  icon: Icons.lock,
                  obscureText: true,
                  maxLength: 30,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'La confirmación de la contraseña es obligatoria';
                    }
                    if (value != contraseniaController.text) {
                      return 'Las contraseñas no coinciden';
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
              'contraseniaConfirmada': contraseniaconfirmadaController.text
            };

            print(data);
          },
        ));
  }
}
