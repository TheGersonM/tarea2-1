import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
 HomePage({
    super.key,
  });
  bool visible=false;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

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
                    const Text('Inicio de sesion', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 40,),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Correo electronico',
                      ),
                      
                    ),
                    const SizedBox(height: 20,),
                    TextField(
                      decoration: InputDecoration(
                        border: const  OutlineInputBorder(),
                        labelText: 'Contraseña',
                        suffix: InkResponse(
                          onTap: (){
                            setState(() {
                              widget.visible = !widget.visible;
                            }
                            );
                            
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
                  
                  onPressed: (){
                    //Navigator.pop(context);
                    Navigator.pushNamed(context, 'inicio');
                  },
                  child: const Text('Iniciar sesion'),
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
