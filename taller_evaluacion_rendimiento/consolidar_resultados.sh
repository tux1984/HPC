#!/bin/bash
# Consolidar resultados OpenMP/Pthreads/Fork en un CSV unificado

OUTPUT="resultados_consolidados.csv"
echo "algoritmo,tamano_matriz,hilos,iteracion,tiempo_us" > $OUTPUT

for carpeta in *_resultados; do
  algoritmo=$(echo "$carpeta" | sed 's/_resultados//')
  for file in "$carpeta"/*.dat; do
    # Ejemplo nombre: mmClasicaOpenMP-10-Hilos-4.dat
    base=$(basename "$file")
    tamano=$(echo "$base" | sed -E 's/.*-([0-9]+)-Hilos-.*/\1/')
    hilos=$(echo "$base" | sed -E 's/.*-Hilos-([0-9]+)\.dat/\1/')
    iter=1
    while read -r tiempo; do
      echo "$algoritmo,$tamano,$hilos,$iter,$tiempo" >> $OUTPUT
      iter=$((iter+1))
    done < "$file"
  done
done

echo "✅ Archivo CSV generado: $OUTPUT"
