%% Conways Game of Life %%
close all
clear;
clc;

% bool to switch between fields
alternating = true; 

% create and initialize playfield randomly
fig = figure();
fieldSize = 100;
playField = randi([0 1], fieldSize);
playField(:,:,2) = playField;
pcolor(playField(:,:,alternating))
drawnow;
set(gca,'YTickLabel',[],'XTickLabel',[]);
colormap(flipud(gray(2)))
axis square  
hold on

% create and initialize playfield manually (uncomment for use)
% fig = figure();
% fieldSize = 100;
% playField = zeros(fieldSize);
% playField(:,:,2) = zeros(fieldSize);
% playField(10,10,:) = 1;
% playField(10,11,:) = 1;
% playField(10,12,:) = 1;
% playField(11,12,:) = 1;
% playField(9,11,:)  = 1;
% playField(20,20,:) = 1;
% playField(20,21,:) = 1;
% playField(20,22,:) = 1;
% playField(21,22,:) = 1;
% playField(19,21,:) = 1;
% playField(70,70,:) = 1;
% playField(70,71,:) = 1;
% playField(70,72,:) = 1;
% playField(71,72,:) = 1;
% playField(69,71,:) = 1;
% pcolor(playField(:,:,alternating))
% drawnow;
% set(gca,'YTickLabel',[],'XTickLabel',[]);
% colormap(flipud(gray(2)))
% axis square 
% hold on

% stop button
btn = uicontrol('Parent', fig, 'Style', 'togglebutton', 'String', 'Stop', 'Value', 0);

%% let there be light!

