module nailstemholder(radius,headradius)
{
  difference()
  {
    cube(size=[2*radius+4,5,headradius+radius]);

    translate(v=[2,0,headradius-radius])
      cube(size=[2*radius,5,2*radius]);
  }
}

module releaser(axisgap,bridgeheight,holelength)
{
  nailstemholder(1.5,4.75);

  translate(v=[0,-5,-1.2])
    cube(size=[7,10,1.2]);

  translate(v=[-8,-5,-1.2])
    cube(size=[23,5,1.2]);

  translate(v=[-5,-5-(holelength/2)+axisgap/2,-1.2])
    cube(size=[5,(holelength/2)-axisgap/2,1.2]);

  translate(v=[7,-5-(holelength/2)+axisgap/2,-1.2])
    cube(size=[5,(holelength/2)-axisgap/2,1.2]);


/*
  translate(v=[-5,-5-(holelength/2)+axisgap/2,-1.2])
    cube(size=[5,3,bridgeheight]);

  translate(v=[7,-5-(holelength/2)+axisgap/2,-1.2])
    cube(size=[5,3,bridgeheight]);

  translate(v=[-5,-5-(holelength/2)-axisgap/2-3,-1.2])
    cube(size=[5,3,bridgeheight]);

  translate(v=[7,-5-(holelength/2)-axisgap/2-3,-1.2])
    cube(size=[5,3,bridgeheight]);

  translate(v=[-5,-5-(holelength/2)-axisgap/2-3,bridgeheight-1.2])
    cube(size=[5,3+3+axisgap,1.2]);

  translate(v=[7,-5-(holelength/2)-axisgap/2-3,bridgeheight-1.2])
    cube(size=[5,3+3+axisgap,1.2]);
*/


  translate(v=[-5,-5-holelength,-1.2])
    cube(size=[5,(holelength/2)-axisgap/2,1.2]);

  translate(v=[7,-5-holelength,-1.2])
    cube(size=[5,(holelength/2)-axisgap/2,1.2]);

  translate(v=[-8,-5-holelength-5,-1.2])
    cube(size=[23,5,1.2]);
}

releaser(0,6,37);