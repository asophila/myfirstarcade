/***************************************************************************/
//  Archivo: TabletopArcadeCabinet.scad
//  Desc   : Diseño de todas las piezas necesarias para cortar un gabinete 
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
GrosorMaterial = 5;       // Grosor del material (madera/acrílico). Requerido para uniones y joints
ProfundidadGabinete=500;  // 
AltoGabinete=600;         //



module SegmentoLateral()
{
	polygon(points=[[0,0],
					[ProfundidadGabinete,0],
					[ProfundidadGabinete,AltoGabinete],
					[100,AltoGabinete],
					[100,AltoGabinete-100],
					[200,AltoGabinete-100],
					[100,70],
					[0,70]], 
	paths=[[0,1,2,3,4,5,6,7]]);

};

lateral();