clear variables
clc
ppr=12.6;
nr=30;
pr=10;
np=140;
pf=-1.2;
ol=[.11 1.1];

pt=(1/ppr)*2*pi;
theta=linspace(0,np*pt,np*pr+1);
[R,THETA]=ndgrid(linspace(0,1,nr),theta);
x = 1-(abs(1-mod(ppr*THETA, 2*pi)/pi).^2)*.7;
phi = (pi/2)*linspace(ol(1),ol(2),np*pr+1).^2;
y = pf*(R.^2).*(1.27689*R-1).^2.*sin(phi);
R2 = x.*(R.*sin(phi) + y.*cos(phi));

X=R2.*sin(THETA);
Y=R2.*cos(THETA);
Z=x.*(R.*cos(phi)-y.*sin(phi));
C=hypot(hypot(X,Y), Z);

surf(X,Y,Z,C,FaceColor='interp', EdgeColor='none');
colormap(gca,[ linspace(.6,1,256); linspace(.1,.8,256); linspace(.7,1,256); ]');
daspect([1 1 1])