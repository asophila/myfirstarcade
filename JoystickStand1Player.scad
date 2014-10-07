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

DiametroOrificioJoystick = 30; // Diámetro necesario para que el Joystick se mueva en libertad

AnchoBaseHorizontal = 400;
ProfundidadBaseHorizontal = 250;


// Base Horizontal donde van embutidos Joystick y Botones.
// Base tiene orificio circular para Joystick y 6 orificios para botones

module BaseHorizontalControles()
{
	difference()
	{
		RawBaseHorizontal(); // Paso 1
		translate([0,0])
			circle(DiametroOrificioJoystick);	
	};
	
};

module RawBaseHorizontal()
{
	//Paso 1: Crear la base con bordes redondeados usando suma Minkowski
	minkowski()
	{
		square([AnchoBaseHorizontal,ProfundidadBaseHorizontal],center=true);
		circle(RadioCurva);
	}
};


/******************************
*******  TESTING **************
*************************/
BaseHorizontalControles();