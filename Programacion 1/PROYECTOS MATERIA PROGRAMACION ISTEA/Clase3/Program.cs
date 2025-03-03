//namespace clase3
//{
//    internal class program
//    {
//        static void main(string[] args)
//        {
//            // el bool nos dice v o f no puse para guardar en variable ni nada
//            console.writeline(10 < 90);

//            console.writeline(10 * 12);
//            console.writeline(1.25f * 0.5f);// f es de float, para que te de deciman
//            console.writeline(100 - 200);
//            console.writeline(1.0 - 1.0);

//            //console.writeline(9 / 2f);  // para que divida y diga 4,5 tengo q ponerle al 2 una f sino te da 4
//            console.writeline(1.0f / 2.0f);

//            console.writeline("fin del programa!");
//   Console.WriteLine(14 % 4); // da 2
//DECLARANDO Y ASIGNANDO VARIABLES

//Declaro
//int resultado;
//float valorConComa;
////Asigno
//resultado = 100 + 200;
//valorConComa = 0.5f + 10f;
////muestro el valor x pantalla
//Console.WriteLine("El resultado es: " + resultado);
//Console.WriteLine("El resultado con numeros float o F es:" + valorConComa);

//Console.ReadKey();


//las variables pueden ir cambiando su valor, ya que a la variable x se le sumo 100 y modifico su valor


//int x;

//x = 100;
//x = x + 1;

//Console.WriteLine("El valor de x es: "+ x);

//desde C# 6.0 se permite crear una string mezclandola con variables, es decir, string INTERPOLADAS
//pegar textos con variables, concatenarlos digamos... es mas facil hacer + ...y la variable en vez de poner entre {}
//int x;

//x = 100;
//x = x + 1;

//Console.WriteLine($"El valor de x es {x}");
//Console.WriteLine($"Cualquier expresión {9 * 3} sirve");
//esta variable almacenará la cantidad de ovejas           
//t cantOvejas = 0;
///*
// Agrego una 
// oveja al rebaño
//*/
//cantOvejas = cantOvejas + 1;
//cantOvejas += 1;  // ES COMO DECIR CantObejas  = cantiovejas +1  SE ABREVIA
//Console.WriteLine(cantOvejas);  

// PROBAMOS EL METODO READLINE para ver como toma textos por teclado

//string nombre;

//Console.WriteLine("Decime tu nombre");
//nombre = Console.ReadLine();
/*Console.WriteLine($"Mucho gusto {nombre} yo soy tu PC"*);// INTERPOLA, NO CONCATENA
// SI A LA variable nombre le pones maurito te dice mucho gusto maurito yo soy tu pC
int resultado;
int algoInt;

Console.WriteLine("Decime un numero entero:");
algoInt = int.Parse(Console.ReadLine());
resultado = algoInt * 10;
Console.WriteLine($"El resultado es {resultado}");

Console.ReadKey();
//        }
//    }
//} 
