
using System;
using System.ComponentModel.Design;

namespace Clase7_23sep
{
    internal class Program
    {
        static void Main(string[] args)
        {


            //Repasamos propiedad Length para saber la cantidad de caracteres de un string


            //string texto = "Hola Maurito";
            //int LongitudDeTexto = texto.Length;
            //Console.WriteLine("La longitud total del sexo sacada con metodo Lenght es: " + LongitudDeTexto + " catacteres");





            //pasamos propiedad Subtring






            //sentencia Break,es una sentencia de "corte"
            //el break lo que hace es cortar la ejecucion del ciclo, en este caso, corta cuando contador es == 3
            /*int contador = 0;
            Console.WriteLine("Probando el break");
            
            while (contador < 6)
            {
                if (contador == 3)
                {
                    break;
                }
                Console.WriteLine($"Dentro del loop: {contador}");
                contador += 1;
            }
            Console.WriteLine($"Fuera del loop: {contador}");*/

            //continue

            /*int contador;
            contador = 0;
            Console.WriteLine("Probando el continue:");
            while (contador < 6)
            {
                if (contador == 3) //3
                {
                    continue; //se utiliza para saltar el resto de las instrucciones que quedan en la ejecucion del bucle actual
                } //pasa a la siguiente iteracion
                Console.WriteLine($"Dentro del loop: {contador}");
                contador += 1; //3
            }
            Console.WriteLine($"Fuera del loop: {contador}");
            */

            //ejemplo 2 - continue
            //pedimos al usuario que ingrese 3 numeros
            //vamos a saltear los numeros negativos y vamos a sumar los positivos
            //la idea es con el continue saltearnos los numeros negativos y sumar solo los positivos

            /*int sumaPositivos = 0;
            int contador = 0;

            while (contador < 5) //0,1,2,3,4
            {
                Console.WriteLine("Ingrese un numero");
                int numero = int.Parse(Console.ReadLine());

                if (numero<0) //numero es negativo
                {
                    Console.WriteLine("numero ignorado!");
                    continue;
                }

                sumaPositivos += numero; // sumaPositivos = sumaPositivos + numero;

                contador++;
            }

            Console.WriteLine("La suma de los numeros es: " + sumaPositivos);
           
            */

            //operadores logicos

            //int nro = 1;
            //Ejemplo 1
            /* Console.WriteLine("resultado 1");
             Console.WriteLine(nro > 0); //true
             Console.WriteLine("resultado 2");
             Console.WriteLine(!(nro <= 0)); //true
             //Ejemplo 12
             Console.WriteLine("resultado 3");
             Console.WriteLine(nro != 0); //true
             Console.WriteLine("resultado 4");
             Console.WriteLine(!(nro == 0)); //true


             Console.WriteLine(nro > 0); //true
             Console.WriteLine(!(nro > 0)); //*/

            //ejemplo 2 operadores logicos
            /*int cantPesos = 0;
            int cantCentavos = 100;
                               
            if (cantPesos >= 1 || (cantCentavos >= 100 && 3== 2) )  //el && tiene prevalencia sobre el  ||
            {
                Console.WriteLine("Puedo comprar un chicle");
            }
            else
            {
                Console.WriteLine("No me alcanza el dinero");
            }
            */
            /*
            int cantPesos = 6;
            int cantCentavos = 100;

            if (cantPesos >= 1 || (cantCentavos >= 100) || (3 == 3 && cantCentavos == 100))  //el && tiene prevalencia sobre el  ||
            {
                Console.WriteLine("Puedo comprar un chicle");
            }
            else
            {
                Console.WriteLine("No me alcanza el dinero");
            }

            */

            /*int cantPesos = 0;
            int cantCentavos = 100;

            if (cantPesos >= 100 && cantCentavos >= 99) //F
            {
                Console.WriteLine("Puedo comprar una gaseosa");
            }
            else
            {
                Console.WriteLine("No me alcanza el dinero");
            }*/

            //Format es statico, no hace falta instanciar nada, lo utilizo con laclase.Format
            //format es un metodo static (compartido) de la clase string
            /*string str = string.Format("Hola {0}", "Juan");  //string es la clase
            Console.WriteLine(str);
            */

            //No es static
            //str es el objeto
            /*string str = "hola"; //declarar o instanciar una variable de tipo string
            bool contiene = str.Contains("ola");//Devuelve True porque hola contiene ola
            */

            //metodos clase String
            //para utilizar con cadenas de caracteres (string) (texto)


            //Length sirve para saber la longitud de una cadena
            /* string texto = "Hola Mundo!"; //las cadenas empiezan de la posicion 0
             int resultado = (texto.Length);
             Console.WriteLine(resultado);
             */

            //ejemplo  ToLower convierte el texto a minuscula
            /*string respuesta;
            Console.Write("¿Cual es tu alimento favorito? ");
            respuesta = Console.ReadLine();

            string respuesta2 = respuesta.ToLower(); //convierto el ingrso del usuario a minuscula

            if (respuesta2 == "milanesas")
            {
                Console.WriteLine($"Siiii MILANESAS!!! Seamos mejores amigos!!!");
            }
            else
            {
                Console.WriteLine("Que aburrido...");
            }
            */

            //ejemplo para usar ToUpper convierte el texto a mayuscula
            /*
            string respuesta;
            string respuestaMayus;

            Console.Write("Escriba algo: ");

            respuesta = Console.ReadLine();

            respuestaMayus = respuesta.ToUpper();

            while (respuestaMayus != "ADIOS")
            {
                Console.WriteLine($"ECO: {respuestaMayus}");
                Console.Write("Escriba algo: ");
                respuesta = Console.ReadLine();
                
                respuestaMayus = respuesta.ToUpper();


            }

            */

            //reemplazar parametros (texto a reemplazar, reemplazo)
            /*string texto1 = "Bienvenidos";
            string reemplazo =texto1.Replace("en", "22");
            Console.WriteLine(reemplazo);*/

            /*string comienzan desde la posiion 0*/
            //bienvenidos


            //// COMO SACAR EL PRIMER Y ULTIMO CARACTER DE LA CADENA O STRING,, PUEDE SER EL DE LA POSICION  Q QUIERA
            //string palabra = "bienvenidos"; //posicion 10 el ultimo caracter
            //                                //longitud 11

            //char primero = palabra[0];

            //char ultimo = palabra[palabra.Length - 1]; // es como decir el ante ultimo,,usas length menos 1

            //Console.WriteLine(primero);
            //Console.WriteLine(ultimo);


            //subtring sirve para cortar porcions de texto de un string
            /*string textoresult = palabra.Substring(5);
            string textoresult2 = palabra.Substring(3, 6);
            
            Console.WriteLine(textoresult); //enidos
            Console.WriteLine(textoresult2); //nvenid

            */
            //introduccion a FOR
            //for es un loop (ciclo) similar al while
            //for(inicializacion;condicion booleana; incremento del contador)


            //EJEMPLO FOR escribir en consola las primeras potencias de 2

            /*
            int pot = 1;
            for (int exp = 0; exp < 16; exp++)
            {

                Console.WriteLine($"2 a la {exp} es {pot}");

                pot *= 2; // pot = pot * 2
            }
            */


            //Otro ej N°7 fotocopia
            //string codigo = "SEE-2334-AAP";
            //string Resultadoagarrando4digitosdelMedio = codigo.Substring(4, 4);
            //Console.WriteLine(Resultadoagarrando4digitosdelMedio);

            //Tengo 2 notas de parciales de un alumno... etc

            //int Nota1, Nota2, Promedio;

            //Console.WriteLine("Ingrese un valor para la Nota1:");
            //Nota1 = Convert.ToInt32(Console.ReadLine());

            //Console.WriteLine("Ingrese un valor para la Nota2:");
            //Nota2 = Convert.ToInt32(Console.ReadLine());

            //// Calcular el promedio
            //Promedio = (Nota1 + Nota2) / 2;

            //if (Promedio >= 7)
            //{
            //    Console.WriteLine("El alumno está aprobado ya que su promedio es mayor o igual a 7.");
            //}
            //else if (Promedio < 7)
            //{
            //    Console.WriteLine("El alumno NO está aprobado, ya que su promedio es menor a 7.");
            //}

            
            for (int i = 1; i <= 5; i++)
            {
                int resultado =  i * 4;
                Console.WriteLine(resultado);
            }
        }
    }

}
    
