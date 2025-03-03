using static System.Runtime.InteropServices.JavaScript.JSType;
using System.Net;
using System.Runtime.ConstrainedExecution;
namespace UltimoRepasoPreParcial_Funciones
{
    internal class Program
    {
        //1. Hacer una función llamada “producto” que reciba dos números enteros y que devuelva
        //    el producto de ambos.Luego hacer un programa que pida el precio de un artículo y
        //   la cantidad vendida y muestre por pantalla el monto total a pagar.Usar la función.


        //2. Hacer una función llamada “par” que reciba un número entero y devuelva 1 si es par o cero si no 
        //  lo es. Hacer un programa para ingresar 20 números y mostrar por pantalla cuántos son pares.


        //3. Hacer una función llamada “primo” que reciba un número entero y devuelva 1 si el número es primo
        //o cero si no lo es. Hacer un programa para ingresar números. El lote corta cuando se ingresa un
        //número cero. Informar el promedio teniendo en cuenta sólo los números primos.



        //4. Hacer una función de tipo void (porque no va a devolver nada) llamada “positivoNegativoCero”
        //que reciba un número por valor y una variable por referencia. Que analice el número y escriba
        //variable recibida por referencia con:

        //a. 1 si el número es positivo.
        //b. -1 si el número es negativo.
        //c. 0 si el número es cero.







        static void Main(string[] args)
        {
            //Ejercicio1 :
            /*
            int precio, cantVendida, MontoTotal;
            Console.WriteLine("Ingrese un precio para el producto vendido");
            precio = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("Ingrese la cantidad Vendida");
            cantVendida = Convert.ToInt32(Console.ReadLine());

      

            MontoTotal = Producto(precio, cantVendida);
            Console.WriteLine("El precio final de la venta fue:" + MontoTotal);
            */




            //int a;
            //int ContadorPares = 0;

            //for (int x = 0; x < 20; x++) {

            //  Console.WriteLine("Ingrese un nro");
            //a = int.Parse(Console.ReadLine());

            //    if (Par(a)){ 
            //       ContadorPares++;
            //    }

            //}



            string[] words = { "apple", "banana", "cherry", "date" };

            foreach (var word in words)

            {

                Console.Write(word.Length + " ");


            }












        }

        // FUERA DEL MAIN hago las funciones...
        //static int Producto ( int a, int b )
        //{
        //    return a * b; // o creo la variable r  y le asigno a* b
        //}

        static bool Par (int n) // puedo hacer la func tipo bool y que devuelve true (1) o false (0)
        {
            if (n % 2 == 0)
                return true;
            else 
                return false;

        }
            
    }
}
