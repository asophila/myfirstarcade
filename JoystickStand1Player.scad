/***************************************************************************/
//  Archivo: JoystickStand1Player.scad
//  Desc   : Base para 1 set de controles, compatible con DAS ARCADE
//           tamaño tabletop.
//  
//           Todas las medidas deben ser paramétricas con base en tamaño de
//           pantalla a utilizar.
//
//           Código debe estar bien documentado con nombres de variables
//           autoexplicativos
//
//			Todas las medidas son en milímetros.
//
//
//           Esta obra está licenciada bajo 
//           la Licencia Creative Commons Atribución-NoComercial-CompartirIgual 4.0 Internacional. 
//           Para ver una copia de esta licencia, visita http://creativecommons.org/licenses/by-nc-sa/4.0/.
//
/***************************************************************************/



//////////////////////////
// Variables Globales
//////////////////////////
GrosorMaterial = 5;            // Grosor del material (madera/acrílico). Requerido para uniones y joints
RadioCurva = GrosorMaterial*2; // Define qué tan puntiagudas son las esquinas usando suma Minkowski

DiametroOrificioJoystick = 20; // Diámetro necesario para que el Joystick se mueva en libertad
DiametroOrificioBoton	= 25; // Diámetro Orificio Botón (Plunger Diámeter)
DistanciaHEntreBotones    = 36; // Espacio horizontal entre el centro de 2 botones alineados
DistanciaVEntreBotones    = 39; // Espacio vertical entre el centro de 2 botones alineados

AnchoBaseHorizontal = 400;
ProfundidadBaseHorizontal = 250;


// Base Horizontal donde van embutidos Joystick y Botones.
// Base tiene orificio circular para Joystick y 6 orificios para botones

module BaseHorizontalControles()
{
	difference()
	{
		RawBaseHorizontal(); // Paso 1
		OrificiosJoystickyBotones(); //Paso 2
	};
	
};

//Base horizontal sólida
module RawBaseHorizontal()
{
	//Paso 1: Crear la base con bordes redondeados usando suma Minkowski
	minkowski()
	{
		square([AnchoBaseHorizontal,ProfundidadBaseHorizontal],center=true);
		circle(RadioCurva);
	}
};

module OrificiosJoystickyBotones()
{

		//Desde el centro, corremos a la izquierda el orificio del Joystick
		translate([-63+5.5,0])
			circle(DiametroOrificioJoystick/2);	
		
		//Creamos 2 filas horizontales de botones
		for(Fila = [0,1])
		{
			//Columna 1
			//Correr 5.5 mm hacia la derecha los botones, y 20mm hacia abajo
			//Sólo para la primera columna
			translate([5.5,Fila*DistanciaVEntreBotones-20])
				circle(DiametroOrificioBoton/2);
		
			//Columnas 2 y 3	
			for(Columna = [1:2])
			{
				translate([Columna*DistanciaHEntreBotones,Fila*DistanciaVEntreBotones])
					circle(DiametroOrificioBoton/2);
			}
		};
};


/******************************
*******  TESTING **************
*************************/
BaseHorizontalControles();