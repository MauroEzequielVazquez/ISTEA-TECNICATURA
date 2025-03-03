using Microsoft.Win32;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Reflection;
using System.Reflection.Emit;
using System.Runtime.ConstrainedExecution;
using System.Xml.Linq;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace CiclosPreExamen
{
    internal class Program
    {
        static void Main(string[] args)
        {

            //Modulo 5 del curso nv1 Maxi -  CICLOS


            //1.Hacer un programa para mostrar los números del 1 al 10.No se debe realizar ningún pedido de datos.


            // LO HACEMOS CON CICLO WHILE

            int numero = 1, Cont = 0;

            // sin darnos cuenta, tenemos lo mismo que el ciclo for, 3 conceptos CLAVES

            // tenemos inicializacion cuando le damos el valor 1
            //tenemos condicion con numero <=10
            //tenemos incremento con el numero++



            //while (numero <= 10)
            //{

            //    Console.WriteLine(numero); // Mostramos el número
            //    numero++; // Incrementamos el número en 1

            //}


            //    do
            //    {
            //        Console.WriteLine(numero); // Mostramos el número
            //        numero++; // Incrementamos el número en 1
            //    }
            //    while (numero <= 10); // Continuamos mientras el número sea menor o igual a 10
            //}
            // es igual que el while (mientras) pero PRIMERO ejecuta y desp pregunta la condicion




            //2.Hacer un programa que solicite el ingreso de 10 números y que muestre el mayor de ellos 
            //    por pantalla. Solo se debe emitir UN valor por pantalla.

            // NOTA : . Usar int.MinValue  para la variable Max:
            // Es ideal si no sabes con certeza el rango de los números que se ingresarán(pueden incluir números negativos).
            // Garantiza que cualquier número ingresado sea mayor que el valor inicial.
            //Ventaja: Universal y seguro para cualquier entrada.

            //  Comparar con 0:
            //Funciona si tienes la certeza de que los números serán siempre positivos.
            //Desventaja: Si se ingresan números negativos, todos serán menores que 0, y el resultado será incorrecto.

            //   3.Inicializar Max con el primer número ingresado:
            //Otra buena práctica en muchos casos.
            //Elimina la necesidad de usar un valor "extremo" como int.MinValue.
            //Ventaja: Más eficiente, ya que el primer número ya se procesa como punto de partida.
            //Desventaja: Necesita un manejo especial para evitar errores si no se ingresan números(aunque tu ejercicio asume 10 entradas fijas).

            /*
               int num;
               int Max = int.MinValue;

               for (int x = 0; x < 5; x++)
               {
                   Console.WriteLine("Ingrese un numero");
                   num = Convert.ToInt32(Console.ReadLine());

                   if (num > Max)
                   {

                       Max = num;
                   }

               }
               Console.WriteLine("El mayor numero ingresado es : " + Max);
           }
            */

            // lo explicado previamente de usar x ej el primer num como max seria asi:

            //int num;
            //int Max;

            //Console.WriteLine("Ingrese un numero");
            //Max = Convert.ToInt32(Console.ReadLine()); // Primer número como inicialización.

            //for (int x = 1; x < 10; x++) // Empieza desde el segundo número.
            //{
            //    Console.WriteLine("Ingrese un numero");
            //    num = Convert.ToInt32(Console.ReadLine());

            //    if (num > Max)
            //    {
            //        Max = num;
            //    }
            //}
            //Console.WriteLine("El mayor numero ingresado es: " + Max);
            //}

            //3.Hacer un programa que solicite 20 edades y luego calcule el promedio de edad de aquellas 
            //    personas mayores a 18 años.
            /*
                        int edad;
                        decimal Promedio;
                        int Acu = 0;
                        int Cont = 0;

                        for (int x = 0; x < 5; x++)
                        {
                            Console.WriteLine("ingrese una edad");
                            edad = Convert.ToInt32(Console.ReadLine());

                            if (edad >= 18) {  // SI LA edad ingresada es mayor a 18, acumula y cuenta 1 edad mas
                                Acu = Acu += edad;
                                Cont++;
                            }
                        }
                        Promedio = Acu / Cont;

                        Console.WriteLine("La cantidad promedio de edades mayores a 18 fue: " + Promedio);
            */

            //4. Hacer un programa que solicite UN número y luego calcule y emita un cartel
            //  aclaratorio si el mismo es primo o no es primo.  Nota: un numero es primo cuando es divisible 
            // únicamente por 1 y por sí mismo.
            /*
                      int Numero;
                      int ContPrimo = 0;
                      Console.WriteLine("Ingrese un numero");
                      Numero = Convert.ToInt32(Console.ReadLine());

                      for (int x = 1; x <= Numero; x++)
                      {

                          if (Numero % x == 0)
                          {
                              ContPrimo++;

                          }


                      }


                      if (ContPrimo == 2)
                          Console.WriteLine("El numero ingresado es primo, xq es divisible solo x 1 y por si mismo, el ciclo For recorre desde 1 hasta N y si encuentra mas de 2 div no es primo y no cuenta");

                      else
                          Console.WriteLine("El numero ingresado no es primo");
            */



            /*


            //5.Hacer un programa que solicite 20 números y luego emitir por pantalla el máximo de los números
            //pares y el mínimo de los números impares.

            int num , maxPar = int.MinValue , MinImpar = int.MaxValue, ContPares = 0,  ContImpares = 0;
            // si el max par = 0 y minImpar = 0 me sirve tmb, sino inicializo en 0

            for (int x = 1; x < 6; x++) { // pongo 6 para hacer mas rapido

                Console.WriteLine("Ingrese un nro");
                num = Convert.ToInt32(Console.ReadLine());

                if (num % 2 == 0) // si es par

                {
                    ContPares++;

                    if (ContImpares == 1) // osea si es el primer par que ingresa, tomo ese par como maximo
                    {
                        maxPar = num;
                    }

                    else if (num > maxPar)
                        maxPar = num;
                }

                else
                { // OSEA si es IMPAR
                    ContImpares++;
                }

                    if (ContImpares == 1)
                    { // si es el primer impar que ingresa
                        MinImpar = num;
                    }

                    else if (num < MinImpar)
                    {
                        MinImpar = num;
                    }
                } // fin del for

            Console.WriteLine("El maximo de los Num pares ingresados es : " + maxPar);
            Console.WriteLine("El min de los Num Impares ingresados es :" + MinImpar);
            */




            //6. CICLOS COMBINADOS

            //1.Hacer un programa para ingresar 10 números.El mismo debe analizar y mostrar por pantalla 
            // cuántos de esos números son primos.
            /*
            int num;
            int contadorPrimos = 0;

            for (int x = 0; x < 10; x++) // primero cargo los 10 números
            {
                Console.WriteLine("Ingrese un número:");
                num = int.Parse(Console.ReadLine());

                int Con = 0; // Reinicio para contar divisores del número actual

                for (int y = 1; y <= num; y++) // ciclo para verificar divisores
                {
                    if (num % y == 0)
                    {
                        Con++;
                    }
                }

                if (Con == 2) // Si tiene exactamente 2 divisores, es primo
                {
                    contadorPrimos++;
                }
            }

            Console.WriteLine("La cantidad de números primos ingresados fue: " + contadorPrimos);

            */

            // 2. Se dispone de una lista de 5 listas de números enteros separados entre ellos por ceros.
            // Se pide determinar e informar:
            //El número de grupo con mayor porcentaje de números impares respecto al total de números que forman
            //el grupo.
            //Informar cuántos grupos están formados por todos números ordenados de mayor a menor.


            // Hacer antes de seguir con  el nv 2





            //3.Hacer un programa para recibir listas de números positivos que están separadas entre sí 
            // por un cero. El fin de la carga se notifica con un número negativo.Luego mostrar cuántos
            // números tiene cada lista.

            int n = 1; Cont = 0;



            // terminar de tarea tmb

            //while (n >= 0) {

            //    Console.WriteLine("Ingrese un numero");
            //    n = Convert.ToInt32(Console.ReadLine());
            //    Cont++;
            //    while (n > 0) // si pones 0 vuelve al while de arriba, si pones num neg termina el programa. 
            //    {
            //        Console.WriteLine("Ingrese un numero");
            //        n = Convert.ToInt32(Console.ReadLine());




            //Unidad 7 , VECTORES / ARRAYS

            /*

            //1.Hacer un programa que solicite 10 números enteros y los guarde en un vector. Luego recorrer
            //  los elementos y determinar e informar cuál es el valor máximo y su posición dentro del vector.
            int[] Numeros = new int[10];
            int Max = int.MinValue;
            int Pos = -1; // Inicializamos en -1 (por si no se asigna).

            // Primer ciclo: para cargar el vector.
            for (int x = 0; x < 10; x++)
            {
                Console.WriteLine("Ingrese un número:");
                Numeros[x] = int.Parse(Console.ReadLine());
            }

            // Segundo ciclo: para recorrer el vector y encontrar el máximo.
            for (int x = 0; x < 10; x++)
            {
                if (Numeros[x] > Max)
                {
                    Max = Numeros[x];
                    Pos = x + 1; // Ajustamos la posición (base 1).
                }
            }

            // Mostramos el resultado final.
            Console.WriteLine("El mayor número ingresado fue: " + Max + " y su posición dentro del vector es: " + Pos);
        
            */

            //2. Hacer un programa que solicite 10  números enteros y los guarde en un vector.
            //Luego recorrer ese vector para calcular el promedio. Mostrar por pantalla los
            //valores que son mayores al promedio.


            //NOTAAAA : Para recorrer el ciclo 
            // Puedo usar Numeros.Length en lugar de poner el número 10 directamente.De hecho, u
            //sar Length es preferible por varias razones
            //Si en el futuro decides cambiar el tamaño del vector (por ejemplo, de 10 a 20 elementos),
            //no tendrás que buscar y modificar manualmente el límite en todos los bucles.
            //El uso de Length garantiza que el bucle siempre recorra el número correcto de elementos.

            /*
            int num;
            int[] Numeros = new int[10];
            int Promedio;

            for (int x = 0; x < Numeros.Length; x++) // RECORREMOS Y CARGAMOS EL VECTOR
            {
                Console.WriteLine("Ingrese un Nro");
                num = Convert.ToInt32(Console.ReadLine());

                Numeros[x] = num;
            }
            int Acu = 0;

            for (int i = 0; i < 10 ; i++) // Recorro de nuevo para sacar el promedio
            {
                Acu = Acu += Numeros[i];


            }

            Promedio = Acu / 10;

            for (int y = 0; y < 10; y++) // ULTIMO ciclo for para sacar los num del vector mayores al prom
            {
                if (Numeros[y] > Promedio){
                    Console.WriteLine("El valor/es mayor/es al Promedio fueron : " + Numeros[y]);

                }
                Console.WriteLine("FIN DEL PROGRAMA");


            }
            */


            //3.Hacer un programa que solicite una cadena de caracteres y dos caracteres sueltos
            //(tres ingresos). El programa deberá generar una cadena donde todas las ocurrencias del
            //primer carácter dado hayan sido reemplazadas por el segundo. Mostrar el resultado en
            //pantalla.Ejemplo:
            //CADENA FUENTE: “La mar estaba serena"
            //CADENA RESULTADO: “Li mir estibi sereni"


            Char letraActual, letraNueva;// tmb puedo inicializarlo todo  aca directo pero no tiene sentido
            string Frase;

            Console.WriteLine("Ingrese una frase / string");
            Frase = Console.ReadLine();

            Console.WriteLine("Ingrese la letra a modificar de la frase");
            letraActual = char.Parse(Console.ReadLine());

            Console.WriteLine("Ingrese la letra nueva");
            letraNueva = char.Parse(Console.ReadLine());


            Frase = Frase.Replace(letraActual, letraNueva);


            Console.WriteLine("La nueva frase es :" + Frase);
            Console.WriteLine("Fin del \n  programa");

            // hacer de tarea el 4 antes de hacer el curso nv 2
           //  4.Una empresa comercializa 15 tipos de artículos y por cada venta realizada genera un registro con los siguientes datos:
             //  -Número de Artículo(1 a 15)
           //-Cantidad Vendida

           //Puede haber varios registros para el mismo artículo y el último se indica con número de artículo igual a 0.
           //Se pide determinar e informar:

            // a) El número de artículo que más se vendió en total.
            //b) Los números de artículos que no registraron ventas.
            //c) Cuantas unidades se vendieron del número de artículo 10.


        }
        
    }
}

