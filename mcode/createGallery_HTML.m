clear; close all; clc; 

fileName='/mnt/data/webSites/ProfilePage/Kevin-Mattheus-Moerman.github.io/Gallery.html';

T(1,1)={'---'};
T(end+1,1)={'layout: page'};
T(end+1,1)={'title: "Gallery of Computation"'};
T(end+1,1)={'description: "A gallery of computation"'};
T(end+1,1)={'header-img: "img/home-bg.jpg"'};
T(end+1,1)={'---'};
T(end+1,1)={' '};
T(end+1,1)={'<br />The images below are licensed under <a rel="Content license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Website content license" style="border-width:0" src="https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg" /></a>'};
T(end+1,1)={'<div class="row" style="padding-bottom: 45px">'};
T(end+1,1)={' '};
T(end+1,1)={'       <div  class=" col-md-4 col-xs-12 full" style=" border-width: 0px; margin-top:35px;">'};
T(end+1,1)={'         <div class="well" style="height:300px; height:relative; background: url(/img/gallery/bunnyMeshMulti.gif); background-size: 100%; background-position:center; background-repeat: no-repeat; margin: 0px;">'};
T(end+1,1)={'           <div style="height:50px; position:relative; top:250px; background:rgba(0,0,0,0.9); color: white; font-size: 16px; text-align: left; margin: -20px -20px -20px -20px">'};
T(end+1,1)={'             <a href="http://gibboncode.org" target="_blank" style="color: white !important"><p style="font-size:1em; position:relative; top:0px; width: 75%; white-space: nowrap; overflow: hidden !important; text-overflow: ellipsis; margin-left:5px">GIBBON</p>'};
T(end+1,1)={'             <i class="fa fa-chevron-right ico" style="font-size: 30px; color: white; position:relative; margin: -44px 5px 0px 0px; float:right"></i></a>'};
T(end+1,1)={'           </div>'};
T(end+1,1)={'         </div>'};
T(end+1,1)={'       </div>'};
T(end+1,1)={' '};
T(end+1,1)={'</div>'};

T_start=T(1:9);
T_pattern=T(10:19);
T_end=T(20);

%%

pathName='/mnt/data/webSites/ProfilePage/Kevin-Mattheus-Moerman.github.io/img/gallery';
pathNameWeb='/img/gallery';
files = dir(fullfile(pathName));
files={files(1:end).name};
files=sort(files(:));
NumberOfFiles=numel(files);

tFilePre='         <div class="well" style="height:300px; height:relative; background: url(';
tFilePost='); background-size: 100%; background-position:center; background-repeat: no-repeat; margin: 0px;">';
tLink1='<a href="https://kevinmoerman.org';
tLink2='" target="_blank" style="color: white !important"><p style="font-size:1em; position:relative; top:0px; width: 75%; white-space: nowrap; overflow: hidden !important; text-overflow: ellipsis; margin-left:5px">';
tLink3='</p>';
T=T_start; 
for q=1:1:NumberOfFiles
    fileNameNow=fullfile(pathName,files{q});    
    if exist(fileNameNow,'file')==2
          fileNameNowWeb=fullfile(pathNameWeb,files{q});    
          T_pattern{3}=[tFilePre,fileNameNowWeb,tFilePost];
          T_pattern{5}=[tLink1,fileNameNowWeb,tLink2,files{q},tLink3];
          T(end+1:end+numel(T_pattern),1)=T_pattern;    
    end
end
T(end+1:end+numel(T_end),1)=T_end;

cell2txtfile(fileName,T,0);
