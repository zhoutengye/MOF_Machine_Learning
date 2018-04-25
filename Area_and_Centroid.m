function [n,area,centroid] = Area_and_Centroid(a,b,c)

  area = zeros(2,1);
  centroid = zeros(2);

  fx0 = -c/a;
  fx1 = -(c+b)/a;
  f0y = -c/b;
  f1y = -(c+a)/b;

  if (fx0>=0 && fx0<=1 && f1y>=0 && f1y<=1)
    n = 1;
  elseif (f0y>=0 && f0y<=1 && f1y>=0 && f1y<=1)
    n = 2;
  elseif (fx0>=0 && fx0<=1 && fx1>=0 && fx1<=1)
    n = 3;
  elseif (f0y>=0 && f0y<=1 && fx1>=0 && fx1<=1)
    n = 4;
  elseif (fx0>=0 && fx0<=1 && f0y>=0 && f0y<=1)
    n = 5;
  elseif (fx1>=0 && fx1<=1 && f1y>=0 && f1y<=1)
    n = 6;
  else
    n = 0;
  end

  switch n
    case 1
      area(2) = 0.5 * (1-fx0) * f1y;
      area(1) = 1 - area(2);
      centroid(2,1) = 1 - (1-fx0) / 3;
      centroid(2,2) = f1y / 3;
      centroid(1,1) = (0.5-centroid(2,1)*area(2)) / area(1);
      centroid(1,2) = (0.5-centroid(2,2)*area(2)) / area(1);
    case 2
      area(2) = 0.5 * (f0y+f1y);
      area(1) = 1 - area(2);
      centroid(2,1) = 1/3 * (2*f1y+f0y) / (f1y+f0y);
      centroid(2,2) = (f0y^2+f1y^2+f0y*f1y) / (f0y+f1y) /3;
      centroid(1,1) = (0.5-centroid(2,1)*area(2)) / area(1);
      centroid(1,2) = (0.5-centroid(2,2)*area(2)) / area(1);
    case 3
      area(1) = 0.5 * (fx0+fx1);
      area(2) = 1 - area(1);
      centroid(1,1) = (fx0^2+fx1^2+fx0*fx1) / (fx0+fx1) /3;
      centroid(1,2) = 1/3 * (2*fx1+fx0) / (fx0+fx1);
      centroid(2,1) = (0.5-centroid(1,1)*area(1)) / area(2);
      centroid(2,2) = (0.5-centroid(1,2)*area(1)) / area(2);
    case 4
      area(1) = 0.5 * (1-f0y) * fx1;
      area(2) = 1 - area(1);
      centroid(1,1) = fx1 / 3;
      centroid(1,2) = 1 - (1-f0y) / 3;
      centroid(2,1) = (0.5-centroid(1,1)*area(1)) / area(2);
      centroid(2,2) = (0.5-centroid(1,2)*area(1)) / area(2);
    case 5
      area(1) = 0.5 * f0y * fx0;
      area(2) = 1 - area(1);
      centroid(1,1) = fx0 / 3;
      centroid(1,2) = f0y / 3;
      centroid(2,1) = (0.5-centroid(1,1)*area(1)) / area(2);
      centroid(2,2) = (0.5-centroid(1,2)*area(1)) / area(2);
    case 6
      area(2) = 0.5 * (1-f1y) * (1-fx1);
      area(1) = 1 - area(2);
      centroid(2,1) = 1 - (1-fx1) / 3;
      centroid(2,2) = 1 - (1-f1y) / 3;
      centroid(1,1) = (0.5-centroid(2,1)*area(2)) / area(1);
      centroid(1,2) = (0.5-centroid(2,2)*area(2)) / area(1);
  end
