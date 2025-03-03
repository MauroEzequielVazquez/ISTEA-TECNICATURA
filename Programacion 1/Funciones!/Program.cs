using System.ComponentModel.Design;
using System.Runtime.Serialization;

namespace Funciones_
{

    //    NOTA!! 1. Visual Studio
    //Acción: Presiona Ctrl + K, luego Ctrl + D(formatea todo el documento).

    // Vamos a ver Funciones!!


    // En este caso, la idea va a ser armar una función que resuelva algo y luego armar un main que interactúe
    // con una persona para pedir y mostrar datos pero que llame a esa función para resolver lo planteado.Vamos?


    //1. Hacer una función llamada “producto” que reciba dos números enteros y que devuelva el producto de
    //ambos. Luego hacer un programa que pida el precio de un artículo y la cantidad vendida y muestre por
    //pantalla el monto total a pagar. Usar la función.


    //2. Hacer una función llamada “par” que reciba un número entero y devuelva 1 si es par o cero si no lo es
    //Hacer un programa para ingresar 20 números y mostrar por pantalla cuántos son pares.



    internal class Program
    {
        static void Main(string[] args)
        {
            // PUNTO 1
            /*  int PrecioArticulo, CantidadVendida, MontoTotal;

           Console.WriteLine("Ingrese un valor para el PrecioArticulo");
            PrecioArticulo = int.Parse(Console.ReadLine());

           Console.WriteLine("Ingrese un valor para la cantidad Vendida");
           CantidadVendida = int.Parse(Console.ReadLine());

           MontoTotal = producto(PrecioArticulo, CantidadVendida);

         Console.WriteLine("El monto total de acuerdo al producto seleccionado por su cantidad " +
          "vendida fue :" + MontoTotal);
            */

            
            // Punto 2
            /*int num, contadorPares = 0;

            for (int x = 0; x < 5; x++) // Cambiado de 20  a 5 para probar mas facil
            {
                Console.WriteLine("Ingrese un número:");
                num = int.Parse(Console.ReadLine());

                if (Par(num)) // Llama a la función `Par` y verifica si es true es par sino es impar y no hace nada
                {
                    contadorPares++;
                }

            }
            Console.WriteLine("La cantidad de Pares ingresados fue: " + contadorPares);
            */




            //fUNCION DEL PUNTO 1

            /*static int producto ( int a, int b )
            {

                return a * b; // return devuelve 1 solo valor, en este caso el result de esa multip

                // o puedo hacer

                //int R = a * b;
                //return R;

            }


           /*/

            /*
            //Funcion del PTO 2
            static bool Par(int a)
        {
            if (a % 2 == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
            */
        }



























        //3. Hacer una función llamada “primo” que reciba un número entero y devuelva 1 si el número
        //es primo o cero si no lo es.Hacer un programa para ingresar números.
        //El lote corta cuando se ingresa un número cero.Informar el promedio teniendo en cuenta sólo
        //los números primos.

}

        // Funcion Punto 3

      


}



















        //4. Hacer una función de tipo void (porque no va a devolver nada) llamada “positivoNegativoCero” que reciba un número por valor y una variable por referencia.Que analice el número y escriba variable recibida por referencia con:

        //a. 1 si el número es positivo.
        //  b. -1 si el número es negativo.
        //   c. 0 si el número es cero.










    }

}
