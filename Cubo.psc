SubProceso res <- arctan2( _x, _y )
	_tan <- atan(abs(_y)/abs(_x))
	si _x < 0 entonces
		si _y < 0 entonces
			res <- 270*pi/180 - _tan 
		sino 
			res <- 180*pi/180 - _tan 
		finsi
	sino
		si _y < 0 entonces
			res <- 360*pi/180 - _tan 
		sino 
			res <- _tan 
		finsi
	FinSi
Fin SubProceso


Proceso sin_titulo
	definir max_i, max_j Como Entero
	definir coor Como Caracter
	definir obj_x, obj_y, cam_x, cam_z como real
	max_i <- 32
	max_j <- 32
	dimension coor[max_i,max_j]
	dimension obj_x[56]
	dimension obj_y[56]
	dimension obj_z[56]
	dimension draw_x[56]
	dimension draw_y[56]
	obj_n <- 0
	
	Repetir
		obj_x[1+obj_n*8] <- (8-3.2*obj_n)
		obj_y[1+obj_n*8] <- (8)
		obj_z[1+obj_n*8]	<- (8)
		
		obj_x[2+obj_n*8] <- (-8)
		obj_y[2+obj_n*8] <- (8-3.2*obj_n)
		obj_z[2+obj_n*8]	<- (8)
		
		obj_x[3+obj_n*8] <- (-8+3.2*obj_n)
		obj_y[3+obj_n*8] <- (-8)
		obj_z[3+obj_n*8]	<- (8)
		
		obj_x[4+obj_n*8] <- (8)
		obj_y[4+obj_n*8] <- (-8+3.2*obj_n)
		obj_z[4+obj_n*8]	<- (8)
		
		obj_x[5+obj_n*8] <- (8-3.2*obj_n)
		obj_y[5+obj_n*8] <- (8)
		obj_z[5+obj_n*8]	<- (-8)
		
		obj_x[6+obj_n*8] <- (-8)
		obj_y[6+obj_n*8] <- (8-3.2*obj_n)
		obj_z[6+obj_n*8]	<- (-8)
		
		obj_x[7+obj_n*8] <- (-8+3.2*obj_n)
		obj_y[7+obj_n*8] <- (-8)
		obj_z[7+obj_n*8]	<- (-8)
		
		obj_x[8+obj_n*8] <- (8)
		obj_y[8+obj_n*8] <- (-8+3.2*obj_n)
		obj_z[8+obj_n*8]	<- (-8)
		obj_n <- obj_n+1
	Hasta Que obj_n = 5
	
	obj_n <- 0
	Repetir
		obj_x[41+obj_n*4] <- (-8)
		obj_y[41+obj_n*4] <- (8)
		obj_z[41+obj_n*4]	<- (-4.8+obj_n*3.2)
		
		obj_x[42+obj_n*4] <- (8)
		obj_y[42+obj_n*4] <- (-8)
		obj_z[42+obj_n*4]	<- (-4.8+obj_n*3.2)
		
		obj_x[43+obj_n*4] <- (8)
		obj_y[43+obj_n*4] <- (8)
		obj_z[43+obj_n*4]	<- (-4.8+obj_n*3.2)
		
		obj_x[44+obj_n*4] <- (-8)
		obj_y[44+obj_n*4] <- (-8)
		obj_z[44+obj_n*4]	<- (-4.8+obj_n*3.2)
		
		obj_n <- obj_n+1
	Hasta Que obj_n = 4
	
	Para i = 1 Hasta max_i Con Paso 1 Hacer
		Para j = 1 Hasta max_j Con Paso 1 Hacer
			coor[i,j] <- "."
		Fin Para
	Fin Para
	
	Para i = 1 Hasta max_j Con Paso 1 Hacer
		escribir coor[1,i], " ",coor[2,i], " ",coor[3,i], " ",coor[4,i], " ",coor[5,i], " ",coor[6,i], " ",coor[7,i], " ",coor[8,i], " ",coor[9,i], " ",coor[10,i], " ",coor[11,i], " ",coor[12,i], " ",coor[13,i], " ",coor[14,i], " ",coor[15,i], " ",coor[16,i], " ",coor[17,i], " ",coor[18,i], " ", coor[19,i], " ",coor[20,i], " ",coor[21,i], " ",coor[22,i], " ",coor[23,i], " ",coor[24,i], " ",coor[25,i], " ",coor[26,i], " ",coor[27,i], " ",coor[28,i], " ",coor[29,i], " ",coor[30,i], " ",coor[31,i], " ",coor[32,i]
	Fin Para
	
	Repetir		
		time <- time+1
		cam_x <- .2
		cam_z <- cam_z+.1
		Borrar Pantalla
		Para n = 1 Hasta 56 Con Paso 1 Hacer
			
			si 0 < draw_x[n] y draw_x[n] < max_i+1 y 0 < draw_y[n] y draw_y[n] < max_j+1 entonces
				coor[draw_x[n],draw_y[n]] <- "."
			finsi
			
			dis <- raiz((obj_x[n])*(obj_x[n])+(obj_y[n])*(obj_y[n]))
			ang	<- arctan2(obj_x[n],obj_y[n])
			
			draw_x[n] <- redon(cos(cam_x+ang)*dis+16)
			draw_y[n] <- redon(sen(cam_x+ang)*dis*sen(cam_z)+obj_z[n]*sen(90-cam_z)) + 16
			
			si 0 < draw_x[n] y draw_x[n] < max_i+1 y 0 < draw_y[n] y draw_y[n] < max_j+1 entonces
				coor[draw_x[n],draw_y[n]] <- "X"
			finsi
		Fin Para
		
		Para i = 1 Hasta max_j Con Paso 1 Hacer
			escribir coor[1,i], " ",coor[2,i], " ",coor[3,i], " ",coor[4,i], " ",coor[5,i], " ",coor[6,i], " ",coor[7,i], " ",coor[8,i], " ",coor[9,i], " ",coor[10,i], " ",coor[11,i], " ",coor[12,i], " ",coor[13,i], " ",coor[14,i], " ",coor[15,i], " ",coor[16,i], " ",coor[17,i], " ",coor[18,i], " ", coor[19,i], " ",coor[20,i], " ",coor[21,i], " ",coor[22,i], " ",coor[23,i], " ",coor[24,i], " ",coor[25,i], " ",coor[26,i], " ",coor[27,i], " ",coor[28,i], " ",coor[29,i], " ",coor[30,i], " ",coor[31,i], " ",coor[32,i]
		Fin Para
		Esperar 60 Milisegundos
	Hasta Que time = 3000
FinProceso