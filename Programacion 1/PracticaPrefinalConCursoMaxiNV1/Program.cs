using Microsoft.VisualBasic;
using System;
using System.Runtime.ConstrainedExecution;
using System.Security.Cryptography;

namespace PracticaPrefinalConCursoMaxiNV1
{
    internal class Program
    {
        static void Main(string[] args)
        {

            // Condicionales 




            /* 2.Hacer un programa para ingresar un número y luego se emita un cartel por pantalla “Positivo” si
                 el número es mayor a cero, “Negativo” si el número es menor a cero o “Cero” si el número 
                 es igual a cero.


            int N;

            Console.WriteLine("ingrese un nro");
            N = int.Parse(Console.ReadLine());

            if (N > 0)
            {
                Console.WriteLine("Positivo");
            }
            else if (N == 0)
            {
                Console.WriteLine("Cero");
            }
            else
            {
                Console.WriteLine("Negativo");
            } */




            //3.Una casa de video juegos otorga un descuento dependiendo del importe de la compra realizada según
            //los siguientes valores:

            //Si el importe es menor a ARS 1000, no hay descuento.
            //Si el importe es ARS 1000 o más pero menor a ARS 5000, aplica un descuento del 10 %.
            //Si el importe es ARS 5000 o más, aplica un descuento del 18 %.
            //Hacer un programa para ingresar un importe de venta y luego muestre por pantalla el importe final
            //con el descuento que corresponda.

            /*
           Double impVenta, impFinal ;  // usamos double para usar num con .

            Console.WriteLine("ingrese un importe para la venta");
            impVenta = Convert.ToDouble(Console.ReadLine());

            if (impVenta >= 5000)
            {
                impFinal = impVenta * 0.82;
            }
            else if (impVenta > 1000)
            {
                impFinal = (impVenta * 0.90);
            }

            else
            {
                impFinal = impVenta;

            }

            Console.WriteLine ("El importe final con el descuento que corresponde fue : " + impFinal);
            */


            //4.Hacer un programa para ingresar cuatro números distintos y luego mostrar por pantalla 
            // el menor de ellos.
            /*
                 int a, b, c, d, Menor;

                 // Pedir al usuario que ingrese los números
                 Console.WriteLine("Ingresa el primer número:");
                 a = int.Parse(Console.ReadLine());

                 Console.WriteLine("Ingresa el segundo número:");
                 b = int.Parse(Console.ReadLine());

                 Console.WriteLine("Ingresa el tercer número:");
                 c = int.Parse(Console.ReadLine());

                 Console.WriteLine("Ingresa el cuarto número:");
                 d = int.Parse(Console.ReadLine());

                 // Inicializar la variable Menor
                 Menor = a;

                 // Comparar los valores para encontrar el menor
                 if (b < Menor)
                 {
                     Menor = b;
                 }

                 if (c < Menor)
                 {
                     Menor = c;
                 }

                 if (d < Menor)
                 {
                     Menor = d;
                 }

                 // Mostrar el menor número
                 Console.WriteLine("El menor número ingresado fue: " + Menor);

                 */





            // Condicionales ++

            // 1.Hacer un programa que solicite el ingreso de dos números y luego calcular:

            //La resta si el primero es mayor que el segundo.
            //La suma si son iguales.
            //El producto si el primero es menor.
            //Se deberá emitir un cartel por pantalla con el resultado correspondiente.

            /*
            int A, B, R;

            Console.WriteLine("Ingrese un valor para el primer num");
            A = int.Parse(Console.ReadLine());

            Console.WriteLine("Ingrese un valor para el 2do num");
            B = int.Parse(Console.ReadLine());


            if (A > B)
            {
                R = A - B;
            }
            else if (A < B)
            {
                R = A * B;
            }
            else
            {
                R = B + A;
            }
            Console.WriteLine(R);



            */



            //   2.Un importante negocio de desinfectante líquido realiza descuentos dependiendo de la cantidad de
            //   litros vendidos según la siguiente escala:

            //Si vende menos de 100 litros, no hay descuento.
            //Si vende entre 101 y 300 litros, el descuento es del 10 %.
            //Si vende entre 301 y 500 litros, el descuento es del 15 %.
            //Finalmente, si la venta es de más de 500 litros, el descuento es del 25 %.
            //  Hacer un programa que solicite el ingreso del importe total de la venta y la cantidad de litros
            //  vendidos y calcule y emita el importe con el descuento  aplicado..

            /*
            double litrosVendidos, ImporteTotal, ImporteConDesc;


            Console.WriteLine("Ingrese el importe Total de la venta");
            ImporteTotal = double.Parse(Console.ReadLine());

            Console.WriteLine("Ingrese la cantidad de Litros vendidos ");
            litrosVendidos = double.Parse(Console.ReadLine());

            if (litrosVendidos > 500)
            {
                ImporteConDesc = ImporteTotal * 0.75;
            }

            else if (litrosVendidos > 300)
            {
                ImporteConDesc = (ImporteTotal * 0.85);

            }
            else if (litrosVendidos > 100)
            {
                ImporteConDesc = (ImporteTotal * 0.90);
            }

            else {
                ImporteConDesc = ImporteTotal;

                Console.WriteLine("El importe final con desc debido a su compra fue : " + ImporteConDesc);


            */



            // EXPLICACION DE SWITCH (  tmb se puede hacer de 2 maneras dif con IF...


            // 3.Una importante marca de computadoras permite elegir cierta configuración del equipo a comprar.
            //  Para ello existe la siguiente escala de precios:

            //           i5(1)       i7(2)      i9(3)
            //8 RAM(1)   USD 800   USD 900   USD 1200
            //16 RAM(2)  USD 900   USD 1000  USD 1400
            //32 RAM(3)  USD 1000  USD 1400  USD 2000

            //     Además, el equipo viene con un disco que permite almacenar 500 GB de información y que se puede 
            //     ampliar a 1 TB si así lo desea, lo cual tiene un costo adicional de USD 300.Hacer un programa
            //     que solicite la opción de procesador, la opción de memoria RAM, y si extiende el disco o no
            //     (ingresa 1 para extender ,o  cero  para no extender) y calcule y emita por pantalla el monto de 
            //     la máquina seleccionada.

            // vAMOS A USAR UN SWITCH dentro de otro  , uno para el procesador y uno para CADA opc de memoria
            // osea 4 switch, pero tmb podemos hacerlo con varios if. que es mas manejable..
            /*
                        int OpcProcesador, OpcMemoria, OpcDisco;
                        float Precio = 0; // clave darle 1 valor inicial

                        Console.WriteLine("Ingrese la opciom de procesador");
                        OpcProcesador = int.Parse(Console.ReadLine());

                        Console.WriteLine("Ingrese la opc de Memoria RAM");
                        OpcMemoria = int.Parse(Console.ReadLine());

                        Console.WriteLine("Amplia Disco? ");//1 para si y 0 para no
                        OpcDisco = int.Parse(Console.ReadLine());





                        // el ejemplo intentaba mostrarnos como hacerlo con SWITCH dentro de otro SWItch



                        switch (OpcProcesador)
                        {
                            case 1: // si el procesador es 1..entonces

                                switch (OpcMemoria)
                                {


                                    case 1:
                                        Precio = 800;
                                        break;

                                    case 2:
                                        Precio = 900;
                                        break;

                                    case 3:
                                        Precio = 1000;
                                        break;
                                }
                                break;

                            case 2:

                                switch (OpcMemoria)
                                {


                                    case 1:
                                        Precio = 900;
                                        break;

                                    case 2:
                                        Precio = 1000;
                                        break;

                                    case 3:
                                        Precio = 1400;
                                        break;
                                }
                                break;

                            case 3: // o default
                                switch (OpcMemoria)
                                {


                                    case 1:
                                        Precio = 1200;
                                        break;

                                    case 2:
                                        Precio = 1400;
                                        break;

                                    case 3:
                                        Precio = 2000;
                                        break;
                                }
                                break;

                        }

                        //hasta aca ya tengo el precio... ahora veo si amplio disco

                        if (OpcDisco == 1)
                        {
                            Precio = Precio + 300;
                        }

                        Console.WriteLine("El precio final de la compu es :" + Precio);  



                        // De esta forma lo hacemos con SWITCH + IF

                        //if (OpcProcesador == 1) {

                        //    switch (OpcMemoria)
                        //    {

                        //        case 1:
                        //            Precio = 800;
                        //            break;

                        //        case 2:
                        //            Precio = 900;
                        //            break;

                        //        case 3:
                        //            Precio = 1000;
                        //            break;

                        //    }
                        //}

                        //if (OpcProcesador == 2) {

                        //    switch (OpcMemoria)
                        //    {
                        //        case 1:
                        //            Precio = 900;
                        //            break;

                        //        case 2:
                        //            Precio = 1000;
                        //            break;


                        //        default:
                        //            Precio = 1400;
                        //            break;
                        //    }
                        //}


                        //if (OpcProcesador == 3){
                        //    switch (OpcMemoria)
                        //    {
                        //        case 1:
                        //            Precio = 1200;
                        //            break;
                        //        case 2:
                        //            Precio = 1400;
                        //            break;
                        //        default:
                        //            Precio = 2000;
                        //            break;
                        //    }
                        //}



                            */






            // CON IF podemos hacer

            //if (OpcProcesador == 1 && OpcMemoria == 1)

            //    Precio = 800;

            //else if (OpcProcesador == 1 && OpcMemoria == 2)
            //    Precio = 900;


            //else if (OpcProcesador == 1 && OpcMemoria == 3)
            //    Precio = 1000;

            //else if (OpcProcesador == 2 && OpcMemoria == 1)
            //    Precio = 900;
            //// y asi puedo seguir hasta el ultimo con varios else if y para finalizar if
            // hicimos todo con IF con Uniones logicas (and) &&



            ////OTRA MANERA DE HACERLO CON DOBLE IF  // MAS PROLIJO

            //if (OpcProcesador == 1)
            //{
            //    if (OpcMemoria == 1)
            //    {
            //        Precio = 800;

            //    }
            //    else if (OpcMemoria == 2)
            //        Precio = 900;

            //    else  
            //         Precio = 1000;

            //    // y asi con procesador 2 y  3...










            //}

















            //int OpcionProcesador, OpcionMemoria, OpcionDisco, precio;


            //switch (OpcionProcesador)
            //{
            //    case 1: 
            //        switch(OpcionMemoria) {
            //            case 1:
            //                precio = 800;
            //                break;
            //                case 2:
            //                precio = 


            //}


            //4. Hacer un programa para ingresar tres números y emitir un cartel aclaratorio si la suma de
            //    los dos primeros es mayor al producto del segundo con el tercero.

            /*
                     int a, b, c;

                     Console.WriteLine("ingrese un num");
                     a = int.Parse(Console.ReadLine());

                     Console.WriteLine("ingrese otro num");
                     b = int.Parse(Console.ReadLine());

                     Console.WriteLine("ingrese otro num");
                     c = int.Parse(Console.ReadLine());



                     if ((a + b) > (b * c))
                     {
                         Console.WriteLine("La suma del primer y segundo num es > al producto del 2do y 3er num, si o si tengo que ingresar 1 en el tercer num para que pase esto");

                     }
                 */




            //5.Hacer un programa para ingresar 4 números.Luego analizar e informar por 
            // pantalla si los mismos se encuentran ordenados de forma decreciente.

            /*
            int a,b, c ,d;

            Console.WriteLine("Ingrese un valor");
            a = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("Ingrese un valor");
            b = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("Ingrese un valor");
            c = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("Ingrese un valor");
            d = Convert.ToInt32(Console.ReadLine());

            if (a > b && b > c && c > d)
            {
                Console.WriteLine("Estan ordenados de forma decreciente");
            */

            }
        }
    }
}

