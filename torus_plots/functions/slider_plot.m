function slider_plot(image_folder)
close all
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
%// Create GUI controls
%handles.figure = figure('Position',[100 100 500 500],'Units','Pixels');
handles.figure = figure('Position',[500 800 800 800],'Units','Pixels');

image_list = dir(image_folder);
filePattern = fullfile(image_folder, strcat('*.jpg'));
jpegFiles = dir(filePattern);
baseFileName = jpegFiles(1).name;
fullFileName = fullfile(image_folder, baseFileName);
   

length(image_list)


%SLIDER SETTINGS
handles.Slider1 = uicontrol('Style','slider',...
    'Position',[200 25 400 50],...
    'Min',0,'Max',length(image_list),...
    'SliderStep',[0.01 .01],...
    'Callback',@slider_callback);

%addlistener(Slider1,'ActionEvent',@(hObject, event) makeplot(hObject, event,x,hplot));
%TEXT UNDER SLIDER SETTINGS
handles.text = uicontrol('Style','text',...
    'Position',[375 40 60 20],...
    'String','Day','FontSize',15);
guidata(handles.figure,handles); %// Update the handles structure.
a = image(imread(fullFileName));

%CALLBACK FUNCTION TO SLIDER
function slider_callback(~,~) %// This is the slider callback, executed when you release the it or press the arrows at each extremity. 
        handles = guidata(gcf);

        SliderValue = get(handles.Slider1,'Value');
        baseFileName = jpegFiles(floor(SliderValue)).name;
        fullFileName = fullfile(image_folder, baseFileName);
        image(imread(fullFileName));
    end

end

