translate(v=[0,-1,0])
  cube(size=[6,30,0.8]);
cube(size=[1,26,4.4]);
translate(v=[5,0,0])
  cube(size=[1,26,4.4]);

translate(v=[-6,-1,0])
  cube(size=[7,2,4.4]);
translate(v=[5,-1,0])
  cube(size=[7,2,4.4]);

translate(v=[-6.5,25,0])
  cube(size=[7.5,2,4.4]);
translate(v=[5,25,0])
  cube(size=[7.5,2,4.4]);

/* Add a base */

translate(v=[-6,-10,0])
  cube(size=[2.0,10,4.4]);

translate(v=[10,-10,0])
  cube(size=[2.0,10,4.4]);

translate(v=[-6,-12,0])
  difference()
  {
    cube(size=[18,2.0,4.4]);

    translate(v=[7.5,0,1.0])
      cube(size=[3.0,2.0,3.4]);
  }


/* Add a top */

translate(v=[-4.75,27,0])
{
  cube(size=[3,3.0,4.4]);
  cube(size=[5.75,2.0,4.4]);
}

translate(v=[7.75,27,0])
{
  cube(size=[3,3.0,4.4]);
  translate(v=[-2.75,0,0])
    cube(size=[5.75,2.0,4.4]);
}