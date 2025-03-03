namespace Clase5
{
    internal class Program
    
  
            {
                static void Main(string[] args)
                {
            // Console.WriteLine("Clase 9 se septiembre");
            //Console.WriteLine("Binvenidos, hoy vamos a ver ejemplos de Condicional IF");
            // CTRL+K+C Para comentar y CTRL+K+U para descomentar

            /*condicional IF*/
            ///*ejemplo*/
            //Console.WriteLine("Ingrese un valor para la Cantidad de Ovejas, si cumple el condicional ejecuta sino se cierra");
            //        int cantOvejas = 119;//Cambiar a 121 para ver el efecto

            //cantOvejas = int.Parse(Console.ReadLine());

            //        if (cantOvejas >= 120)
            //        {
            //            Console.WriteLine("Tendiendo la cama");
            //            Console.WriteLine("Tomando ducha");
            //            Console.WriteLine("Durmiendo");
            //        }
            //        Console.WriteLine("Alimentando a los perros");

                //el ejercicio de abajo entra por hay entradas que es true, y no continua evaluando los else
                //probar las diferentes combinaciones de true y false
                //    probar con todos en false y quitando la rama del else
                    
            
                    //bool hayBuenClima = true;
                    //bool hayEntradas = true;
                    //bool hayLugarEnRestaurante = true;
                    //if (hayBuenClima)
                    //{
                    //    Console.WriteLine("Caminando");
                    //}
                    //else if (hayEntradas)
                    //{
                    //    Console.WriteLine("En el cine");
                    //}
                    //else if (hayLugarEnRestaurante)
                    //{
                    //    Console.WriteLine("Almorzando");
                    //}
                    //else
                    //{
                    //    Console.WriteLine("Viendo tele en casa");
                    //}

                    //Console.WriteLine("Fin del programa");
                    
                //EJERCICIOS DE REPASO IF
                /*1 - Usando uno de los operadores de comparación, escriba un programa simple 
                 que solicite al usuario un valor N como entrada, que es un
                 número entero, e imprima False si N es menor que 100, y True si N es mayor o igual que 100 
                    sin usar un bloque if.

                 Datos de prueba:
                    Usuario ingresa 55; el programa responde False
                 Usuario ingresa 99; el programa responde False
                 Usuario ingresa 100; el programa responde True
                 Usuario ingresa 101; el programa responde True*/

                //Console.WriteLine("Ingrese un numero");
                //int n = int.Parse(Console.ReadLine());

            //sin if
            // Console.WriteLine(n >= 100);

            //usando if
            //if (n >= 100)
            //{
            //    Console.WriteLine("true");
            //}
            //else
            //{
            //    Console.WriteLine("false");
            //}

            /* EJEMPLO 2 - Escriba un programa donde el usuario deba ingresar por consola un valor entre 0 y 255.
            El valor 255 equivale al color blanco, cualquier otro valor equivale a negro. Informar por
            pantalla si se ingresó el valor correspondiente al blanco o a negro. Cualquier otro valor es inválido.*/

            //Console.WriteLine("Ingrese un valor entre 0 y 255");
            // string input = Console.ReadLine();

            //if (int.TryParse(input, out int valor)) {

            //    if (valor >= 0 && valor <=255)
            //    {
            //        if (valor == 255)
            //        {
            //            Console.WriteLine("Es color blanco");
            //        }
            //        else
            //        {
            //            Console.WriteLine("Es color negro");
            //        }

            //    }
            //    else
            //    {
            //        Console.WriteLine("El valor ingresado es invalido!");
            //    }

            //}
            //else
            //{
            //    Console.WriteLine("Entrada invalida");
            //}



            /*
             otra forma:
            que el usuario ingrse el valor y convertimos a int
            validar si el valor esta dentro del rango
            if (valor >= 0 && valor <=255)...... continua como el anterior
             */
            /*
             * 3- Escriba un programa donde el usuario deba ingresar un valor entre 0 y 255. 
             Se le informará cuál fue el color ingresado según los siguientes
             rangos:
             0 a 100: Rojo
             101 a 180: Verde
             181 a 255: Azul
             Cualquier otro valor es inválido
             */

            //Console.WriteLine("Ingrese un valor entre 0 y 255");
            //string input = Console.ReadLine();

            /*if (int.TryParse(input, out int valor))
            {
                if (valor >= 0 && valor <= 255)
                {
                    if (valor>= 0 & valor <=100)
                    {
                        Console.WriteLine("Es rojo");
                    }
                    else if (valor>=101 && valor <= 180)
                    {
                        Console.WriteLine("Es verde");
                    }
                    else if (valor >= 181 && valor <= 255)
                    {
                        Console.WriteLine("Es azul");
                    }
                }
                else
                {
                    Console.WriteLine("El valor ingresado esta fuera del rango");
                }
            }
            else
            {
                Console.WriteLine("Entrada invalida");
            }*/

            //otra forma

            /*int entrada2 = int.Parse(Console.ReadLine());

            if (entrada2 >= 0 && entrada2 <= 255)
            {
                if (entrada2 >= 0 && entrada2 <= 100)
                {
                    Console.WriteLine("Es rojo");
                }
                else if (entrada2 >= 101 && entrada2 <= 180)
                {
                    Console.WriteLine("Es verde");
                }
                else if (entrada2 >= 181 && entrada2 <= 255)
                {
                    Console.WriteLine("Es azul");
                }
            }
            else
            {
                Console.WriteLine("El valor ingresado esta fuera del rango");
            }*/

            //If abreviado
            //operador condicional ternario
            /*int ingreso = Convert.ToInt32(Console.ReadLine());
            //verificar si el numero ingrsado es menor a 100 mostrar es menor, si no mostrar mayor
            string  resultado = ingreso < 100 ? "Es menor" : "Es mayor";
            Console.WriteLine(resultado);
            */
            /*EJEMPLO*/

            /*
             * 
             * El programa debe pedir por consola un usuario.
            Y debe pedir una contraseña.
            Verifique si el usuario es válido o inválido (se considera un usuario válido aquel cuyo valor sea “istea”).
            Verifique si la contraseña es válida o inválida (se considera una contraseña válida aquella cuyo valor es “1234”.
            Si el usuario no es válido deberá informar “Usuario inválido”.
            Si el usuario es válido pero la contraseña no lo es, informar “Contraseña inválida”.
            Si el usuario y la contraseña son válidos informar “Bienvenido” seguido del nombre del usuario.*/

            /*string usuario;
            string contrasenia;

            Console.WriteLine("Ingrese un usuario:");
            usuario = Console.ReadLine();

            if (usuario == "istea")
            {
                Console.WriteLine("Ingrese la contraseña");
                contrasenia = Console.ReadLine();

                if (contrasenia == "1234")
                {
                    Console.WriteLine("Bienvenido: " + usuario);

                }
                else
                {
                    Console.WriteLine("La contraseña es incorrecta");
                }

            }
            else
            {

                Console.WriteLine("El usuario ingresado es invalido!!");

            }*/

           // manejo de string
           // uso de substring, devuelve una porcion de string(texto)
            string ingreso = "Hola mundo"; // las posiciones en una cadena o string comienzan desde 0 
            string resultado = ingreso.Substring(5); // se le pasa la posicion desde donde quiero empezar a leer el texto... hasta dnde termina
            string resultado2 = ingreso.Substring(4,3); //desde donde quiero empezar a leer el texto, y cuantos caracteres quiero tomar
            Console.WriteLine(resultado);
            Console.WriteLine(resultado2);
        }
    }
        }
