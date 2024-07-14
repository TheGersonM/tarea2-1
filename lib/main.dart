import 'package:flutter/material.dart';

void main() => runApp( MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});
  bool visible = false;

  //agregar un set y un get a la variable
  bool get() {
  return visible;
  }
  void set(bool value)
  {
    visible = value;
  }
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        appBar: AppBar(
          title: const Text(''),
        ),
        body:   Padding(
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
                  
                  onPressed: (){},
                  child: const Text('Iniciar sesion'),
                ),
                
              ],
            
            ),
          ),
        ),
      ),
    );
  }
}