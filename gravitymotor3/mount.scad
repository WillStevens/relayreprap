module mount()
{

translate(v=[0,90,0])
  difference()
  {
    cube(size=[6,8,2.4]);

    translate(v=[0,2,0])
      cube(size=[2.5,4,2.4]);

  }

translate(v=[0,-8,0])
  difference()
  {
    cube(size=[12,8,2.4]);

    translate(v=[9.6,2,0])
      cube(size=[2.5,4,2.4]);

    translate(v=[0,2,0])
      cube(size=[2.5,4,2.4]);
  }

difference()
{
  cube(size=[12,90,2.4]);

  /* For the radius below, 2.1 was too large */
  translate(v=[5,45,1.2])
    cylinder(h=2.4,r=1.95,$fs=0.1,center=true);

  /* Holes to reduce the amount of filament used */
  translate(v=[4,7,0])
    cube(size=[4,13.5,2.4]);

  translate(v=[4,24.5,0])
    cube(size=[4,13.5,2.4]);

  translate(v=[4,52,0])
    cube(size=[4,13.5,2.4]);

  translate(v=[4,69.5,0])
    cube(size=[4,13.5,2.4]);
}

translate(v=[12,0,0])
  cube(size=[2.4,4,2.4]);

translate(v=[13.5,0,0])
  cube(size=[3.5,90,2.4]);

translate(v=[12,86,0])
  cube(size=[2.4,4,2.4]);
}

rotate([0,0,90])
  mount();

translate(v=[0,20,0])
rotate([0,0,90])
  mount();