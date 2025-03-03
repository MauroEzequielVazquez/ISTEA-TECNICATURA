using System.ComponentModel.Design;

namespace Clase4
{
    internal class Program
    {
        static void Main(string[] args)



        {
            //Crear un programa en C# por consola que calcule la superficie y el volumen de una esfera,
            //dado su radio por teclado. Mostrar los resultados por pantalla.


            //double Radio, Volumen, Superficie;
            //const double Pi = 3.141592653589793; // para ser mas preciso 

            ////Radio = 9 - 3;


            //Console.WriteLine("Ingrese un valor para el radio");
            //Radio = double.Parse(Console.ReadLine());

            //Volumen = (4.0 / 3.0) * Pi * (Radio * Radio * Radio);
            //// otra forma mas pro es haciendo   volumen = (4.0 / 3.0) * Pi * Math.Pow(radio, 3); con Math.Pow para calcular la potencia espeficifa.

            //Superficie = (4 * Pi) * (Radio * Radio);
            //// de forma mas pro  es haciendo superficie = 4 * Pi * Math.Pow(radio, 2);


            //Console.WriteLine("El volumen de la esfera es " + Volumen + " y su superficie total es: " + Superficie);


            //Calcular el área de un cuadrado, pasamos el lado por declaro
            //area de cuadrado = lado * lado...


            //2

            //    float lado, area;
            //Console.WriteLine("Ingrese un lado para el cuadrado");
            //lado = float.Parse(Console.ReadLine());


            //area = lado* lado;

            //Console.WriteLine("El area del cuadrado es: " + area);

            //3 Calcular Area de un triangulo

            // Se calcula con base x altura /2 

            //Double baseT, alturaT, areaT;

            //Console.WriteLine("Ingrese una base");
            //baseT = Double.Parse(Console.ReadLine());

            //Console.WriteLine("Ingrese un valor para la altura");
            //alturaT = Double.Parse(Console.ReadLine());

            //areaT = (baseT * alturaT) / 2;

            //Console.WriteLine("El area del Triangulo es: " + areaT);


            // Realizar una calculadora Basica(Tiene que tener + , - , / , * , %)

            int x, y, suma, resta, division, multiplicacion, resto;

            Console.WriteLine("Ingrese un valor para x:");
            x = int.Parse(Console.ReadLine());

            Console.WriteLine("Ingrese un valor para y:");
            y = int.Parse(Console.ReadLine());

            suma = x + y;
            resta = x - y;
            multiplicacion = x * y;
            resto = x % y;
            division = x / y;


            // De esta forma se interpola el texto con variables  y se realiza directamente la cuenta
            //sin necesidad de crear una var para cada result

            Console.WriteLine("{0} + {1} = {2} ", x, y, x + y);
            Console.WriteLine("{0} - {1} = {2} ", x, y, x - y);
            Console.WriteLine("{0} * {1} = {2} ", x, y, x * y);
            Console.WriteLine("{0} / {1} = {2} ", x, y, x / y);
            Console.WriteLine("{0} % {1} = {2} ", x, y, x % y);



            //  Creamos variables para guardar los resultados 
            // e ir concatenando el mensaje para cada calculo matematico
            Console.WriteLine("La suma de x e y es: " + suma);
            Console.WriteLine("La resta de x menos y es: " + resta);
            Console.WriteLine("La multiplicación de x por y es: " + multiplicacion);
            Console.WriteLine("La división de x entre y es: " + division);
            Console.WriteLine("El resto de x entre y es: " + resto);

            //Ejemplo de condicional If
            // lo que va dentro de () es el argumento logico, es lo que se va a evaluar y se cumple o no T O F;





            //if (3 > 4)
            //{
            //    Console.WriteLine("Es mayor");
            //}
            //else if (3 < 4)
            //{
            //    Console.WriteLine("Es menor");
            //}
            //else if (3 == 4)
            //{
            //    Console.WriteLine("Son iguales");
            //}

        }

        }

    }






