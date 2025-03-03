using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CLase_2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Console.WriteLine("Hola \n Maurete");
            // probamos varias salidas de escape como el \n para nueva linea
            // Console.WriteLine(); Poner el metodo asi vacio deja un espacio en la impresion de pantalla
            //Console.WriteLine("como estas /r ");

            // Usamos argumentos entre "" comillas dobles y con las llaves le decimos la posicion
            // siempre empieza a contar de 0 a N -1 donde N es la cantidad total
            //Console.WriteLine("{0}, Feliz , dijo hola a {1}", "Mauro", "Pancho");

            //Console.WriteLine("4"); // ambos los lee igual , si bien uno es string y otro int pero ocupan DISTINTO ESPACIO EN MEMORIA
            //Console.Write(4);
            int x;
            x = 100;
            x = x + 1;
            Console.WriteLine($"El valor de x es {x}");
            Console.WriteLine($"Cualquier expresión ( 9 * 3 ) sirve");
            // TIPOS DE COMENTARIOS


// COMENTARIOS EN LINEA
/* Y FINALIZA CON */  /*Console.WriteLine ("toda accion esta comentada");*/
 //EL COMPILADOR IGNORA TODO LO Q ESTE DENTRO DE ESTOS DOS


Console.ReadKey();
}
}
}
