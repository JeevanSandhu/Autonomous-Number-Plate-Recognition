A=imread('character_image_dataset/A.bmp');
B=imread('character_image_dataset/B.bmp');
C=imread('character_image_dataset/C.bmp');
D=imread('character_image_dataset/D.bmp');
D_2=imread('character_image_dataset/D_2.bmp');
E=imread('character_image_dataset/E.bmp');
F=imread('character_image_dataset/F.bmp');
G=imread('character_image_dataset/G.bmp');
H=imread('character_image_dataset/H.bmp');
I=imread('character_image_dataset/I.bmp');
I_2=imread('character_image_dataset/I_2.bmp');
J=imread('character_image_dataset/J.bmp');
K=imread('character_image_dataset/K.bmp');
L=imread('character_image_dataset/L.bmp');
M=imread('character_image_dataset/M.bmp');
N=imread('character_image_dataset/N.bmp');
O=imread('character_image_dataset/O.bmp');
P=imread('character_image_dataset/P.bmp');
Q=imread('character_image_dataset/Q.bmp');
R=imread('character_image_dataset/R.bmp');
S=imread('character_image_dataset/S.bmp');
T=imread('character_image_dataset/T.bmp');
U=imread('character_image_dataset/U.bmp');
V=imread('character_image_dataset/V.bmp');
W=imread('character_image_dataset/W.bmp');
X=imread('character_image_dataset/X.bmp');
Y=imread('character_image_dataset/Y.bmp');
Z=imread('character_image_dataset/Z.bmp');

Afill=imread('character_image_dataset/fillA.bmp');
Bfill=imread('character_image_dataset/fillB.bmp');
Dfill=imread('character_image_dataset/fillD.bmp');
Ofill=imread('character_image_dataset/fillO.bmp');
Pfill=imread('character_image_dataset/fillP.bmp');
Qfill=imread('character_image_dataset/fillQ.bmp');
Rfill=imread('character_image_dataset/fillR.bmp');

one=imread('character_image_dataset/1.bmp');  
two=imread('character_image_dataset/2.bmp');
three=imread('character_image_dataset/3.bmp');
four=imread('character_image_dataset/4.bmp');
five=imread('character_image_dataset/5.bmp'); 
six=imread('character_image_dataset/6.bmp');
seven=imread('character_image_dataset/7.bmp');
seven_2=imread('character_image_dataset/7_2.bmp');
seven_2=rgb2gray(seven_2);
eight=imread('character_image_dataset/8.bmp');
nine=imread('character_image_dataset/9.bmp'); 
zero=imread('character_image_dataset/0.bmp');

zerofill=imread('character_image_dataset/fill0.bmp');
fourfill=imread('character_image_dataset/fill4.bmp');
sixfill=imread('character_image_dataset/fill6.bmp');
sixfill2=imread('character_image_dataset/fill6_2.bmp');
eightfill=imread('character_image_dataset/fill8.bmp');
ninefill=imread('character_image_dataset/fill9.bmp');
ninefill2=imread('character_image_dataset/fill9_2.bmp');

letter=[A Afill B Bfill C D Dfill E F G H I J K L M...
    N O Ofill P Pfill Q Qfill R Rfill S T U V W X Y Z];

number=[one two three four fourfill five...
    six sixfill sixfill2 seven eight eightfill nine ninefill ninefill2 zero zerofill];

character=[letter number I_2 seven_2 D_2];

char_templates=mat2cell(character,42,[24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24]);

save ('char_templates', 'char_templates')
clear all