using System;
/*Crear un programa en c#  de manera sencilla que simule  una tienda pequeña que ofrece dos productos distintos.  El programa permitira a  los usuarios 
   * realizar operaciones basicas relacionadas con la  administracion del inventario, incluyendo la visualización de productos
   * y sus cantidades en stockm así como la actualización del inventario. 
   * 
   * Requisitos: 
   * 1- Productos : El programa deberá trabajar con "producto1" y "producto2" . Cada uno de estos productos tiene una cantidad inicial       
   * en stock , (por ejemplo 10 para "producto1" y 20 para "producto2" ).
   * 
   * 2- Menu : El programa deberá mostrar un menú con las siguientes opciones:
   *  1- Ver productos en stock : Muestra los nombres de los productos disponibles y sus cantidades en stock.
   *  
   *  2- Agregar stock a un producto : Permite agregar una cantidad específica al stock de uno de los productos
   *  ( se debe especificar el  nombre del producto y la cantidad a agregar)
   *  
   *  3- Eliminar stock de un producto: Permite eliminar una cantidad específica del stock de uno de los productos
   *  ( se debe especificar el  nombre del producto y la cantidad a eliminar)
   *  
   *  0- Salir del programa
   *

     3- Operaciones
     - Al agregar stock a un producto, el programa debe incrementar la cantidad de producto en stock,

     - Al eliminar stock de un producto, el programa debe decrementar la cantidad de producto en stock.
     Si se intenta eliminar una cantidad mayor a la disponible en stock, debe mostrar un mensaje de error.


     4- Flujo
     El programa debe seguir ejecutandose hasta que el usuario seleccione la opción salir.
*/


namespace Vazquez_Mauro
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // Inicialización de productos
            int producto1Stock = 10;
            int producto2Stock = 20;

            while (true)
            {
                // Mostrar menú
                Console.WriteLine("Seleccione una opción:");
                Console.WriteLine("1 - Ver productos en stock");
                Console.WriteLine("2 - Agregar stock a un producto");
                Console.WriteLine("3 - Eliminar stock de un producto");
                Console.WriteLine("0 - Salir");
                Console.Write("Opción: ");

                // Leer opción del usuario
                string opcion = Console.ReadLine();

                if (opcion == "1")
                {
                    // Ver productos en stock
                    Console.WriteLine("Productos en stock:");
                    Console.WriteLine("Producto 1: " + producto1Stock + " unidades");
                    Console.WriteLine("Producto 2: " + producto2Stock + " unidades");
                }
                else if (opcion == "2")
                {
                    // Agregar stock
                    Console.Write("Ingrese el nombre del producto (producto1/producto2): ");
                    string productoAgregar = Console.ReadLine();
                    Console.Write("Ingrese la cantidad a agregar: ");

                    try
                    {
                        int cantidadAgregar = int.Parse(Console.ReadLine());

                        if (productoAgregar.Equals("producto1", StringComparison.OrdinalIgnoreCase))
                        {
                            producto1Stock += cantidadAgregar;
                            Console.WriteLine("Se han agregado " + cantidadAgregar + " unidades a producto 1.");
                        }
                        else if (productoAgregar.Equals("producto2", StringComparison.OrdinalIgnoreCase))
                        {
                            producto2Stock += cantidadAgregar;
                            Console.WriteLine("Se han agregado " + cantidadAgregar + " unidades a producto 2.");
                        }
                        else
                        {
                            Console.WriteLine("Producto no válido.");
                        }
                    }
                    catch (FormatException)
                    {
                        Console.WriteLine("Por favor, ingrese un número válido para la cantidad.");
                    }
                }
                else if (opcion == "3")
                {
                    // Eliminar stock
                    Console.Write("Ingrese el nombre del producto (producto1/producto2): ");
                    string productoEliminar = Console.ReadLine();
                    Console.Write("Ingrese la cantidad a eliminar: ");

                    try
                    {
                        int cantidadEliminar = int.Parse(Console.ReadLine());

                        if (productoEliminar.Equals("producto1", StringComparison.OrdinalIgnoreCase))
                        {
                            if (cantidadEliminar > producto1Stock)
                            {
                                Console.WriteLine("Error: No hay suficiente stock para eliminar.");
                            }
                            else
                            {
                                producto1Stock -= cantidadEliminar;
                                Console.WriteLine("Se han eliminado " + cantidadEliminar + " unidades de producto 1.");
                            }
                        }
                        else if (productoEliminar.Equals("producto2", StringComparison.OrdinalIgnoreCase))
                        {
                            if (cantidadEliminar > producto2Stock)
                            {
                                Console.WriteLine("Error: No hay suficiente stock para eliminar.");
                            }
                            else
                            {
                                producto2Stock -= cantidadEliminar;
                                Console.WriteLine("Se han eliminado " + cantidadEliminar + " unidades de producto 2.");
                            }
                        }
                        else
                        {
                            Console.WriteLine("Producto no válido.");
                        }
                    }
                    catch (FormatException)
                    {
                        Console.WriteLine("Por favor, ingrese un número válido para la cantidad.");
                    }
                }
                else if (opcion == "0")
                {
                    // Salir del programa
                    Console.WriteLine("Saliendo del programa...");
                    return;
                }
                else
                {
                    Console.WriteLine("Opción no válida. Intente nuevamente.");
                }

                Console.WriteLine(); // Espacio adicional para mejor legibilidad
            }
        }
    }
}
