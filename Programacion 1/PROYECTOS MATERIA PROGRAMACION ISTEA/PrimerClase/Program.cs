namespace PrimerClase
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string Nombre;

            Console.WriteLine("Ingrese su nombre");
            Nombre = Console.ReadLine();
            Console.WriteLine("Mi nombre es :" + Nombre + " !");


            Console.WriteLine("Fin del mensaje sencillo, no hace falta convertir la variable  Nombre a otro formato xq el Método ReadLine devuelve por defecto un string" +  "!");
            Console.ReadKey();
        }
    }
}
