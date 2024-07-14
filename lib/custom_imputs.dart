import 'package:flutter/material.dart';

class CuntomInput extends StatelessWidget {
  const CuntomInput({
    super.key,
    required this.controller,
    required this.label,
    this.icon = Icons.person,
    this.obscureText = false,
    this.maxLength = 20,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.iconSuffix = Icons.abc,

    required this.validator,
  });

  final String label;
  final IconData icon;
  final bool obscureText;
  final int maxLength;
  final String? errorText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final IconData iconSuffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: 'Ingrese su $label',
        suffix: InkResponse(
          splashColor: Colors.teal[50],
          // muestra un efecto de Ripple
          onTap: () {
            print('Mostrar contraseña');
          },
        ),
        //  como hago para darle funcionalidad?
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        icon: Icon(icon),
        label: Text(label),
      ),
      maxLength: maxLength,
      // maxLines: 3, // Textarea
    );
  }
}
