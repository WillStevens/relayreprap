module mount()
{

translate(v=[0,60,0])
  difference()
  {
    cube(size=[12,20,2.4]);

    translate(v=[9.6,13,0])
      cube(size=[2.5,4,2.4]);

    translate(v=[9.6,3,0])
      cube(size=[2.5,4,2.4]);

    translate(v=[0,13,0])
      cube(size=[2.5,4,2.4]);

    translate(v=[0,3,0])
      cube(size=[2.5,4,2.4]);

  }

translate(v=[0,-10,0])
  difference()
  {
    cube(size=[12,10,2.4]);

    translate(v=[9.6,3,0])
      cube(size=[2.5,4,2.4]);

    translate(v=[0,3,0])
      cube(size=[2.5,4,2.4]);
  }

difference()
{
  cube(size=[12,60,2.4]);

  translate(v=[5,30,1.2])
    cylinder(h=2.4,r=2.4,$fs=0.1,center=true);
}

translate(v=[12,0,0])
  cube(size=[2.4,4,2.4]);

translate(v=[12,56,0])
  cube(size=[2.4,4,2.4]);

translate(v=[13.5,0,0])
  cube(size=[3.5,60,2.4]);
}

rotate([0,0,90])
  mount();