% while there is any life (or no user interruption...)
while any(playField(:,:,alternating + 1), 'all')
    
    % run through (periodic) field (without corners and boundaries)
    for i = 2:fieldSize - 1
        for j = 2:fieldSize - 1
            
            % define neighbors
            neighNN = playField(i, j + 1, alternating + 1);
            neighNE = playField(i + 1, j + 1, alternating + 1);
            neighEE = playField(i + 1, j, alternating + 1);
            neighSE = playField(i + 1, j - 1, alternating + 1);
            neighSS = playField(i, j - 1, alternating + 1);
            neighSW = playField(i - 1, j - 1, alternating + 1);
            neighWW = playField(i - 1, j, alternating + 1);
            neighNW = playField(i - 1, j + 1, alternating + 1);
            neighArr = [neighNN neighNE neighEE neighSE neighSS neighSW neighWW neighNW];
            neighNz = nnz(neighArr);
            
            if ((playField(i, j, alternating + 1) == 0) && (neighNz == 3))
                playField(i, j, ~alternating + 1) = 1;

            elseif ((playField(i, j, alternating + 1) == 1) && ((neighNz < 2) || (neighNz > 3)))
                playField(i, j, ~alternating + 1) = 0;

            else
            end
        end
    end
    
    % west boundary
    i = 1;
    for j = 2:fieldSize - 1
        
        % define neighbors
        neighNN = playField(i, j + 1, alternating + 1);
        neighNE = playField(i + 1, j + 1, alternating + 1);
        neighEE = playField(i + 1, j, alternating + 1);
        neighSE = playField(i + 1, j - 1, alternating + 1);
        neighSS = playField(i, j - 1, alternating + 1);
        neighSW = playField(fieldSize, j - 1, alternating + 1);
        neighWW = playField(fieldSize, j, alternating + 1);
        neighNW = playField(fieldSize, j + 1, alternating + 1);
        neighArr = [neighNN neighNE neighEE neighSE neighSS neighSW neighWW neighNW];
        neighNz = nnz(neighArr);
            
        if ((playField(i, j, alternating + 1) == 0) && (neighNz == 3))
            playField(i, j, ~alternating + 1) = 1;
                
        elseif ((playField(i, j, alternating + 1) == 1) && ((neighNz < 2) || (neighNz > 3)))
            playField(i, j, ~alternating + 1) = 0;
               
        else
        end
    end
    
    % east boundary
    i = fieldSize;
    for j = 2:fieldSize - 1
        
        % define neighbors
        neighNN = playField(i, j + 1, alternating + 1);
        neighNE = playField(1, j + 1, alternating + 1);
        neighEE = playField(1, j, alternating + 1);
        neighSE = playField(1, j - 1, alternating + 1);
        neighSS = playField(i, j - 1, alternating + 1);
        neighSW = playField(i - 1, j - 1, alternating + 1);
        neighWW = playField(i - 1, j, alternating + 1);
        neighNW = playField(i - 1, j + 1, alternating + 1);
        neighArr = [neighNN neighNE neighEE neighSE neighSS neighSW neighWW neighNW];
        neighNz = nnz(neighArr);
            
        if ((playField(i, j, alternating + 1) == 0) && (neighNz == 3))
            playField(i, j, ~alternating + 1) = 1;
                
        elseif ((playField(i, j, alternating + 1) == 1) && ((neighNz < 2) || (neighNz > 3)))
            playField(i, j, ~alternating + 1) = 0;
                
        else
        end
    end
    
    % north boundary
    j = fieldSize;
    for i = 2:fieldSize - 1
        
        % define neighbors
        neighNN = playField(i, 1, alternating + 1);
        neighNE = playField(i + 1, 1, alternating + 1);
        neighEE = playField(i + 1, j, alternating + 1);
        neighSE = playField(i + 1, j - 1, alternating + 1);
        neighSS = playField(i, j - 1, alternating + 1);
        neighSW = playField(i - 1, j - 1, alternating + 1);
        neighWW = playField(i - 1, j, alternating + 1);
        neighNW = playField(i - 1, 1, alternating + 1);
        neighArr = [neighNN neighNE neighEE neighSE neighSS neighSW neighWW neighNW];
        neighNz = nnz(neighArr);
            
        if ((playField(i, j, alternating + 1) == 0) && (neighNz == 3))
            playField(i, j, ~alternating + 1) = 1;
                
        elseif ((playField(i, j, alternating + 1) == 1) && ((neighNz < 2) || (neighNz > 3)))
            playField(i, j, ~alternating + 1) = 0;
                
        else
        end
    end
    
    % south boundary
    j = 1;
    for i = 2:fieldSize - 1
        
        % define neighbors
        neighNN = playField(i, j + 1, alternating + 1);
        neighNE = playField(i + 1, j + 1, alternating + 1);
        neighEE = playField(i + 1, j, alternating + 1);
        neighSE = playField(i + 1, fieldSize, alternating + 1);
        neighSS = playField(i, fieldSize, alternating + 1);
        neighSW = playField(i - 1, fieldSize, alternating + 1);
        neighWW = playField(i - 1, j, alternating + 1);
        neighNW = playField(i - 1, j + 1, alternating + 1);
        neighArr = [neighNN neighNE neighEE neighSE neighSS neighSW neighWW neighNW];
        neighNz = nnz(neighArr);
            
        if ((playField(i, j, alternating + 1) == 0) && (neighNz == 3))
            playField(i, j, ~alternating + 1) = 1;
                
        elseif ((playField(i, j, alternating + 1) == 1) && ((neighNz < 2) || (neighNz > 3)))
            playField(i, j, ~alternating + 1) = 0;
                
        else
        end
    end
    
    % north east corner
    i = fieldSize;
    j = fieldSize;
        
    % define neighbors
    neighNN = playField(i, 1, alternating + 1);
    neighNE = playField(1, 1, alternating + 1);
    neighEE = playField(1, j, alternating + 1);
    neighSE = playField(1, j - 1, alternating + 1);
    neighSS = playField(i, j - 1, alternating + 1);
    neighSW = playField(i - 1, j - 1, alternating + 1);
    neighWW = playField(i - 1, j, alternating + 1);
    neighNW = playField(i - 1, 1, alternating + 1);
    neighArr = [neighNN neighNE neighEE neighSE neighSS neighSW neighWW neighNW];
    neighNz = nnz(neighArr);
            
    if ((playField(i, j, alternating + 1) == 0) && (neighNz == 3))
        playField(i, j, ~alternating + 1) = 1;
                
    elseif ((playField(i, j, alternating + 1) == 1) && ((neighNz < 2) || (neighNz > 3)))
        playField(i, j, ~alternating + 1) = 0;
                
    else
    end
    
    % south east corner
    i = fieldSize;
    j = 1;
        
    % define neighbors
    neighNN = playField(i, j + 1, alternating + 1);
    neighNE = playField(1, j + 1, alternating + 1);
    neighEE = playField(1, j, alternating + 1);
    neighSE = playField(1, fieldSize, alternating + 1);
    neighSS = playField(i, fieldSize, alternating + 1);
    neighSW = playField(i - 1, fieldSize, alternating + 1);
    neighWW = playField(i - 1, j, alternating + 1);
    neighNW = playField(i - 1, j + 1, alternating + 1);
    neighArr = [neighNN neighNE neighEE neighSE neighSS neighSW neighWW neighNW];
    neighNz = nnz(neighArr);
            
    if ((playField(i, j, alternating + 1) == 0) && (neighNz == 3))
        playField(i, j, ~alternating + 1) = 1;
                
    elseif ((playField(i, j, alternating + 1) == 1) && ((neighNz < 2) || (neighNz > 3)))
        playField(i, j, ~alternating + 1) = 0;
                
    else
    end
    
    % south west corner
    i = 1;
    j = 1;
        
    % define neighbors
    neighNN = playField(i, j + 1, alternating + 1);
    neighNE = playField(i + 1, j + 1, alternating + 1);
    neighEE = playField(i + 1, j, alternating + 1);
    neighSE = playField(i + 1, fieldSize, alternating + 1);
    neighSS = playField(i, fieldSize, alternating + 1);
    neighSW = playField(fieldSize, fieldSize, alternating + 1);
    neighWW = playField(fieldSize, j, alternating + 1);
    neighNW = playField(fieldSize, j + 1, alternating + 1);
    neighArr = [neighNN neighNE neighEE neighSE neighSS neighSW neighWW neighNW];
    neighNz = nnz(neighArr);
            
    if ((playField(i, j, alternating + 1) == 0) && (neighNz == 3))
        playField(i, j, ~alternating + 1) = 1;
                
    elseif ((playField(i, j, alternating + 1) == 1) && ((neighNz < 2) || (neighNz > 3)))
        playField(i, j, ~alternating + 1) = 0;
                       
    else
    end
    
    % north west corner
    i = 1;
    j = fieldSize;
        
    % define neighbors
    neighNN = playField(i, 1, alternating + 1);
    neighNE = playField(i + 1, 1, alternating + 1);
    neighEE = playField(i + 1, j, alternating + 1);
    neighSE = playField(i + 1, fieldSize - 1, alternating + 1);
    neighSS = playField(i, fieldSize - 1, alternating + 1);
    neighSW = playField(fieldSize, fieldSize - 1, alternating + 1);
    neighWW = playField(fieldSize, j, alternating + 1);
    neighNW = playField(fieldSize, 1, alternating + 1);
    neighArr = [neighNN neighNE neighEE neighSE neighSS neighSW neighWW neighNW];
    neighNz = nnz(neighArr);
            
    if ((playField(i, j, alternating + 1) == 0) && (neighNz == 3))
        playField(i, j, ~alternating + 1) = 1;
                
    elseif ((playField(i, j, alternating + 1) == 1) && ((neighNz < 2) || (neighNz > 3)))
        playField(i, j, ~alternating + 1) = 0;
                
    else
    end 
    
    % slow down a bit
    pause(0.05)

    % update
    pcolor(playField(:,:,~alternating + 1))
    drawnow;   
    playField(:,:,alternating + 1) = playField(:,:,~alternating + 1);
    
    % switch field
    alternating = ~alternating;

    % user interruption?
    if get(btn, 'Value')
        disp('Game of Life stopped by user!')
        break
    end
end
return