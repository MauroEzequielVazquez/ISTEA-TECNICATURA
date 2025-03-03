using System.Net.Sockets;

namespace Clase10_postparcial
{
    internal class Program
    {
        static void Main(string[] args)
        {

            //arrays
            //los arrays contienen elementos EN ORDEN

            //declaracion
            //int[] numeros; //estamos DECLARANDO una variable de tipo array de enteros

            //////declarando y asignando
            /////
            //int[] numeros = new int[5]; //y determinando cuantos elementos va a tener el array

            //////declarando una variable de tipo array de string (caracteres)

            //string[] unArrayDeStrings;

            //los elementos de un array comienzan desde la posicion cero
            //////como hago para cargar un array? a mano
            ////////con el [] se accede al elemento
            ////////dentro del corchete se coloca el indice o index
            //numeros[0] = 1; //el 1 es escalar es un entero
            //numeros[1] = 2;
            //numeros[2] = 3;
            //numeros[3] = 4;
            //numeros[4] = 5;

            ////Console.WriteLine("En la posicion 3 del array esta el: " + numeros[3]);
            ////// QUE EN ESTE CASO ES EL NUMERO 4 XQ ARRANCA A CONTAR DESDE 0

            ////Console.WriteLine("La cantidad de elementos de mi vector/array es: "+ numeros.Length);

            //////tengo 5 elementos
            ////tengo posiciones de la 0 .... a la 4
            ////que longitud tiene? 5 (cuantos elementos tiene el vector) uso el metodo.length

            ////sumar elementos de un array
            //int acumulador = 0; //acumulador

            //for (int x = 0; x < numeros.Length; x++) //longitud es 5 ... x <=  numeros.Length - 1 ...  x=0,1,2,3,4 , puedo poner menor a 5
            //{
            //    acumulador += numeros[x]; //total = total + numeros[x];
            //}

            //Console.WriteLine("El total acumulado es: " + acumulador);



            //declarando, asignando, y determinando los elementos que va a contener el array

            //int[] numeros2 = new int[7] { 101, 102, 103, 104, 105, 106 , 107 };



            //int[] numeros2 = new int[7];

            //for (int x = 0; x < numeros2.Length; x++)
            //{
            //    Console.WriteLine("Introduce un número:");

            //    numeros2[x] = int.Parse(Console.ReadLine());
            //}

            //se puede declarar y determinar la cantidad y los elementos que va a contener el array
            //int[] numeros2 = { 101, 102, 103, 104, 105, 106, 107 };


            //RECORRER  el array y mostrando sus elementos

            //for (int x = 0; x < numeros2.Length; x++)  // uso configuracion reloj, INICIALIZO en cero 
            //{
            //    Console.WriteLine(numeros2[x]);

            //}
            //Console.WriteLine("****empieza el FOREACH ***");
            //foreach es una estructura para recorrer arrays o arreglos, vectores, colecciones
            //el foreach recorre cada uno de los elmentos del array
            //hasta donde? ya sabe hasta donde recorrer, porque toma solo los elementos del array
            // NO HACE FALTA ponerle 1 limite

            //foreach (int elemento in numeros2)
            //{
            //    Console.WriteLine(elemento);
            //}

            // En sintesis el Foreach recorre el vector o array y lo muestra, no hace falta ponerle el limite


            //intercambiar elementos de un array
            //COMO INVERTIR LOS ELEMENTOS DE UN ARRAY?

            //int[] numeros3 = new int[5] { 1, 2, 3, 4, 5 };

            //for (int x = 0; x < 2; x++) //I va desde cero hasta 1 osea que se ajecuta SOLO 2 VECES
            //{                           //Esto es porque solo necesitas intercambiar los primeros y
            //                            //los últimos elementos del array para invertirlo.
            //    int aux = numeros3[x];
            //    numeros3[x] = numeros3[4 - x];
            //    numeros3[4 - x] = aux;
            //}
            ////El METODO Join concatena los elementos de un array con una , y lo transforma en un string para mostrarlo
            ////con el writeline...
            
            //Console.WriteLine(string.Join(',', numeros3));


            //OTRA FORMA DE INVERTIR UN ARRAY ES USANDO Array.Reverse(parametro_array)

            //es un metodo estatico de la clase array, al ser estatico se puede utilizar sin necesidad
            //de declarar un objeto de la clase Array, simplemente lo uso.

            int[] numeros4 = new int[8] { 10, 22, 2, 4, 50, 11 ,12,123 };
            
            Array.Reverse(numeros4); // es void, no devuelve nada.. metodo para mostrarlos al reves
            
            //Console.WriteLine(string.Join(',', numeros4));
            Console.WriteLine(string.Join('-', numeros4));
            Console.WriteLine(string.Join('/', numeros4));


            //Console.WriteLine(numeros4); de esta forma me devuelve el tipo de dato

            //string.Join() este es un metodo estatico de clase string y lo puedo usar sin instanciar un objeto.
            //concatena los elmentos de un array con un char pasado como parametro, y retorna un string

            //DE QUE FORMAS VEO LOS ELEMENTOS DE UN ARRAY
            //FOR, FOREACH O CON JOIN

            //metodo de ordenamiento de un array "burbujeo"

            int[] vector = new int[5] { 8, 10, 6, 2, 4 };

            bool huboIntercambio;

            do
            {
                huboIntercambio = false; // si no hubo intercambio

                for (int x = 0; x < vector.Length - 1; x++) // Va de 0 a arr.Length - 1
                {
                    if (vector[x] > vector[x + 1])
                    {
                        int aux = vector[x];
                        vector[x] = vector[x + 1];
                        vector[x + 1] = aux;

                        huboIntercambio = true;
                        Console.WriteLine($"Intercambiados {vector[x + 1]} y {vector[x]}");
                    }
                }

                Console.WriteLine("Estado del arreglo después de una pasada: " + string.Join(',', vector));

            } while (huboIntercambio); //Repite si hubo intercambios en la pasada anterior


            Console.WriteLine("Arreglo ordenado: " + string.Join(',', vector));
            Console.ReadLine();


        }
    }
}
