function [] = configFigure(figHandle, axisHandle, format)
%CONFIGFIGURE Config figure for specific scenarioes
%   figHandle: handle of figure to process
%   axisHandle: handle of axis to process
%   format: scenario of the figure to be used in
%       'IeeeTwoColumn' - two columns figure for IEEE publications
%       'IeeeOneColumn' - single column figure for IEEE publications
%       'Presentation'  - figure to be used in a slide
%       'default'       - merely show figure
    
    if nargin < 3
        format = 'default'; 
    end
    
    figHandle.Units = 'inches';
    
    % Show figure in the left-bottom corner of screen.
    figHandle.Position(1:2) = [0 0];
    
    switch format
        
        case 'IeeeTwoColumn'
            figHandle.Position(3) = 7.16;   % width of two columns figure
            lengthWidthRatio = 3 / 5;       
                
            % IEEE suggest fonts: Times New Roman, Helvetica, Cambira and Arial
            axisHandle.FontName = 'Times New Roman';   
            
            % Font size in figure should be 8-10 pts. 
            axisHandle.FontSize = 8;        
    
        case 'IeeeOneColumn'
            figHandle.Position(3) = 3.5;    % width of one column figure 
            lengthWidthRatio = 3 / 4;
            axisHandle.FontName = 'Times New Roman';   
            axisHandle.FontSize = 8; 
            
        case 'Presentation'
            % Powerpoint default 16:9 slide has size 13.33 * 7.5 inches.
            figHandle.Position(3) = 9;      % figure use in powerpoint
            lengthWidthRatio = 10 / 16;
            
            % Sans-serif fonts are prefered in presentation scenarios.
            axisHandle.FontName = 'Arial';   
            
            % Matlab would scale font in axis area to 1.1 so the actual
            % font size is 16*1.1 = 17.6 pts
            axisHandle.FontSize = 16;       
            
        otherwise
            if ismac      
                figHandle.Position(3) = 20;     % default
            elseif ispc
                figHandle.Position(3) = 15;
            end
            lengthWidthRatio = 9 / 16;

            axisHandle.FontName = 'Arial';   
            axisHandle.FontSize = 16; 
    end
    
    figHandle.Position(4) = lengthWidthRatio * figHandle.Position(3);    
    figHandle.PaperPosition(4) = lengthWidthRatio * figHandle.PaperPosition(3);
    
    % Expand graph to figure area
    axisHandle.Position = axisHandle.OuterPosition - ...
        axisHandle.TightInset * [-1 0 1 0; 0 -1 0 1; 0 0 1 0; 0 0 0 1];
end

