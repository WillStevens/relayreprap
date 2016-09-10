
module releaser(holelength)
{
  translate(v=[0,0,0])
    cube(size=[7,17,2.4]);

  translate(v=[0,-5-holelength-10,0])
    cube(size=[7,5,2.4]);

  translate(v=[-8,-5,0])
    cube(size=[23,5,0.8]);

  translate(v=[-8,-5-holelength,0])
    cube(size=[5,holelength,0.8]);

  translate(v=[10,-5-holelength,0])
    cube(size=[5,holelength,0.8]);

  translate(v=[-8,-5-holelength-5,0])
    cube(size=[23,5,0.8]);
}

releaser(37*1.5);
