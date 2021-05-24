%% TS DIAGRAM GENERATION
%put in your temperature values in degrees celcius in the array 't' below
%specific entropy values go in the array 's'

t = [385, 375, 336];
s = [7.5,8,2];

%grab saturation curve data from 'saturation.mat' (add it to the MATLAB
%path)

load('saturation','liquid_temps','vapor_temps','entropyL','entropyV')

%set up plot [insert title on line 23]
plot(entropyL(2:373946),liquid_temps(2:373946),'b','LineWidth',3)
hold on; grid on
plot(entropyV(2:373946),vapor_temps(2:373946),'r','LineWidth',3)
plot(4.4096,373.496,'r*','MarkerSize',10) %Mark Critical Point of Water
xlabel('Specific Entropy (kJ/kg*K)')
format = 'Temperature (%sC)';
deg = char(176);
y_lab = sprintf(format,deg);
ylabel(y_lab)
title('T-S Diagram: [your title here]')

%Plot State Points 1 - n
for i = 1:length(t)
   plot(s(i),t(i),'go','MarkerSize',10,'MarkerFaceColor','g')
end

%Connect State Points 1 - n with Green lines
for i = 1:length(t)
    if i < length(t)
        plot([s(i),s(i+1)],[t(i),t(i+1)],'g','LineWidth',3)
    else
        plot([s(i),s(1)],[t(i),t(1)],'g','LineWidth',3)
    end
end
