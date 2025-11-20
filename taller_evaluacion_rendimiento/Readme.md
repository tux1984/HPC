# ⚙️ Taller de Evaluación de Rendimiento – HPC

Este directorio contiene la implementación, automatización y resultados del experimento de evaluación de rendimiento para **multiplicación de matrices** utilizando tres modelos de paralelismo en C:

- **Fork (procesos)**
- **OpenMP (paralelismo basado en hilos)**
- **POSIX Threads (Pthreads)**

El objetivo del taller es analizar el comportamiento de cada enfoque bajo diferentes tamaños de matriz y niveles de paralelismo, evaluando eficiencia, escalabilidad y overhead en entornos contrastados (VM Linux vs macOS).

---

## 📂 Estructura del directorio

### 🔹 Implementaciones paralelas
- `mmClasicaFork.c` / `mmClasicaFork`  
  Versión basada en procesos vía `fork()`.

- `mmClasicaOpenMP.c` / `mmClasicaOpenMP`  
  Implementación con directivas OpenMP (`#pragma omp`).

- `mmClasicaPosix.c` / `mmClasicaPosix`  
  Versión basada en **Pthreads**.

### 🔹 Automatización
- **Makefile**  
  Compila de forma estandarizada las tres variantes.

- **lanzador.pl**  
  Script para ejecutar múltiples combinaciones (tamaño × hilos).

- **consolidar_resultados.sh**  
  Consolida salidas crudas en CSV procesables.

### 🔹 Salidas de ejecución
- `mmClasicaFork_resultados/`  
- `mmClasicaOpenMP_resultados/`  
- `mmClasicaPosix_resultados/`  

Cada carpeta contiene logs y tiempos por configuración experimental.

### 🔹 Resultados comparativos
- `resultados_consolidados_mac.csv`  
- `resultados_consolidados_vm.csv`

Archivos finales listos para análisis: tiempo promedio, speedup, eficiencia y comportamiento por técnica.

---

## 🎯 Objetivo técnico

Evaluar cuantitativamente:

- **Tiempos de ejecución absolutos**  
- **Speedup y eficiencia** en función del número de hilos/procesos  
- **Escalabilidad fuerte** vs tamaño de matriz  
- Impacto del **overhead** entre modelos de paralelismo  
- Efecto del hardware (Mac vs VM Linux)

Este experimento sirve como base para comparar modelos de paralelismo POSIX, OpenMP y multiproceso, así como para entender el efecto de la arquitectura del sistema sobre workloads intensivos en cómputo.

---

## 📌 Notas adicionales

- Los resultados están listos para análisis en Jupyter, R, Python o herramientas HPC.
- Las rutas y scripts permiten replicar el experimento de forma consistente.
