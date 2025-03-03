using System.Runtime.Intrinsics.X86;

namespace Clase616sep
{
    internal class Program
    {
        static void Main(string[] args)


        {

            // EJEMPLO DE SWITCH
            // int valor;
            //    Console.WriteLine("Indique un número: ");
            //   valor= int.Parse(Console.ReadLine());

            //switch (valor)
            //{
            //    case 1: //la variable val es 1?
            //        Console.WriteLine("es uno!!");
            //        break;
            //    case 2: //la variable val es 2?
            //        Console.WriteLine("es dos!");
            //        break;
            //    case 3: //la variable val es 3?
            //        Console.WriteLine("es tres!!");
            //        break;
            //    case 4:
            //        Console.WriteLine("es 4");
            //        break;

            //    default:
            //        Console.WriteLine("no es ninguno de los casos anteriores");
            //        break;
            //}

            //Console.WriteLine("estamos fuera del switch, en el main....");

            //            La estructura switch toma el valor de valor y lo compara con los números que has definido en los diferentes case de manera secuencial.

            //Cada case representa un valor específico. Por ejemplo:

            //case 2:
            //            significa: "Si valor es igual a 2, ejecuta el siguiente bloque de código".
            //case 3:
            //            significa: "Si valor es igual a 3, ejecuta este otro bloque", y así sucesivamente.
            //Si el valor ingresado por el usuario coincide con alguno de los valores que has definido en los case, el código asociado a ese case se ejecutará.


            //COMO OBTENER EL MAYOR DE DOS NUMEROS


            /*int primero;
            int segundo;
            int mayor;

            //Leer los dos números
            Console.Write("Indique un número: ");
            primero = int.Parse(Console.ReadLine());

            Console.Write("Indique otro número: ");
            segundo = int.Parse(Console.ReadLine());

            //Elegir el número más grande
            if (primero > segundo)
            {
                mayor = primero;
            }
            else 
            {
                mayor = segundo;
            }

            //Mostrar el resultado
            Console.WriteLine($"El más grande es: {mayor}");
            */


            //MAYOR DE TRES NUMEROS
            /*int primero;
            int segundo;
            int tercero;
            int mayor;

            //Leer los dos números

            Console.Write("Indique un número: ");
            primero = int.Parse(Console.ReadLine());

            Console.Write("Indique otro número: ");
            segundo = int.Parse(Console.ReadLine());

            Console.Write("Indique un último número: ");
            tercero = int.Parse(Console.ReadLine());

            mayor = primero;

            if (segundo > mayor)
            {
                mayor= segundo;
            }

            if (tercero > mayor)
            {
                mayor= tercero;
            }


            //Mostrar el resultado
            Console.WriteLine($"El más grande es: {mayor}"); // INTERPOLAMOS, yo prefiero concatenar


            //introduccion a loops -  WHILE
            //condicion de corte del while que el valor contador sea 6
            int contador = 0;

            while (contador<=5)
            {
                Console.WriteLine("el contador " + contador + " es menor igual a cinco");
                contador++; //contador = contador + 1;
            }

            Console.WriteLine("Estamos en el main - prog principal -");


            //este es un bucle infinito que no tiene corte, por que? por la condicion que siempre se cumple TRUE
            while (2==2)
            {
                Console.WriteLine("estoy dentro del while!!");

            }


            //EJEMPLO DE LOOP INFINITO -  NO HAY CONDICION DE CORTE
            /*while (true)
            {
                Console.WriteLine("Estoy atrapado en un loop!!!!");
            }*/

            //ejemplo de while como encontrar el mayor de varios numeros

            //    int nro;
            //    int mayor;
            //    string continuar;

            //    Console.WriteLine("Indique un número: ");
            //    nro= int.Parse(Console.ReadLine());

            //    mayor = nro;

            //    Console.WriteLine("¿Quiere indicar otro número? Responda s para sí: ");
            //    continuar = Console.ReadLine();

            //    while (continuar == "s")
            //    {

            //        Console.WriteLine("Indique un número: ");
            //        nro= int.Parse(Console.ReadLine());

            //        if (nro > mayor)
            //        {
            //            mayor = nro;
            //        }
            //    Console.WriteLine("¿Quiere indicar otro número? Responda s para continuar");
            //        continuar = Console.ReadLine();
            //    }

            //Console.WriteLine("El mayor es "+ mayor);

            //EJEMPLO  WHILE
            // Un programa que lee una secuencia de números
            // y cuenta cuántos números son pares y cuántos son impares.
            // El programa termina cuando se ingresa un cero.

            //int cantImpares = 0;
            //int cantPares = 0;
            //int nro;

            //Console.Write("Ingrese un número o 0 para detener:");
            //nro = int.Parse(Console.ReadLine());

            ////distinto a cero es la condicion de corte
            //while (nro != 0)
            //{
            //    //Verificar si el número es impar.
            //    //el numero es par cuando es divisible por 2
            //    //con % podemos saber si el numero es divisible por 2 o sea par, porque devuelve el resto
            //    //si el resto es != 0 por ejemplo 1 no es divisible por 2, significa que es impar

            //    if (nro % 2 != 0) //% es modulo y me devuelve el resto de divdir a un numero por otro
            //    {
            //        //Incrementar el contador de números impares odd_numbers.
            //        cantImpares += 1;
            //    }
            //    else //el numero es par osea el resto de dividir al numero por 2 (nro %2 ==0)  da cero
            //    {
            //        //Incrementar el contador de números pares even_numbers.
            //        cantPares += 1;
            //    }

            //    Console.Write("Ingrese un número o 0 para detener:");
            //    nro = int.Parse(Console.ReadLine());
            //}
            ////Imprimir resultados.
            //Console.WriteLine($"Cuenta de números impares: {cantImpares}");
            //Console.WriteLine($"Cuenta de números pares: {cantPares}");
            string mensaje = "Programación";

            int longitud = mensaje.Length;

            int contador = 0;

            string resultado = "";



            for (int i = 0; i < longitud; i++)

            {

                if (i % 2 == 0)

                {

                    resultado += mensaje[i];

                }

                else if (i % 3 == 0)

                {

                    resultado += "-";

                }

                else

                {

                    resultado += "*";

                }

                contador++;

            }
            Console.Write(resultado);

        }
    }
}
