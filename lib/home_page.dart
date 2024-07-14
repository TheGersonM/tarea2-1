import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
   HomePage({
    super.key,
  });
  bool visible = false;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

 bool isValidLogin() {
    return emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ), body:   Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            
            child:  Column
            (
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
               children: [
              Column(
                children: [
                  const Text(
                    'Inicio de sesión',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Correo electrónico',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Contraseña',
                      suffix: InkResponse(
                        onTap: () {
                          // Aquí puedes implementar la lógica para mostrar/ocultar la contraseña
                          // setState(() {
                          //   obscureText = !obscureText;
                          // });
                        },
                          splashColor: const Color.fromARGB(255, 204, 148, 214),
                          child: const Icon(Icons.visibility),
                        ),
                      ),
                      obscureText: widget.visible,
                      
                    ),
                    const SizedBox(height: 50,),
                  ],
                ),
                ElevatedButton(
                  
                  onPressed: () {
                  if (isValidLogin()) {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('inicio');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, ingrese un correo y contraseña válidos.'),
                      ),
                    );
                  }
                },
                child: const Text('Iniciar sesión'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  
                  onPressed: (){
                    //Navigator.pop(context);
                    Navigator.pushNamed(context, 'registro');
                  },
                  child: const Text('Registrarme'),
                ),
              ],
            
            ),
          ),
        ),
    );
  }
}
