namespace Examen
{
    class Program
    {
        record Mascota
        {
            public string Nombre { get; set; }
            public short Edad { get; set; }
            public string Raza { get; set; }
        }

        static void Main(string[] args)
        {
            // Creando una instancia de la mascota
            var mascota1 = new Mascota //Mascota mascota1 = new Mascota
            {
                Nombre = "Firulais",
                Edad = 5,
                Raza = "Labrador"
            };

            //El punto y coma al final de la inicialización de un objeto es necesario para finalizar la instrucción.
            //No es parte de la inicialización en sí, sino una regla del lenguaje C# para marcar el fin de una declaración o
            //expresión.





            // Modificando los valores de la mascota
            mascota1.Nombre = "Rocky";
            mascota1.Edad = 6;
            mascota1.Raza = "Pitbull";

            // Mostrar la mascota
            Console.WriteLine($"Nombre: {mascota1.Nombre}, Edad: {mascota1.Edad}, Raza: {mascota1.Raza}");
        }
    }
}
