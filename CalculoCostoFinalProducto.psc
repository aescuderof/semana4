Algoritmo CalculoCostoFinalProducto
	
   
    Definir precioOriginal, cuponDescuento, iva, precioConDescuento, precioConIVA, precioConCantidad Como Real
    Definir descuentoCantidad, costoFijoEnvio, costoPorKg, costoEnvio, sumUnidad, costoFinal Como Real
    Definir cantidad, peso Como Entero
    Definir destino Como Caracter
	
    Dimension montos[4]
	
    Escribir "Ingrese el precio original del producto:"
    Leer precioOriginal
	
    Escribir "Ingrese el porcentaje de descuento por cupón (ej. 10 para 10%):"
    Leer cuponDescuento
	
    Escribir "Ingrese el porcentaje de IVA (ej. 12 para 12%):"
    Leer iva
	
    Escribir "Ingrese la cantidad de productos a comprar:"
    Leer cantidad
	
    Escribir "Ingrese el peso total del paquete (en kg):"
    Leer peso
	
    Escribir "Ingrese el destino del envío:"
    Leer destino
	
    costoFijoEnvio <- 10    // costo base fijo
    costoPorKg     <- 2     // costo adicional por kg
	
    precioConDescuento <- precioOriginal * (1 - cuponDescuento/100)
    precioConIVA       <- precioConDescuento * (1 + iva/100)
	
    Si cantidad > 1 Entonces
        descuentoCantidad <- 5    // 5% adicional
    Sino
        descuentoCantidad <- 0
    FinSi
    precioConCantidad <- precioConIVA * (1 - descuentoCantidad/100)
	
    sumUnidad <- precioConCantidad * cantidad

    costoEnvio <- costoFijoEnvio + (costoPorKg * peso)

    costoFinal <- sumUnidad + costoEnvio
	
    montos[1] <- precioOriginal * (cuponDescuento/100)      // monto descuento cupón
    montos[2] <- precioConDescuento * (iva/100)            // monto IVA
    montos[3] <- precioConIVA * (descuentoCantidad/100)    // monto descuento cantidad
    montos[4] <- costoEnvio                                 // costo envío
	
   
    Escribir "Costo final del pedido (productos + envío): $", costoFinal
    Escribir "Total por productos (", cantidad, " pares): $", sumUnidad ",cada par costó " sumUnidad/2
    Escribir "----- Desglose de Componentes -----"
    Para j <- 1 Hasta 4 Con Paso 1 Hacer
        Segun j
            1: Escribir "1) Monto Descuento Cupón: $", montos[j]
            2: Escribir "2) Monto IVA: $", montos[j]
            3: Escribir "3) Monto Descuento Cantidad: $", montos[j]
            4: Escribir "4) Costo Envío: $", montos[j]
        FinSegun
    FinPara
	
   

FinAlgoritmo
