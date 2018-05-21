function [n,area,centroid] = Area_and_Centroid(n1,n2,c)

  centroid = zeros(2,1);

  a = n1;
  b = n2;
  % c = -b*c;
  c = -c*sqrt(n1*n1+n2*n2);

  fx0 = (0.5*b-c)/a;
  fx1 = -(c+0.5*b)/a;
  f0y = (0.5*a-c)/b;
  f1y = -(c+0.5*a)/b;

  if (fx0>=-0.5 && fx0<=0.5 && f1y>=-0.5 && f1y<=0.5)
    n = 1;
  elseif (f0y>=-0.5 && f0y<=0.5 && f1y>=-0.5 && f1y<=0.5)
    n = 2;
  elseif (fx0>=-0.5 && fx0<=0.5 && fx1>=-0.5 && fx1<=0.5)
    n = 3;
  elseif (f0y>=-0.5 && f0y<=0.5 && fx1>=-0.5 && fx1<=0.5)
    n = 4;
  elseif (fx0>=-0.5 && fx0<=0.5 && f0y>=-0.5 && f0y<=0.5)
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
      area = 0.5 * (0.5-fx0) * (f1y+0.5);
      centroid(1) = 0.5 - (0.5-fx0+1e-10) / 3;
      centroid(2) = (f1y+0.5) / 3 - 0.5;
      if (n1<0)
        area2 = 1 - area;
        centroid(1) = -centroid(1)*area / (area2+1e-10);
        centroid(2) = -centroid(2)*area / (area2+1e-10);
        area = area2;
      end
    case 2
      area = 0.5 * (f0y+f1y+1);
      centroid(1) = 1/3 * (2*(f1y+0.5)+(f0y+0.5)) / (f1y+f0y+1+1e-10)-0.5;
      centroid(2) = ((f0y+0.5)^2+(f1y+0.5)^2+(f0y+0.5)*(f1y+0.5)) / (f0y+f1y+1+1e-10) /3-0.5;
      if (n2>0)
        area2 = 1 - area;
        centroid(1) = -centroid(1)*area / (area2+1e-10);
        centroid(2) = -centroid(2)*area / (area2+1e-10);
        area = area2;
      end
    case 3
      area = 0.5 * (fx0+fx1+1);
      centroid(1) = ((fx0+0.5)^2+(fx1+0.5)^2+(fx0+0.5)*(fx1+0.5)) / (fx0+fx1+1+1e-10) /3-0.5;
      centroid(2) = 1/3 * (2*(fx1+0.5)+fx0+0.5) / (fx0+fx1+1+1e-10)-0.5;
      if (n1>0)
        area2 = 1 - area;
        centroid(1) = -centroid(1)*area / (area2+1e-10);
        centroid(2) = -centroid(2)*area / (area2+1e-10);
        area = area2;
      end
    case 4
      area = 0.5 * (0.5-f0y) * (fx1+0.5);
      centroid(1) = (fx1+0.5) / 3 - 0.5;
      centroid(2) = 0.5 - (0.5-f0y) / 3;
      if (n1>0)
        area2 = 1 - area;
        centroid(1) = -centroid(1)*area / (area2+1e-10);
        centroid(2) = -centroid(2)*area / (area2+1e-10);
        area = area2;
      end
    case 5
      area = 0.5 * (f0y+0.5) * (fx0+0.5);
      centroid(1) = (fx0+0.5) / 3 - 0.5;
      centroid(2) = (f0y+0.5) / 3 - 0.5;
      if (n1>0)
        area2= 1 - area;
        centroid(1) = -centroid(1)*area / (area2+1e-10);
        centroid(2) = -centroid(2)*area / (area2+1e-10);
        area = area2;
      end
    case 6
      area = 0.5 * (0.5-f1y) * (0.5-fx1);
      centroid(1) = 0.5 - (0.5-fx1) / 3;
      centroid(2) = 0.5 - (0.5-f1y) / 3;
      if (n1<0) 
        area2 = 1 - area;
        centroid(1) = -centroid(1)*area / (area2+1e-10);
        centroid(2) = -centroid(2)*area / (area2+1e-10);
        area = area2;
      end
  end