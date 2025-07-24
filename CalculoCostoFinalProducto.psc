Algoritmo CalculoCostoFinalProducto
	
    // 1. Definici�n de variables escalares
    Definir precioOriginal, cuponDescuento, iva, precioConDescuento, precioConIVA, precioConCantidad Como Real
    Definir descuentoCantidad, costoFijoEnvio, costoPorKg, costoEnvio, sumUnidad, costoFinal Como Real
    Definir cantidad, peso Como Entero
    Definir destino Como Caracter
	
    // 2. Declaraci�n EST�TICA de arreglo para el desglose de montos
    Dimension montos[4]
	
    // 3. Lectura de datos
    Escribir "Ingrese el precio original del producto:"
    Leer precioOriginal
	
    Escribir "Ingrese el porcentaje de descuento por cup�n (ej. 10 para 10%):"
    Leer cuponDescuento
	
    Escribir "Ingrese el porcentaje de IVA (ej. 12 para 12%):"
    Leer iva
	
    Escribir "Ingrese la cantidad de productos a comprar:"
    Leer cantidad
	
    Escribir "Ingrese el peso total del paquete (en kg):"
    Leer peso
	
    Escribir "Ingrese el destino del env�o:"
    Leer destino
	
    // 4. Inicializaci�n de costos de env�o
    costoFijoEnvio <- 10    // costo base fijo
    costoPorKg     <- 2     // costo adicional por kg
	
    // 5. C�lculo tras cup�n e IVA
    precioConDescuento <- precioOriginal * (1 - cuponDescuento/100)
    precioConIVA       <- precioConDescuento * (1 + iva/100)
	
    // 6. Descuento por cantidad
    Si cantidad > 1 Entonces
        descuentoCantidad <- 5    // 5% adicional
    Sino
        descuentoCantidad <- 0
    FinSi
    precioConCantidad <- precioConIVA * (1 - descuentoCantidad/100)
	
    // 7. Suma total de productos
    sumUnidad <- precioConCantidad * cantidad
	
    // 8. C�lculo del env�o
    costoEnvio <- costoFijoEnvio + (costoPorKg * peso)
	
    // 9. Costo final
    costoFinal <- sumUnidad + costoEnvio
	
    // 10. Llenado del arreglo de montos
    montos[1] <- precioOriginal * (cuponDescuento/100)      // monto descuento cup�n
    montos[2] <- precioConDescuento * (iva/100)            // monto IVA
    montos[3] <- precioConIVA * (descuentoCantidad/100)    // monto descuento cantidad
    montos[4] <- costoEnvio                                 // costo env�o
	
    // 11. Mostrar resultados desglosados
   
	Escribir "Costo final del pedido (productos + env�o): $", costoFinal
    Escribir "Total por productos (", cantidad, " pares): $", sumUnidad ",cada par cost� " sumUnidad/2
    Escribir "----- Desglose de Componentes -----"
    Para j <- 1 Hasta 4 Con Paso 1 Hacer
        Segun j
            1: Escribir "1) Monto Descuento Cup�n: $", montos[j]
            2: Escribir "2) Monto IVA: $", montos[j]
            3: Escribir "3) Monto Descuento Cantidad: $", montos[j]
            4: Escribir "4) Costo Env�o: $", montos[j]
        FinSegun
    FinPara
	
   

FinAlgoritmo
