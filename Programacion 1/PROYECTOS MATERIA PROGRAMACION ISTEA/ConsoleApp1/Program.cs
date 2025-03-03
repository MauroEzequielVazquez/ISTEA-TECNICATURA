namespace ConsoleApp1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Str                    ing Frase;
            char letraActual, letrNueva;

            Console.WriteLine("Ingrese la Frase");
            Frase = Console.ReadLine();

            Console.WriteLine("Ingrese la letra a Reemplazar");
            letraActual = char.Parse(Console.ReadLine());

            Console.WriteLine("Ingrese la letra Nueva");
            letrNueva = char.Parse(Console.ReadLine());
            
            Frase = Frase.Replace(letraActual, letrNueva);
            Console.WriteLine("La frase nueva es: " + Frase);
            Console.WriteLine("Fin del programa");
         
           
    }
}

}