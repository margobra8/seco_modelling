% - Este programa traza curvas de los polinomios de interpolación Veq-V y V-Veq
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AUTOR: Félix Monasterio-Huelin
% FECHA: 30 de marzo de 2016; modificado 11 de febrero de 2017 para no utilizar '-DynamicLegend'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function  ModeladoMotorDCCurvasPoli(a,b,TensionVectorP,VeqVP)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Curvas Polinomios, debido a la no linealidad de K
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xLimV=max(TensionVectorP);
xLimVeq=max(VeqVP);
TensionVectorL=length(TensionVectorP);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Trazado de la curva Veq-V
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Titulo=strcat('Curva polinómica f');
CurvaVeqVB(xLimV,TensionVectorL,a,'V','Veq',Titulo);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Trazado de la curva V-Veq
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Titulo=strcat('Curva polinómica f^{-1}');
CurvaVeqVB(xLimVeq,TensionVectorL,b,'Veq','V',Titulo);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end% function

%%%%%%%%%%%%%%%
% funciones utilizadas
%%%%%%%%%%%%%%%
function CurvaVeqVB(xLimB,Lc2,aR,labelX,labelY,Titulo);
	Incx=0.01;
	x=-xLimB:Incx:xLimB;
	figure;
	Grado=2*Lc2-1;
	GradoN=int2str(Grado);
	Veq=0;
	for i=1:Lc2
		Veq=Veq+aR(i)*x.^(2*i-1);
	end
	LeyendaA=strcat('polinomio de grado:',GradoN);
%	plot(x,Veq,'Color',[.7 .5 0],'LineWidth',2);% color brown [R G B]
	plot(x,Veq,'Color',[.7 .5 0],'LineWidth',2,'DisplayName',LeyendaA);
%	legend('-DynamicLegend'); % comprobado en versión Matlab: R2013a
	hold on
	set(gca,'XMinorTick','on');
	set(gca,'YMinorTick','on');
	set(gca,'XTick',-round(xLimB):1:round(xLimB));
	xlabel(labelX)
	ylabel(labelY)
	title(Titulo)
	Veq=x.^1;
	LeyendaB=strcat('lineal');
%	plot(x,Veq,'Color','green','linestyle','--');% color brown [R G B]
	plot(x,Veq,'Color','green','linestyle','--','DisplayName',LeyendaB);% con leyenda dinámica
%	legend(LeyendaA,LeyendaB);%  general, sin leyenda dinámica y sin 'DisplayName'; debe comentarse si se utiliza legend('-DynamicLegend');
	legend show;% general, alternativa con 'DisplayName'; debe comentarse si se utiliza legend('-DynamicLegend');
end

