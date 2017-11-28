I = imread('images/image_003.jpg');
% figure, imshow(I);

Igray = rgb2gray(I);
% figure, imshow(Igray);

[rows cols] = size(Igray);
Idilate = Igray;
for i=1:rows
    for j=2:cols-1
        temp = max(Igray(i,j-1), Igray(i,j));
        Idilate(i,j) = max(temp, Igray(i, j+1));
    end
end
% figure, imshow(Idilate);

I = Idilate;

difference = 0;
sum = 0;
total_sum = 0;
difference = uint32(difference);

max_horz = 0;
maximum = 0;
for i = 2:cols
	sum = 0;
	for j = 2:rows
        if(I(j, i) > I(j-1, i))
            difference = uint32(I(j, i) - I(j-1, i));
        else
            difference = uint32(I(j-1, i) - I(j, i));
        end

        if(difference > 20)
            sum = sum + difference;
        end
	end
	horz1(i) = sum;

	% Find Peak Value
	if(sum > maximum)
        max_horz = i;
        maximum = sum;
	end

	total_sum = total_sum + sum;
end
average = total_sum / cols;

% figure, plot(horz1);


sum = 0;
horz = horz1;
for i = 21:(cols-21)
	sum = 0;
	for j = (i-20):(i+20)
        sum = sum + horz1(j);
	end
	horz(i) = sum / 41;
end

% figure, plot(horz);

% Filter out Horizontal Histogram Values by applying Dynamic Threshold
disp('Filter out Horizontal Histogram...');
for i = 1:cols
	if(horz(i) < average)
        horz(i) = 0;
        for j = 1:rows
            I(j, i) = 0;
        end
	end
end

% figure, plot(horz);

% PROCESS EDGES IN VERTICAL DIRECTION
difference = 0;
total_sum = 0;
difference = uint32(difference);

disp('Processing Edges Vertically...');
maximum = 0;
max_vert = 0;
for i = 2:rows
	sum = 0; 
	for j = 2:cols %cols
        if(I(i, j) > I(i, j-1))
            difference = uint32(I(i, j) - I(i, j-1));
        end
        if(I(i, j) <= I(i, j-1))
            difference = uint32(I(i, j-1) - I(i, j));
        end

        if(difference > 20)
            sum = sum + difference;
        end
    end
	vert1(i) = sum;

    %% Find Peak in Vertical Histogram
	if(sum > maximum)
        max_vert = i;
        maximum = sum;
    end
	total_sum = total_sum + sum;
end
average = total_sum / rows;

% figure, plot(vert1);

sum = 0;
vert = vert1;

for i = 21:(rows-21)
	sum = 0;
	for j = (i-20):(i+20)
        sum = sum + vert1(j);
	end
	vert(i) = sum / 41;
end

% figure, plot(vert);

% Filter out Vertical Histogram Values by applying Dynamic Threshold
disp('Filter out Vertical Histogram...');
for i = 1:rows
	if(vert(i) < average)
        vert(i) = 0;
        for j = 1:cols
            I(i, j) = 0;
        end
	end
end 

% figure, plot(vert);


% Find Probable candidates for Number Plate
j = 1;
for i = 2:cols-2
	if(horz(i) ~= 0 && horz(i-1) == 0 && horz(i+1) == 0)
        column(j) = i;
        column(j+1) = i;
        j = j + 2;
	elseif((horz(i) ~= 0 && horz(i-1) == 0) || (horz(i) ~= 0 && horz(i+1) == 0))
        column(j) = i;
        j = j+1;
	end
end

j = 1;
for i = 2:rows-2
	if(vert(i) ~= 0 && vert(i-1) == 0 && vert(i+1) == 0)
        row(j) = i;
        row(j+1) = i; 
        j = j + 2;
	elseif((vert(i) ~= 0 && vert(i-1) == 0) || (vert(i) ~= 0 && vert(i+1) == 0))
    	row(j) = i;
        j = j+1;
	end
end

[temp column_size] = size (column);
if(mod(column_size, 2))
	column(column_size+1) = cols;
end

[temp row_size] = size (row);
if(mod(row_size, 2))
	row(row_size+1) = rows;
end 

% Region of Interest Extraction
% Check each probable candidate
for i = 1:2:row_size
	for j = 1:2:column_size
        % If it is not the most probable region remove it from image
        if(~((max_horz >= column(j) && max_horz <= column(j+1)) && (max_vert >=row(i) && max_vert <= row(i+1))))
            %This loop is only for displaying proper output to User
            for m = row(i):row(i+1)
                for n = column(j):column(j+1)
                    I(m, n) = 0;
                end
            end
        else
            a = column(j)
            b = column(j+1)
            c = row(i)
            d = row(i+1)
        end
    end
end

figure, imshow(I);

asdf = I(c:d, a:b);
figure, imshow(asdf);

[L Ne]=bwlabel(asdf);

q=edge(asdf,'sobel');

% Measure properties of image regions
propied=regionprops(q,'BoundingBox');
% Plot Bounding Box
% for n=1:size(propied,1)
%     rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
% end

qwer = struct2cell(propied);
[n m] = size(propied);
% for i=1:n
%     if qwer{i}(2) < 200
%         qwer{i} = [];
%     end
% end

% qwer = cell2struct(qwer);
% for n=1:size(qwer,1)
%     if isempty(qwer{n})
%         display('yo')
%     else
%         qwer{n}
%         rectangle('Position',qwer{n},'EdgeColor','g','LineWidth',2)
%     end
% end


% Objects extraction
% figure
% for n=1:Ne
%     [r,c] = find(L==n);
%     n1=asdf(min(r):max(r),min(c):max(c));
%     imshow(~n1);
% %     pause(0.5)
% end