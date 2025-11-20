#!/usr/bin/perl
# Pontificia Universidad Javeriana
# Materia: Sistemas Operativos
# Tema: Taller de Evaluación de Rendimiento
# Fichero: script automatización ejecución por lotes

$Path = `pwd`;
chomp($Path);

$Nombre_Ejecutable = "mmClasicaOpenMP";

@Size_Matriz = ("500","1000","1500","2000");
@Num_Hilos = (1,2,3,4,5,6,7);
$Repeticiones = 30;

foreach $size (@Size_Matriz){
	foreach $hilo (@Num_Hilos) {

		# Crea carpeta si no existe, sin mostrar warning
		system("mkdir -p $Path/${Nombre_Ejecutable}_resultados > /dev/null 2>&1");

		# Define archivo de salida
		$file = "$Path/${Nombre_Ejecutable}_resultados/$Nombre_Ejecutable-${size}-Hilos-${hilo}.dat";

		# Ejecuta las repeticiones
		for ($i=0; $i<$Repeticiones; $i++) {
			print "Ejecutando $Nombre_Ejecutable N=$size H=$hilo iter=$i\n";
			system("$Path/$Nombre_Ejecutable $size $hilo >> '$file'");
		}

		close($file);
	}
}
