//////////////
// Pettis Joint 
//////////////
//
// uso: Hacer translate en x hasta el borde
// hacer difference con pettis_macho_negativo
// hacer union con pettis_macho_positivo
//


module pettis_macho_positivo(cabeza,grosor,largo_pettis)
{
	plank=0.001;

	union()
	{	
		translate([grosor/2-plank,cabeza*1.5+largo_pettis/2])
			square([grosor,largo_pettis],center=true);
		translate([grosor/2-plank,-(cabeza*1.5+largo_pettis/2)])
			square([grosor,largo_pettis],center=true);
	}
};

module pettis_macho_negativo(largo_perno,ancho_perno,ancho_tuerca,alto_tuerca,grosor)
{
	plank=0.001;
	union()
		{	
			translate([-(largo_perno-grosor)/2+plank,0])
				square([largo_perno*1.1-grosor,ancho_perno],center=true);
			translate([-(largo_perno-grosor*2)+alto_tuerca/2+plank,0])
				square([alto_tuerca,ancho_tuerca],center=true);
				
		}
};

module pettis_hembra(cabeza,grosor,largo_pettis)
{
	union()
	{	
		translate([-grosor/4,0])
			circle(cabeza*1.1,$fn=300);
		translate([0,cabeza*3+largo_pettis/2])
			square([grosor,largo_pettis],center=true);
		translate([0,-(cabeza*3+largo_pettis/2)])
			square([grosor,largo_pettis],center=true);
	}
};


////
//plancha_x=200; // : Ancho interior de la placa
//plancha_y=200; // : Largo interior de la placa
//
//pettis_largo_perno=22; //: Largo del perno, desde la cabeza hasta el final
//pettis_ancho_perno=4; //: Diámetro de la rosca del perno
//pettis_ancho_tuerca=8; //: Diámetro de la tuerga del perno
//pettis_alto_tuerca=5; // : alto de la tuerca
//pettis_grosor=3; //: grosor exacto de las placas de madera (espesor) 
//pettis_cabeza=4; //: diámetro de la cabeza del perno, para hacer el orificio circular
//pettis_largo_pettis=5; //: ancho de las pestañas (tip, debería ser igual al grosor
//
//pettis_en_x=2; //: Cantidad de uniones Pettis en el ancho //Mínimo 2
//pettis_en_y=2; //: Cantidad de uniones Pettis en el ancho //Mínimo 2
//pettis_up_tipo="female"; //: "male, female, none" Tipo de unión superior
//pettis_down_tipo="male"; // "male, female, none" Tipo de unión inferior
//pettis_left_tipo="female"; //: "male, female, none" Tipo de unión izquierda
//pettis_right_tipo="male"; //: "male, female, none" Tipo de unión derecha
//
//pettis_board(plancha_x,plancha_y,pettis_largo_perno,pettis_ancho_perno,pettis_ancho_tuerca,pettis_alto_tuerca,pettis_grosor,pettis_cabeza,pettis_largo_pettis,pettis_en_x,pettis_en_y,pettis_up_tipo,pettis_down_tipo,pettis_left_tipo,pettis_right_tipo);
//
//translate([plancha_x+5,0])
//pettis_board(plancha_x,plancha_y,pettis_largo_perno,pettis_ancho_perno,pettis_ancho_tuerca,pettis_alto_tuerca,pettis_grosor,pettis_cabeza,pettis_largo_pettis,pettis_en_x,pettis_en_y,pettis_up_tipo,pettis_down_tipo,pettis_left_tipo,pettis_right_tipo);


/////////////////////////////////////////////////////////////
// MODULE PETTIS BOARD
//
// 
//	plancha_x: Ancho interior de la placa
//	plancha_y: Largo interior de la placa
//	
//	pettis_largo_perno: Largo del perno, desde la cabeza hasta el final
//	pettis_ancho_perno: Diámetro de la rosca del perno
//	pettis_ancho_tuerca: Diámetro de la tuerga del perno
//	pettis_alto_tuerca: alto de la tuerca
//	pettis_grosor: grosor exacto de las placas de madera (espesor) 
//	pettis_cabeza: diámetro de la cabeza del perno, para hacer el orificio circular
//	pettis_largo_pettis: ancho de las pestañas (tip, debería ser igual al grosor
//	
//	pettis_en_x: Cantidad de uniones Pettis en el ancho //Mínimo 2
//	pettis_en_y: Cantidad de uniones Pettis en el ancho //Mínimo 2
//
//  pettis_up_tipo: "male, female, none" Tipo de unión superior
//  pettis_down_tipo: "male, female, none" Tipo de unión inferior
//  pettis_left_tipo: "male, female, none" Tipo de unión izquierda
//  pettis_right_tipo: "male, female, none" Tipo de unión derecha
//
//
// TODO:
// Distribuir mejor los pettis en eje x e Y
//
/////////////////////////////////////////////////////////////

