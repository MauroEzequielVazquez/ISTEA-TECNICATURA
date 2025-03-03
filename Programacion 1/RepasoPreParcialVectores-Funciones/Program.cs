using Microsoft.Win32;
using System;
using System.Net;
using System.Numerics;
using System.Reflection.Emit;
using System.Runtime.ConstrainedExecution;
using System.Runtime.Intrinsics.X86;
using System.Xml.Linq;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace RepasoPreParcialVectores_Funciones
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // EJERCICIOS DE VECTORES...

            // 1.Hacer un programa que solicite 10 números enteros y los guarde en un vector.
            // Luego recorrer los elementos y determinar e informar cuál es el valor máximo y su posicióN
            // dentro del vector.


            //    int Numeros;
            //    int  Posicion = 0; // Inicializamos la posición como 0 (para el índice real del vector).
            //    int Maximo = int.MinValue; // Usamos int.MinValue para considerar números negativos.
            //    int[] VectorNumeros = new int[10];

            //    // Solicitar los 5 números y almacenarlos en el vector.
            //    for (int x = 0; x < 5; x++)
            //    {
            //        Console.WriteLine("Ingrese un número para cargar al vector:");
            //        Numeros = int.Parse(Console.ReadLine());
            //        VectorNumeros[x] = Numeros;

            //        // Verificar si el número actual es el máximo.
            //        if (Numeros > Maximo)
            //        {
            //            Maximo = Numeros; // Actualizar el máximo.
            //            Posicion = x + 1; // Guardar la posición como índice ajustado al usuario (x + 1).
            //        }
            //    }

            //    // Mostrar resultados.
            //    Console.WriteLine("El cuarto número ingresado (ubicado en la posición 3) fue: " + VectorNumeros[3]);
            //    Console.WriteLine("El valor máximo ingresado dentro del vector fue: " + Maximo + " y su posición es: " + (Posicion + 1));
            //}



            // EXPLICACIÒN Y CORRECCIONES A TENER EN CUENTA!!!

            // Int.MinValue:

            //Se usa para inicializar Maximo, asegurando que cualquier número ingresado será mayor inicialmente,
            //incluso si son negativos. XQ SI PONGO CERO, Y METO NUM NEGATIVOS ME DA ERROR!!



            //Posición corregida:


            //Ajuste de la posición(Posicion = x + 1):
            //Esto asegura que las posiciones mostradas al usuario sean intuitivas(comenzando desde 1).
            //Explicación de la posición del cuarto elemento:

            //Al mostrar el cuarto elemento del vector(VectorNumeros[3]), seguimos usando el
            //índice real del vector(que es 3), pero explicamos al usuario que corresponde al cuarto número ingresado.





            //2.Hacer un programa que solicite 10  números enteros y los guarde en un vector.
            //Luego recorrer ese vector para calcular el promedio. Mostrar por pantalla los valores
            //que son mayores al promedio.

            //decimal Numeros;
            //decimal[] VectorNumeros = new decimal[10];
            //decimal Promedio;
            //decimal Acu = 0;
            //int Cont = 0;



            //    for (int x = 0; x < 10; x++) {
            //        Console.WriteLine("Ingrese un Numero para cargar el Vector");
            //        Numeros = Convert.ToDecimal(Console.ReadLine());
            //        VectorNumeros[x] = Numeros;
            //        Acu += VectorNumeros[x];
            //        Cont++;

            //    }

            //    Promedio = Acu / Cont;
            //    Console.WriteLine("El promedio de los 10 numeros ingresados a mi vector fue: " + Promedio);




            //3.Hacer un programa que solicite una cadena de caracteres y dos caracteres sueltos(tres ingresos). El programa deberá generar una cadena donde todas las ocurrencias del primer carácter dado hayan sido reemplazadas por el segundo. Mostrar el resultado en pantalla.Ejemplo:
            //CADENA FUENTE: “La mar estaba serena"
            //CARÁCTER 1: ‘a’ CARÁCTER 2: ‘i’
            // //CADENA RESULTADO: “Li mir estibi sereni"

            // string CadenaFuente; // = "La mar estaba serena"; // string con DOBLE comila " "
            // char Caracter;  // los char van con Comilla SIMPLE ' ' -- pUEDO ASIGNARLE LA LETRA ACA
            // char  CaracterNuevo; // PUEDO ASIGNARLE LA LETRA ACA

            // // PUEDO SOLICITARLA ASI, o hacer como arriba que directamente le asigne 1 valor..
            // Console.WriteLine("Ingrese una cadena de texto");
            // CadenaFuente = Console.ReadLine();

            // Console.WriteLine("Ingrese la letra a modificar");
            // Caracter = char.Parse(Console.ReadLine());

            // Console.WriteLine("Ingrese la nueva letra");
            // CaracterNuevo = char.Parse(Console.ReadLine());


            //string NuevaFrase = CadenaFuente.Replace(Caracter, CaracterNuevo);

            // Console.WriteLine("La nueva frase es: " + NuevaFrase);


            //4.Una empresa comercializa 15 tipos de artículos y por cada venta realizada genera un registro
            //con los siguientes datos.
            //-Número de Artículo(1 a 15)
            //-Cantidad Vendida
            //Puede haber varios registros para el mismo artículo y el último se indica con número de artículo
            //igual a 0.




            //Se pide determinar e informar:
            // a) El número de artículo que más se vendió en total.
            //b) Los números de artículos que no registraron ventas.
            //c) Cuantas unidades se vendieron del número de artículo 10.


            //int NumeroArticulo;
            //int CantidadVendida;
            //int[] TotalCantVendida = new int[15];

            //// Inicializar el arreglo con ceros (no es estrictamente necesario en C# ya que por defecto se inicializa en 0)
            //for (int x = 0; x < TotalCantVendida.Length; x++)
            //{
            //    TotalCantVendida[x] = 0;
            //}

            //// Entrada de datos
            //Console.WriteLine("Ingrese un Número para el Artículo (1 a 15, o 0 para terminar):");
            //NumeroArticulo = int.Parse(Console.ReadLine());

            //while (NumeroArticulo != 0)
            //{
            //    Console.WriteLine("Ingrese la cantidad vendida:");
            //    CantidadVendida = int.Parse(Console.ReadLine());

            //    // Validar que el artículo está dentro del rango permitido
            //    if (NumeroArticulo >= 1 && NumeroArticulo <= 15)
            //    {
            //        TotalCantVendida[NumeroArticulo - 1] += CantidadVendida; // Acumular las ventas
            //    }
            //    else
            //    {
            //        Console.WriteLine("Número de artículo inválido. Debe estar entre 1 y 15.");
            //    }

            //    Console.WriteLine("Ingrese un Número para el Artículo (1 a 15, o 0 para terminar):");
            //    NumeroArticulo = int.Parse(Console.ReadLine());
            //}

            //// Punto A: El número de artículo más vendido
            //int MaxCantidad = TotalCantVendida[0];
            //int NroMaximo = 1;

            //for (int x = 0; x < TotalCantVendida.Length; x++)
            //{
            //    if (TotalCantVendida[x] > MaxCantidad)
            //    {
            //        MaxCantidad = TotalCantVendida[x];
            //        NroMaximo = x + 1; // Ajustar para mostrar el número del artículo
            //    }
            //}

            //Console.WriteLine($"El artículo más vendido es: {NroMaximo} con una cantidad de: {MaxCantidad}");

            //// Punto B: Artículos que no registraron ventas
            //Console.WriteLine("Artículos que no registraron ventas:");
            //for (int x = 0; x < TotalCantVendida.Length; x++)
            //{
            //    if (TotalCantVendida[x] == 0)
            //    {
            //        Console.WriteLine($"Artículo {x + 1} no tuvo ventas.");
            //    }
            //}

            //// Punto C: Unidades vendidas del artículo número 10
            //Console.WriteLine($"La cantidad de unidades vendidas del artículo 10 es: {TotalCantVendida[9]}");

            // NOTA!!!!!

            //Exacto, si no usas TotalCantVendida.Length o un valor explícito como 15 (el tamaño
            //del arreglo), el código no compilará o se romperá durante la ejecución porque length no
            //está definido en ese contexto.

            //En C#, los arreglos tienen la propiedad Length, que te permite acceder al 
            // tamaño del arreglo. Es la forma adecuada de determinar dinámicamente cuántos elementos 
            // tiene el arreglo, especialmente si en el futuro decides cambiar su tamaño.

            

        }

    }
}
        
