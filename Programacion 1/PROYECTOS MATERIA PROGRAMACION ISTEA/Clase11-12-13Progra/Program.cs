namespace Clase11_12_13Progra
{
    internal class Program
    {
        static void Main(string[] args)
        {

            //Clase 14 de Sep,, post parcial

            

            //18. ¿Cuál es la salida del siguiente código en C#?
            /*las respuestas del examen presentaban un error, vamos a ver que es lo que devuelve realmente
             "P*o-r*m-c-ó"
            "P*o*ramación"
            "P*r-gramcón"
            "P*o*r*m*c*ó"

            respuesta correcta: P*o-r*m*c-ó*
             */
            /*string mensaje = "Programación";

            int longitud = mensaje.Length; //12

            int contador = 0;

            string resultado = "";

            for (int i = 0; i < longitud; i++) //i hasta el 11

            {

                if (i % 2 == 0) // 0/2 = 0 el resto de la division es cero

                {

                    resultado += mensaje[i]; //mensaje[0] = P
                    //P
                }

                else if (i % 3 == 0) //3/3 = 1 1 es el cocienten y el resto es cero

                {

                    resultado += "-";

                }

                else

                {

                    resultado += "*";

                }

                contador++;

            }

            Console.WriteLine(resultado);
            */
            //cual es el valor de contador
            /*
             3
            4
            5X correcta
            6
             */
            //ejercicio 17
            int valor = 15;
            /*int contador = 0;

            while (valor > 0)

            {
                switch (valor % 3) //15 / 3 = q=5 resto= 0
                //switch(0)
                //10 % 3 != 0    10/3 = 9 resto= 1
                //switch (1)
                {

                    case 0:

                        valor -= 5; //15 -5 => valor = 10

                        break;

                    case 1:

                        valor -= 2; //valor = 8

                        break;

                    case 2:

                        valor -= 3;

                        break;

                }

                contador++;

            }

            Console.WriteLine(contador);
            */

            //arrays
            //los arrays contienen elementos EN ORDEN

            //declaracion
            //int[] numeros; //estamos DECLARANDO una variable de tipo array de enteros

            //declarando y asignando
            int[] numeros = new int[5]; //y determinando cuantos elementos va a tener el array

            //declarando una variable de tipo array de string (caracteres)
            string[] unArrayDeStrings;

            //los elementos de un array comienzan desde la posicion cero
            //como hago para cargar un array? a mano
            //con el [] se accede al elemento
            //dentro del corchete se coloca el indice o index
            numeros[0] = 1; //el 1 es escalar es un entero
            numeros[1] = 2;
            numeros[2] = 3;
            numeros[3] = 4;
            numeros[4] = 5;

            //Console.WriteLine("En la posicion 3 del array esta el: " + numeros[3]);

            //tengo 5 elementos
            //tengo posiciones de la 0 .... a la 4
            //que longitud tiene? 5 (cuantos elementos tiene)

            //sumar elementos de un array
            /*int total = 0; //acumulador
            
            for (int i = 0; i < numeros.Length; i++) //longitud es 5 ... i <=  numeros.Length - 1 ...  i=0,1,2,3,4
            {
                total += numeros[i]; //total = total + numeros[i];
            }

            Console.WriteLine("El total acumulado es: " + total);

            */

            //declarando, asignando, y determinando los elementos que va a contener el array
            int[] numeros2 = new int[5] { 101, 102, 103, 104, 105 };

            //se puede declarar y determinar la cantidad y los elementos que va a contener el array
            //int[] numeros2 = { 101, 102, 103, 104, 105 };

            //estamos recorriendo el array y mostrando sus elementos
            /*for (int i = 0; i < numeros2.Length; i++)
            {
                Console.WriteLine(numeros2[i]);
            }*/
            //Console.WriteLine("****empieza el foreach****");
            //foreach es una estructura para recorrer arrays o arreglos, vectores, colecciones
            //el foreach recorre cada uno de los elmentos del array
            //hasta donde? ya sabe hasta donde recorrer, porque toma solo los elementos del array

            /*foreach (int elemento in numeros2)
            {
                Console.WriteLine(elemento);
            }*/

            //intercambiar elementos de un array
            //COMO INVERTIR LOS ELEMENTOS DE UN ARRAY?

            /*int[] numeros3 = new int[5] { 1, 2, 3, 4, 5 };

             for (int i = 0; i < 2; i++) //I va desde cero hasta 1
             {
                 int aux = numeros3[i];
                 numeros3[i] = numeros3[4 - i];
                 numeros3[4 - i] = aux;
             }
             //join concatena los elementos de un array con una , y lo transforma en un string para mostrarlo
             //con el writeline
             Console.WriteLine(string.Join(',', numeros3));
             */

            //OTRA FORMA DE INVERTIR UN ARRAY ES USANDO Array.Reverse(parametro_array)
            //es un metodo estatico de la clase array, al ser estatico se puede utilizar sin necesidad
            //de declarar un objeto de la clase Array, simplemente lo uso.

            /*int[] numeros4 = new int[8] { 10, 22, 2, 4, 50, 11 ,12,123 };
            
            Array.Reverse(numeros4); // es void, no devuelve nada
            
            //Console.WriteLine(string.Join(',', numeros4));
            Console.WriteLine(string.Join('-', numeros4));
            Console.WriteLine(string.Join('/', numeros4));*/

            //Console.WriteLine(numeros4); de esta forma me devuelve el tipo de dato

            //string.Join() este es un metodo estatico de clase string y lo puedo usar sin instanciar un objeto.
            //concatena los elmentos de un array con un char pasado como parametro, y retorna un string

            //DE QUE FORMAS VEO LOS ELEMENTOS DE UN ARRAY
            //FOR, FOREACH O CON JOIN

            //metodo de ordenamiento de un array "burbujeo"

            int[] arr = new int[5] { 8, 10, 6, 2, 4 };

            bool huboIntercambio;

            do
            {
                huboIntercambio = false;

                for (int i = 0; i < arr.Length - 1; i++) // Va de 0 a arr.Length - 1
                {
                    if (arr[i] > arr[i + 1])
                    {
                        int aux = arr[i];
                        arr[i] = arr[i + 1];
                        arr[i + 1] = aux;

                        huboIntercambio = true;
                        Console.WriteLine($"Intercambiados {arr[i + 1]} y {arr[i]}");
                    }
                }

                Console.WriteLine("Estado del arreglo después de una pasada: " + string.Join(',', arr));

            } while (huboIntercambio); //Repite si hubo intercambios en la pasada anterior


            Console.WriteLine("Arreglo ordenado: " + string.Join(',', arr));
            Console.ReadLine();








            // Clase 21 de Octubre.. .Vectores y métodos

            //Sort es un metodo estatico de la clase Array
            //sirve para ordenarlo
            /*int[] arr;
            int cantValores = 0;

            Console.Write("Cuantos valores va a cargar?");
            cantValores = int.Parse(Console.ReadLine());

            arr= new int[cantValores];

            Console.WriteLine("Cargue los valores:");
            for (int i = 0; i < arr.Length; i++) //i <= arr.Length -1
            {
                Console.Write($"Indique el valor para el index {i}: ");
                arr[i]= int.Parse(Console.ReadLine());
            }
            
            Array.Sort(arr);
            Console.WriteLine(string.Join(',', arr)); //toma un char y un array y concatena 
            //los valores del array con ,
            
            */

            //BUSQUEDA SECUENCIAL DENTRO DE UN ARRAY
            /*
            int indexEncontrado = -1;
            string valorBuscado = "Maria";

            string[] arr = { "Juan", "Pedro", "Maria", "Roberto", "Maria", "Adrian" };// va de 0 a i=5

            for (int i = 0; i < arr.Length; i++)
            {
                if (arr[i] == valorBuscado)
                {
                    indexEncontrado = i;
                    break;
                }
            }
            if (indexEncontrado > -1)
            {
                Console.WriteLine($"Encontre {valorBuscado} en el indice {indexEncontrado}");
            }
            else
            {
                Console.WriteLine($"El array no contiene {valorBuscado}");
            }*/

            //Array. parametros, array donde buscar, y valor buscado
            //devuelve el indice o index o -1 si no se encontró el elemento

            /*int indexEncontrado = -1;
            string valorBuscado = "Maria";

            string[] arr = new string[] { "Juan", "Pedro", "Jose", "Roberto", "Mirta", "Adrian" };

            indexEncontrado = Array.IndexOf(arr, valorBuscado);

            if (indexEncontrado > -1)
            {
                Console.WriteLine($"Encontre {valorBuscado} en el indice {indexEncontrado}");
            }
            else
            {
                Console.WriteLine($"El array no contiene {valorBuscado}");
            }
            */

            //COPIAR ARRAYS
            //UTILIZAR Array.Copy
            // No asignar string[] otroArr = arr; //ESTO NO ES UNA COPIA
            //FORMA CORRECTA
            /*string[] arr = new string[2] { "hola", "chau" }; //origen
            string[] otroArr = new string[2];*///destino

            //Array.Copy(arr, otroArr, otroArr.Length); // (arr, otroArr,2)

            /*foreach (var item in otroArr)
            {
                Console.WriteLine(item); //hola ... chau
            }*/

            //otroArr[1] = "adios"; //Esto cambia el segundo elemento otroArr únicamente

            /*foreach (var item in otroArr)
            {
                Console.WriteLine(item); //hola ... adios
            }

            */

            //copiar mal arrays
            //NO HACERLO!!!! FORMA INCORRECTA
            //otroArr = arr; //otroArr seria un alias, es el mismo array, los dos ocupan la misma posicion de memoria

            /*foreach (var item in otroArr)
            {
                Console.WriteLine(item); //hola... chau
            }*/

            /*otroArr[1] = "adios";

            foreach (var item in otroArr)
            {
                Console.WriteLine(item); //hola... adios
            }

            foreach (var item in arr)
            {
                Console.WriteLine(item); //hola... adios
            }*/

            //Array.Copy
            //es un metodo sobrecargado, que significa que el metodo tiene multiples versiones
            //para diferentes cantidades de parametros que se le pase
            //dependiendo de la cantidad de parametros que se le pase, el compilador elige de que forma sobrecargar
            //el metodo, dependiendo de lo que se desee utilizar

            /*string[] arr = new string[3] { "no", "hay", "problema" };
            string[] otroArr = new string[4] { "alf", "kate", "brian", "lynn" };

            //array origen, indice origen, array destino, indice destino, cantidad de elementos a copiar
            Array.Copy(arr, 0, otroArr, 1, arr.Length); //length 3 

            foreach (var item in otroArr)
            {
                Console.WriteLine(item);
            }*/

            //Ejemplos Arrays
            /*2 - Escriba una aplicación que dado un array de strings, mostrará en consola todos los 
             elementos del array junto con su índice en orden
             inverso.Por ejemplo:
             Array: { "a", "b", "c"}
            Muestra:
             Elemento 2 tiene c
             Elemento 1 tiene b
             Elemento 0 tiene a
             */

            /*string[] arr = { "a", "b", "c" }; //longitud 3... i = 2 hasta la 0

            for (int i = arr.Length-1; i >=0; i--)
            {
                //Console.WriteLine($"Elemento {i} tiene {arr[i]}");
                Console.WriteLine("Elemento " + i + " tiene " + arr[i]);
            }
            */

            /*6 - Escriba una aplicación que, dado un array de números, indicará “Todos pares” en 
            consola si todos los elementos del array son números
            pares, de lo contrario, “Hay impares”.*/

            /*bool todosPares = true;
            int[] numeros = { 2, 4, 6, 3, 10 };

            foreach (int numero in numeros)
            {
                if (numero % 2 != 0)
                {
                    todosPares = false;
                    break;
                }
            }

            if (todosPares)
            {
                Console.WriteLine("Todos son pares!");
            }
            else
            {
                Console.WriteLine("hay pares!");
            }
            */

            /*Crear una aplicación que dados dos arrays indiquen “Estan todos”
            por consola, si todos los elementos del primer array se encuentran en
            alguna parte cualquiera del segundo. De lo contrario, “Falta X” donde "x"
            es el elemento presente en el primer array pero no en el segundo.*/

            /*int[] primerArray = { 1, 2, 3};

            int [] segundoArray = {5,4,3,2,1};
            bool todosPresentes = true;

            foreach (int elemento in primerArray)
            {
                if (Array.IndexOf(segundoArray,elemento) == -1)
                {
                    Console.WriteLine("Falta el elemento: " + elemento);
                    todosPresentes = false;
                }
            }

            /*fin de recorrer el array muestro los rsultados*/
            /*if (todosPresentes)
            {
                Console.WriteLine("estan todos los elementos!");
            }
            */

            /*2 - El usuario debe introducir un número correspondiente a cierto mes(un valor entre 1 y 12)
           y la aplicación debe mostrar el nombre del mes correspondiente a dicho número.*/

            string[] meses = { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" }; //longitud 12
            //para acceder a un elemento del array a lo que ingrese el usuario hay que restarle 1

            Console.WriteLine("Ingrese un valor de mes entre 1 y 12");

            int numMes = Convert.ToInt32(Console.ReadLine());

            if (numMes < 1 || numMes > 12) //mes tiene que estar entre 1 y 12
            {
                Console.WriteLine("El numero ingresado es inválido!");
            }
            else
            {
                string mes = meses[numMes - 1];
                Console.WriteLine("El mes ingresado es: " + mes);

            }










            //Clase 28 de Octubre, repasamos tipos de variables y funciones

            //variable "global" puede ser accedida desde cualquier parte del programa
            //variable de clase
            static int UnaVariableStatic = 10;

            //declarando a la funcion o definicion de la funcion
            static void Saludar(string param)
            {
                Console.WriteLine("Hola soy una funcion y me invocaron!" + param);
            }

            static string FuncionConRetorno()
            {
                Console.WriteLine("Estoy en una función con retorno");
                return "Hola mundo";
            }
            static void Hola()
            {
                //z es local (propia) de la funcion hola y no interfiere ni es la misma z que esta en el main
                int z = 0;
                for (int i = 0; i < 2; i++)
                {
                    Console.WriteLine($"Saludos forastero, en Hola() z vale: {z}");
                    z++;
                }
            }

            static void Hola2()
            {
                Console.WriteLine($"En hola(): {UnaVariableStatic}");
                UnaVariableStatic += 15;
            }
            static void Main(string[] args)
            {
                //llamando a la funcion o invocando
                /*Saludar("hola");
                string resultado = FuncionConRetorno();

                Console.WriteLine("Este es el resultado de la funcion FuncionConRetorno: " + resultado);

                Console.WriteLine("Estoy dentro del Main (programa principal)");
                //implicitamente cuando la funcion termina hay un return*/


                //variables locales

                //Console.WriteLine("Invocando Hola()");

                //z es una variable local del Main (del programa principal)
                /*int z = 10;
                for (int i = 0; i < 3; i++)
                {
                    Hola();
                    z+= 10;
                    Console.WriteLine($"Hola desde Main(), z vale {z}");
                }*/

                //variables de clase o "globales"
                //UnaVariableStatic es una variable de clase o global, que puede ser accedida de diferentes partes
                //del programa incluso modificarla
                /*Console.WriteLine($"En Main() antes de Hola(): {UnaVariableStatic}");
                Hola2();
                Console.WriteLine($"En Main(): {UnaVariableStatic}");*/


                //EJEMPLO CALCULO SIN USAR FUNCIONES DEFINIDAS POR NOSOTROS

                /*double catetoA;
                double catetoB;
                double hipotenusa;
                double cACuadrado;
                double cBCuadrado;

                Console.Write("Largo del primer cateto: ");
                catetoA = double.Parse(Console.ReadLine());
                cACuadrado = catetoA * catetoA;

                Console.Write("Largo del segundo cateto: ");
                catetoB = double.Parse(Console.ReadLine());
                cBCuadrado = catetoB * catetoB;

                hipotenusa = Math.Sqrt(cACuadrado + cBCuadrado);

                Console.WriteLine($"El largo de la hipotenusa es {hipotenusa}");*/

                //EJEMPLO DE CALCLULO CON FUNCIONES DEFINIDAS POR NOSOTROS

                /*
                double catetoA;
                double catetoB;
                double hipotenusa;
                double cACuadrado;
                double cBCuadrado;

                Console.Write("Largo del primer cateto: ");
                catetoA = double.Parse(Console.ReadLine());
                cACuadrado = CalcularCuadrado(catetoA);

                Console.Write("Largo del segundo cateto: ");
                catetoB = double.Parse(Console.ReadLine());
                cBCuadrado = CalcularCuadrado(catetoB);

                hipotenusa = Math.Sqrt(cACuadrado + cBCuadrado);

                Console.WriteLine($"El largo de la hipotenusa es {hipotenusa}");


                static double CalcularCuadrado(double param)
                {
                    return param * param;
                }

                */

                //EJEMPLOS PRACTICOS
                /*1 - Escriba una función que reciba como parámetro dos números long que llamaremos "a" y "b".La función debe retornar la sumatoria de todos
                los números que se encuentren entre "a" y "b" incluidos los extremos.*/

                /*static long SumarEntre(long a, long b) //a=10  b=5
                {
                    if (a > b) //invierto el orden para que sea mas facil ir viendo los del medio
                    {
                        long temporal = a;
                        a = b;
                        b = temporal;
                    }
                    //a=5 y b =10
                    long suma = 0; //acumulador

                    for (long i = a; i <= b; i++)
                    {
                        suma = i; //suma +=i;
                    }

                    return suma;

                }

                //en el main
                long a = 5;
                long b = 10;

                long resultado =SumarEntre(a, b);
                Console.WriteLine("La suma entre: " + a + " y " + b + " Es: " + resultado);
                Console.WriteLine($"la suma entre {a} y  {b} es: {resultado} ");
                */

                //3- Escriba una función de nombre EsPar que reciba como parámetro un número int, la
                //función debe retornar true si el parámetro recibido es par
                //o de lo contrario false.

                static bool Espar(int numero)
                {
                    bool retorno;
                    retorno = (numero % 2 == 0); //boolano es true si el resto de dividir a numero por 2 es cero.
                    return retorno;

                    //return (numero % 2 == 0);
                }

                int valor = 20;
                bool resultado = Espar(valor);

                if (resultado)
                {
                    Console.WriteLine("Es par");
                }
                else
                {
                    Console.WriteLine("No es par");
                }
                










                // Clase 11 de Noviembre, vimos algo de Poo


                //DECLARAMOS UN RECORD
                record Estudiante
    {
        public string Nombre { get; set; }
        public short Edad { get; set; }
        public float HorasCursadas { get; set; }
    }

    record Fecha
    {
        public int Dia { get; set; }
        public int Mes { get; set; }
        public int Anio { get; set; } //Evitamos usar la ñ
    }



    record Alumno
    {
        public string Nombre { get; set; }
        public short Edad { get; set; } = 18; //por default los alumnos van a tener 18 años
        public float HorasCursadas { get; set; }
        public Fecha UltimoIngreso { get; set; } = new Fecha(); //puedo instanciarlo ya directamente
        //y despues ya lo uso directamente
    }

    record Mascota
    {
        public string Nombre { get; set; }
        public short Edad { get; set; }
        public string Raza { get; set; }
        public DiasPaseo dia { get; set; }

    }

    record DiasPaseo
    {
        public string diaSemana { get; set; }

    }


    internal class Program
    {

        static void Main(string[] args)
        {
            //variables por valor o por referencia
            //le pasamos una copia a la funcion de la variable
            //es decir la pasamos por VALOR

            /*static void CambiarValor(int x)
            {
                Console.WriteLine($"En CambiarValor x vale {x} al ingresar a la función");
                x= 500;
                Console.WriteLine($"En CambiarValor x vale {x} luego de la asignación");
            }
           
            int y = 100;
            Console.WriteLine($"En Main j vale {y} antes de la invocación");
            CambiarValor(y);
            Console.WriteLine($"En Main j vale {y} luego de la invocación");
            */
            //conslusion: Al pasarle el parametro por valor, se le esta pasando una copia
            //no se modifica el contenido de la variable

            //Por referencia
            /*static void CambiarRefType(long[] x)
            {
                Console.WriteLine($"En CambiarRefType x[1] vale {x[1]} al ingresar a la función");
                x[1]= 500;
                Console.WriteLine($"En CambiarRefType x[1] vale {x[1]} luego de la asignación");
            }

            long[] j = new long[5] { 45, 46, 47, 48, 49 };

            Console.WriteLine($"En Main j[1] vale {j[1]} antes de la invocación");
            CambiarRefType(j);
            Console.WriteLine($"En Main j[1] vale {j[1]} luego de la invocación");
            */


            //como un array es un tipo de dato por referencia.
            //al cambiarle el valor de uno de los valores del array, luego de la funcion
            //efectivamente se cambia el valor. Esto es porque se esta pasando por referencia.

            //OTRO EJEMPLO
            //que pasa si quiero pasarle un entero a la funcion y sí quiero que me modifique
            //el valor luego del cambio dentro de la funcion y despues (que cambie realmente el valor)

            /*static void ModificarReferencia(ref int valor)
            {
                valor = 20;
                Console.WriteLine("Dentro del metodo valor vale: " + valor);
            }
            
            int numero = 10;
            Console.WriteLine("Antes de llamar a la funcion: " + numero);

            ModificarReferencia(ref numero);

            Console.WriteLine("Despues de de llamar a la funcion: " + numero);

            //Al indicarle que el parametro se pasa por referencia 
            //me modifica verdaderamente el valor de la variable despues de la funcion
            */

            //RECORDS - TIPOS DEFINIDOS POR EL USUARIO

            //declaracion
            /*Estudiante primerAlumno; //esta es una variable de tipo Estudiante

            //instanciando un objeto de tipo estudiante para poder utilizarlo
            primerAlumno = new Estudiante();


            //instanciando un "objeto" de tipo Estudiante 
            Estudiante varA = new Estudiante();
            
            Estudiante varB;

            varA.Nombre = "Leia Organa"; //asignacion
            varA.Edad = 25;
            varA.HorasCursadas = 15.5f;

            Console.WriteLine($"varA contiene {varA}");

            Console.WriteLine($"Asignando varA a varB");

            varB = varA;//se esta copiando la direccion de memoria de A a B

            //los record son tipos de datos por referencia
            //entonces si modifico el valor de una propiedad de uno, me va a cambiar en el otro.
            Console.WriteLine($"varA contiene {varA}");
            Console.WriteLine($"varB contiene {varB}");


            Console.WriteLine($"Modificando varB.Nombre");
            varB.Nombre = "Juana";

            Console.WriteLine($"varA contiene {varA}");
            Console.WriteLine($"varB contiene {varB}");
            */
            //si se quiere que se copie una propiedad solamente y no toda la estructura de un record
            //a otro habria que hacerlo de esta forma, copiar propiedad por propiedad
            //copiar propiedad por propiedad

            //instanciamos los objetos
            /*Estudiante varA = new Estudiante();
            Estudiante varB = new Estudiante(); 

            //definiendo las propiedades de varA
            varA.Nombre = "Leia Organa";
            varA.Edad = 25;
            varA.HorasCursadas = 15.5f;

            //Copiando las propiedes una a una de varA a varB
            varB.Nombre = varA.Nombre;
            varB.Edad = varA.Edad;
            varB.HorasCursadas = varA.HorasCursadas;

            //vemos que tienen
            Console.WriteLine($"varA contiene {varA}");
            Console.WriteLine($"varB contiene {varB}");

            Console.WriteLine("Modificando varB");

            varB.Nombre = "Pedro";

            Console.WriteLine($"varA contiene {varA}");
            Console.WriteLine($"varB contiene {varB}");


            */
            /*
             //comentario
             Estudiante[] lista_estudiantes;  //array de records de tipo Estudiante
             lista_estudiantes = [Record1, Record2, Record]
             Record1 = new Estudiante();
             */

            //array de record
            /*Estudiante[] estudiantes = new Estudiante[10000];

            estudiantes[3] = new Estudiante();

            estudiantes[3].Nombre = "Luke Skywalker";
            estudiantes[3].Edad = 25;
            estudiantes[3].HorasCursadas = 8.44f;

            Console.WriteLine(estudiantes[3]);
            */

            //utilizando un record como propiedad de otro record

            Alumno unEstudiante = new Alumno(); //instanciamos alumno

            unEstudiante.Nombre = "Pepe";
            unEstudiante.Edad = 45;
            unEstudiante.HorasCursadas = 1.24f;

            unEstudiante.UltimoIngreso.Dia = 18; //para utilizar y cargar las propiedades del record UltimoIngresoDia hay que instanciarlo
            unEstudiante.UltimoIngreso.Mes = 6;
            unEstudiante.UltimoIngreso.Anio = 2022;

            //otra forma de instanciar un record alumno y cargar sus propiedades
            Alumno unEstudiante2 = new Alumno()
            {
                Nombre = "Leia Organa",
                Edad = 25,
                HorasCursadas = 15.5f,
                UltimoIngreso = { Dia = 10, Mes = 6, Anio = 2022 }
            };



            Console.WriteLine(unEstudiante);
            Console.WriteLine(unEstudiante2);

            //instanciando un record de tipo mascota

            Mascota mascota1 = new Mascota();
            mascota1.Nombre = "Terri";
            mascota1.Edad = 12;
            mascota1.Raza = "caniche";

            //lo instancio aca o lo instancio en la deficion de Mascota  = new DiasPaseo();
            DiasPaseo diaPaseo = new DiasPaseo();
            diaPaseo.diaSemana = "Lunes";

            mascota1.dia = diaPaseo;

            Console.WriteLine(mascota1);

            //instancio otra mascota
            /* Mascota mascota2 = new Mascota();
             mascota2.Nombre = "lolo";
             mascota2.Edad = 8;
             mascota2.Raza = "Ovejero";

             Mascota mascota3 = new Mascota()
             {
                 Nombre = "Joacko",
                 Edad = 9,
                 Raza = "Salchicha"
             };

             Console.WriteLine(mascota3);*/

        }





    }
}



























Console.WriteLine("Hello, World!");
        }
    }
}
