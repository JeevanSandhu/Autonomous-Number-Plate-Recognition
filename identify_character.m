function letter=identify_character(image)
load char_templates

image = imresize(image,[42 24]);
comp = [];

for n=1:length(char_templates)
    sem=corr2(char_templates{1,n},image);
    comp=[comp sem];
end

val = find(comp==max(comp));

if val==1 || val==2
    letter='A';
elseif val==3 || val==4
    letter='B';
elseif val==5
    letter='C';
elseif val==6 || val==7
    letter='D';
elseif val==8
    letter='E';
elseif val==9
    letter='F';
elseif val==10
    letter='G';
elseif val==11
    letter='H';
elseif val==12
    letter='I';
elseif val==13
    letter='J';
elseif val==14
    letter='K';
elseif val==15
    letter='L';
elseif val==16
    letter='M';
elseif val==17
    letter='N';
elseif val==18 || val==19
    letter='O';
elseif val==20 || val==21
    letter='P';
elseif val==22 || val==23
    letter='Q';
elseif val==24 || val==25
    letter='R';
elseif val==26
    letter='S';
elseif val==27
    letter='T';
elseif val==28
    letter='U';
elseif val==29
    letter='V';
elseif val==30
    letter='W';
elseif val==31
    letter='X';
elseif val==32
    letter='Y';
elseif val==33
    letter='Z';
elseif val==34
    letter='1';
elseif val==35
    letter='2';
elseif val==36
    letter='3';
elseif val==37 || val==38
    letter='4';
elseif val==39
    letter='5';
elseif val==40 || val==41 || val==42
    letter='6';
elseif val==43
    letter='7';
elseif val==44 || val==45
    letter='8';
elseif val==46 || val==47 || val==48
    letter='9';
elseif val==49 || val==50
    letter='0';
elseif val==51
    letter='I';
elseif val==52
    letter='7';
elseif val==53
    letter='D';
end

end