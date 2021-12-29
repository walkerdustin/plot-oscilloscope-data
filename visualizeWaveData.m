clc
clear
close all

% #############  Settings  ##########


%import data with function genereted by matlab
data = importfile('./osziData/scope_23.csv');

%first column is the time data
timeData = table2array(data(:,1));

%offstet the time axis to start at zero
timeData = timeData - timeData(1);

Ch1 = table2array(data(:,2));
Ch2 = table2array(data(:,3));
Ch3 = table2array(data(:,4));
Ch4 = table2array(data(:,5));
Ch5 = table2array(data(:,6));


% #########################   crop the data   ##########################
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Attention: you need
% to comment out the line under xlabel(   to find the right time Value for
% indexing or calculate it back in

start = 0e-9;                   % in seconds (value in timeData)
stop  = 30;                   % in seconds (value in timeData)
[ d1, indexStart ] = min( abs( timeData-start ) ); %finds the index of the value in the array, that is closest to the value
[ d, indexStop ] = min( abs( timeData-stop ) );
timeData = timeData(indexStart:indexStop);
Ch1 = Ch1(indexStart:indexStop);
Ch2 = Ch2(indexStart:indexStop);
Ch3 = Ch3(indexStart:indexStop);
Ch4 = Ch4(indexStart:indexStop);
Ch5 = Ch5(indexStart:indexStop);
timeData = timeData - timeData(1); %offset again to make the time start from 0


% #########################   make the figure   ##########################
figure
hold on % important, to make sure all curves are plotted in same figure


%title('100 kHz');
xlabel('time / ns'); % use xlabel(['time / ', char(181),'s']); for microseconds
timeData = timeData* 1e9; % change this factor according to the unit you chose in the line above

ylabel('Voltage / V');

%get the axes variable (this is kinda wierd, but this is how matlab works)
ax = gca;
ax.FontSize = 30; %setting for font size of axis tiks and labels 


grid on         %setting to show grid (grid on) or not (grid off) 

plot(timeData,Ch1,...
    'LineWidth',2,...
    'LineStyle','-',...
    'Color','#ffdd00');%yellow              %https://de.mathworks.com/help/matlab/ref/plot.html#btzitot-Color

plot(timeData,Ch2,...
    'LineWidth',2,...
    'LineStyle','-',...
    'Color','green' );                      %https://de.mathworks.com/help/matlab/ref/plot.html#btzitot-Color

plot(timeData,Ch3,...
    'LineWidth',2,...
    'LineStyle','-',...
    'Color','blue' );                       %https://de.mathworks.com/help/matlab/ref/plot.html#btzitot-Color

% plot(timeData,Ch4,...
%     'LineWidth',2,...
%     'LineStyle','-',...
%     'Color','magenta' );                    %https://de.mathworks.com/help/matlab/ref/plot.html#btzitot-Color
% 
% plot(timeData,Ch5,...
%     'LineWidth',2,...
%     'LineStyle','-',...
%     'Color','#59d6ff' );%lightBlue          %https://de.mathworks.com/help/matlab/ref/plot.html#btzitot-Color

% ############## extra horizontal lines  ##############
% copy the codeblock and change the y value
% or use yline (since matlab version R2018b) https://de.mathworks.com/help/matlab/ref/yline.html

% y=1.76;
% plot([timeData(1),timeData(end)],[y,y],...
%     'LineWidth',1,...
%     'LineStyle','--',...
%     'Color','black' );
%######
% y=3;
% plot([timeData(1),timeData(end)],[y,y],...
%     'LineWidth',1,...
%     'LineStyle','--',...
%     'Color','black' );
% %######

% ############## extra vertical lines  ##############
% this is harder to do, so i use xline() https://de.mathworks.com/help/matlab/ref/xline.html
% to figure out the right x value, you can run the script and use ur
% mousePointer on the graph, to read the correct value

xline(6.094,...
    'LineWidth',1,...
    'LineStyle','--',...
    'Color','black' );

xline(14.77,...
    'LineWidth',1,...
    'LineStyle','--',...
    'Color','black' );


% ##############
