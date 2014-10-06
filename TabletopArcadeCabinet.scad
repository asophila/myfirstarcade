profundidad=500;
alto=600;



module lateral()
{
	polygon(points=[[0,0],
					[profundidad,0],
					[profundidad,alto],
					[100,alto],
					[100,alto-100],
					[200,alto-100],
					[100,70],
					[0,70]], 
	paths=[[0,1,2,3,4,5,6,7]]);

};

lateral();