function [n,area,centroid] = Area_and_Centroid(n1,n2,c)

  centroid = zeros(2,1);

  a = n1;
  b = n2;
  c = -c*(n1*n1-n2*n2)/sqrt(n1*n1+n2*n2);

  fx0 = -c/a;
  fx1 = -(c+b)/a;
  f0y = -c/b;
  f1y = -(c+a)/b;

  if (fx0>=-0.5 && fx0<=0.5 && f1y>=-0.5 && f1y<=0.5)
    n = 1;
  elseif (f0y>=-0.5 && f0y<=0.5 && f1y>=-0.5 && f1y<=0.5)
    n = 2;
  elseif (fx0>=-0.5 && fx0<=0.5 && fx1>=-0.5 && fx1<=0.5)
    n = 3;
  elseif (f0y>=-0.5 && f0y<=0.5 && fx1>=-0.5 && fx1<=0.5)
    n = 4;
  elseif (fx0>=-0.0 && fx0<=0.5 && f0y>=-0.5 && f0y<=0.5)
    n = 5;
  elseif (fx1>=-0.5 && fx1<=0.5 && f1y>=-0.5 && f1y<=0.5)
    n = 6;
  else
    n = 0;
    area = -1;
    return;
  end

  switch n
    case 1
      area = 0.5 * (1-fx0) * f1y;
      centroid(1) = 1 - (1-fx0) / 3;
      centroid(2) = f1y / 3;
      if (n1<0)
        area2 = 1 - area;
        centroid(1) = (0.5-centroid(1)*area) / area2;
        centroid(2) = (0.5-centroid(2)*area) / area2;
        area = area2;
      end
    case 2
      area = 0.5 * (f0y+f1y);
      centroid(1) = 1/3 * (2*f1y+f0y) / (f1y+f0y);
      centroid(2) = (f0y^2+f1y^2+f0y*f1y) / (f0y+f1y) /3;
      if (n2>0)
        area2 = 1 - area;
        centroid(1) = (0.5-centroid(1)*area) / area2;
        centroid(2) = (0.5-centroid(2)*area) / area2;
      end
    case 3
      area = 0.5 * (fx0+fx1);
      centroid(1) = (fx0^2+fx1^2+fx0*fx1) / (fx0+fx1) /3;
      centroid(2) = 1/3 * (2*fx1+fx0) / (fx0+fx1);
      if (n1>0)
        area2 = 1 - area;
        centroid(1) = (0.5-centroid(1)*area) / area2;
        centroid(2) = (0.5-centroid(2)*area) / area2;
      end
    case 4
      area = 0.5 * (1-f0y) * fx1;
      centroid(1) = fx1 / 3;
      centroid(2) = 1 - (1-f0y) / 3;
      if (n1>0)
        area2 = 1 - area;
        centroid(1) = (0.5-centroid(1)*area) / area2;
        centroid(2) = (0.5-centroid(2)*area) / area2;
        area = area2;
      end
    case 5
      area = 0.5 * f0y * fx0;
      centroid(1) = fx0 / 3;
      centroid(2) = f0y / 3;
      if (n1>0)
        area2= 1 - area;
        centroid(1) = (0.5-centroid(1)*area) / area2;
        centroid(2) = (0.5-centroid(2)*area) / area2;
        area = area2;
      end
    case 6
      area = 0.5 * (1-f1y) * (1-fx1);
      centroid(1) = 1 - (1-fx1) / 3;
      centroid(2) = 1 - (1-f1y) / 3;
      if (n1<0) 
        area2 = 1 - area;
        centroid(1) = (0.5-centroid(1)*area) / area2;
        centroid(2) = (0.5-centroid(2)*area) / area2;
        area = area2;
      end
  end