module pettis_board(plancha_x,plancha_y,pettis_largo_perno,pettis_ancho_perno,pettis_ancho_tuerca,pettis_alto_tuerca,pettis_grosor,pettis_cabeza,pettis_largo_pettis,pettis_en_x,pettis_en_y,pettis_up_tipo,pettis_down_tipo,pettis_left_tipo,pettis_right_tipo)
{
	pettis_safe_dist=pettis_largo_perno*2;

	union()
	{
		difference()
		{
			square([plancha_x,plancha_y],center=true);
			
			/////////////////////////////////////////////////
			// Calados en eje Y
			/////////////////////////////////////////////////
			for(offset_y=[-(plancha_y/2-pettis_safe_dist):(plancha_y-(2*pettis_safe_dist))/(pettis_en_y-1):plancha_y/2-pettis_safe_dist])
			{

				//derecha macho
				if (pettis_right_tipo=="male")
				{
					translate([plancha_x/2,offset_y])
						pettis_macho_negativo(pettis_largo_perno,pettis_ancho_perno,pettis_ancho_tuerca,pettis_alto_tuerca,pettis_grosor);
				}

				//Izquierda macho
				if (pettis_left_tipo=="male")
				{
					rotate([0,0,180])
						translate([plancha_x/2,offset_y])
							pettis_macho_negativo(pettis_largo_perno,pettis_ancho_perno,pettis_ancho_tuerca,pettis_alto_tuerca,pettis_grosor);
				}

				//derecha hembra
				if (pettis_right_tipo=="female")
				{
					translate([plancha_x/2,offset_y])
						pettis_hembra(pettis_ancho_perno/2,pettis_grosor,pettis_largo_pettis);
				}

				//Izquierda hembra
				if (pettis_left_tipo=="female")
				{
					rotate([0,0,180])
						translate([plancha_x/2,offset_y])
							pettis_hembra(pettis_ancho_perno/2,pettis_grosor,pettis_largo_pettis);
				}


	
			}
			/////////////////////////////////////////////////
			// FIN Calados en eje Y
			// Inicio Calados en eje X
			/////////////////////////////////////////////////
			for(offset_x=[-(plancha_x/2-pettis_safe_dist):(plancha_x-(2*pettis_safe_dist))/(pettis_en_x-1):plancha_x/2-pettis_safe_dist])
			{
				if (pettis_up_tipo=="male")
				{
					rotate([0,0,90])
						translate([plancha_y/2,offset_x])
						pettis_macho_negativo(pettis_largo_perno,pettis_ancho_perno,pettis_ancho_tuerca,pettis_alto_tuerca,pettis_grosor);
				}
	
				if (pettis_down_tipo=="male")
				{
					rotate([0,0,270])
						translate([plancha_y/2,offset_x])
							pettis_macho_negativo(pettis_largo_perno,pettis_ancho_perno,pettis_ancho_tuerca,pettis_alto_tuerca,pettis_grosor);
				}

				if (pettis_up_tipo=="female")
				{
					rotate([0,0,90])
						translate([plancha_y/2,offset_x])
						pettis_hembra(pettis_ancho_perno/2,pettis_grosor,pettis_largo_pettis);
				}
	
				if (pettis_down_tipo=="female")
				{
					rotate([0,0,270])
						translate([plancha_y/2,offset_x])
							pettis_hembra(pettis_ancho_perno/2,pettis_grosor,pettis_largo_pettis);
				}
			}
			/////////////////////////////////////////////////
			// FIN CALADOS EN EJE X
			/////////////////////////////////////////////////
		}
		//////////////////////////////////////////////////
		// CACHITOS EN EL EJE Y
		//////////////////////////////////////////////////
		for(offset_y=[-(plancha_y/2-pettis_safe_dist):(plancha_y-(2*pettis_safe_dist))/(pettis_en_y-1):plancha_y/2-pettis_safe_dist])
		{
			//derecha macho
			if (pettis_right_tipo=="male")
			{
				translate([plancha_x/2,offset_y])
					pettis_macho_positivo(pettis_cabeza,pettis_grosor,pettis_largo_pettis);
			}
			
			if (pettis_left_tipo=="male")
			{
				rotate([0,0,180])
				translate([plancha_x/2,offset_y])
					pettis_macho_positivo(pettis_cabeza,pettis_grosor,pettis_largo_pettis);
			}
		}
		//////////////////////////////////////////////////
		// CACHITOS EN EL EJE x
		//////////////////////////////////////////////////
		for(offset_x=[-(plancha_x/2-pettis_safe_dist):(plancha_x-(2*pettis_safe_dist))/(pettis_en_x-1):plancha_x/2-pettis_safe_dist])
		{
			if (pettis_up_tipo=="male")
			{
				rotate([0,0,90])
				translate([plancha_y/2,offset_x])
					pettis_macho_positivo(pettis_cabeza,pettis_grosor,pettis_largo_pettis);
			}
	
			if (pettis_down_tipo=="male")
			{
				rotate([0,0,270])
				translate([plancha_y/2,offset_x])
					pettis_macho_positivo(pettis_cabeza,pettis_grosor,pettis_largo_pettis);
			}
		}
	}
};