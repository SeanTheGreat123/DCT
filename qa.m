clear all
close all
xyz_source=load('node.dat');%loads node xyz coord

v_source0=load('bfi_org.dat'); %loads intensity values
v_source1=load('bfi_1_f.dat'); %loads intensity values
v_source2=load('bfi_2_f.dat'); %loads intensity values
v_source3=load('bfi_3_f.dat'); %loads intensity values
v_source4=load('bfi_4_f.dat'); %loads intensity values
v_source5=load('bfi_5_f.dat'); %loads intensity values
v_source6=load('bfi_6_f.dat'); %loads intensity values
v_source7=load('bfi_7_f.dat'); %loads intensity values
v_source8=load('bfi_8_f.dat'); %loads intensity values
v_source9=load('bfi_9_f.dat'); %loads intensity values
v_source10=load('bfi_10_f.dat'); %loads intensity values



x = xyz_source(:,2); %getting data of y positions
y = xyz_source(:,3); %getting data of y positions
z = xyz_source(:,4); %getting data of z positions

v0 = v_source0(:,2);%getting intensity values
v1 = v_source1(:,2);%getting intensity values
v2 = v_source2(:,2);%getting intensity values
v3 = v_source3(:,2);%getting intensity values
v4 = v_source4(:,2);%getting intensity values
v5 = v_source5(:,2);%getting intensity values
v6 = v_source6(:,2);%getting intensity values
v7 = v_source7(:,2);%getting intensity values
v8 = v_source8(:,2);%getting intensity values
v9 = v_source9(:,2);%getting intensity values
v10 = v_source10(:,2);%getting intensity values

max0 = max(v0);
max1 = max(v1);
max2 = max(v2);
max3 = max(v3);
max4 = max(v4);
max5 = max(v5);
max6 = max(v6);
max7 = max(v7);
max8 = max(v8);
max9 = max(v9);
max10 = max(v10);

[xq,yq,zq] = meshgrid(-10:.1:10,-10:.1:10,0:.1:10); %makes new grid 
vq0 = griddata(x,y,z,v0,xq,yq,zq); %new interpolated data now on grid
vq1 = griddata(x,y,z,v1,xq,yq,zq); %new interpolated data now on grid
vq2 = griddata(x,y,z,v2,xq,yq,zq); %new interpolated data now on grid
vq3 = griddata(x,y,z,v3,xq,yq,zq); %new interpolated data now on grid
vq4 = griddata(x,y,z,v4,xq,yq,zq); %new interpolated data now on grid
vq5 = griddata(x,y,z,v5,xq,yq,zq); %new interpolated data now on grid
vq6 = griddata(x,y,z,v6,xq,yq,zq); %new interpolated data now on grid
vq7 = griddata(x,y,z,v7,xq,yq,zq); %new interpolated data now on grid
vq8 = griddata(x,y,z,v8,xq,yq,zq); %new interpolated data now on grid
vq9 = griddata(x,y,z,v9,xq,yq,zq); %new interpolated data now on grid
vq10 = griddata(x,y,z,v10,xq,yq,zq); %new interpolated data now on grid


 xyslice=vq0(:,:,51);%This is accessing the values across z,  51 i
for i=1:101 %going across z axis
    yzslice(i,:)=vq0(:,101,i);%This is accessing the values across y,  101 is middle
     xzslice(i,:)=vq0(101,:,i);%This is accessing the values across x,  101 is middle -- xz wor
    
%idirection=vq(:,:,51);%This is accessing the values across x, 101 is middle
end

%to halfway up Z total.(0 to 10 %by .1 means 101 total z points. )
figure(11);
imagesc(-10:.1:10,10:-.1:0,xzslice); %to show the slice to be analyzed
%line([-10,10], [4,4], 'Color', 'r', 'LineWidth',2.0);
title('BFI Actual');
xlabel('Y axis ');
ylabel('Z axis ');
hold on;
colorbar;
caxis([0.00000001 max0]);
colormap jet;
%caxis([0.01 0.03]);
grid on;
hold on;
axis equal;
%truesize([50 100]);
ylim([0 10]); %limits range of y
line([-2.33,-2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([2.33,2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [5,5], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [7,7], 'Color', 'b', 'LineWidth',2.0);



% 
% v1=vq(:,:,61);%This is accessing the values across z,  51 is setting it
% %to halfway up Z total.(0 to 10 %by .1 means 101 total z points. )
% 
% v2=v1(121,:); %taking all the data from y = 101 so taking x data. 
% %%101 is origin of y if range is 200) (center path)
% %v3 = v1(101,:);%utilize this for accessing y data
% 
% figure(1);
% %imagesc(v1);
% plot(-10:.1:10,v2,'color','r'); %plots the QA
% title(' Absorption Coefficient (1/mm) vs Y axis for Center Target at 4mm Depth');
% xlabel('Y axis (mm)');
% ylabel(' Absorption Coefficient (1/mm) ');
% hold on;
% ylim([-.01 .035]); %limits range of y
% grid on;
% hold on
% grid(gca,'minor')
% line([-2,2],[.03,.03]);
% line([2,2],[0.01,.03]);
% line([-2,-2],[0.01,.03]);
% line([-10,-2],[.01,.01]);
% line([2,10],[.01,.01]);
% legend('Measured Intensity','Actual Intensity');
%  
%  
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%This makes the curve for the actual intensity%%%%
 %orig_source=load('ua_org.dat'); %loading actual values 
 %vq_orig = griddata(x,y,z,orig_source,xq,yq,zq); 
 %new interpolated data now on grid
% 
%  vfinal=vq_orig(:,:,01); 
%  %getting value for 0 on z axis (must go halfway to total + 1 for half)
% 
%  vfinal1=vfinal(:,101); %getting value for x at y 101 (which is 0)
%  
% %plot(-14:.1:14,vfinal1); %plots the QA
% 
% doc grid
% grid(gca,'minor')
% line([-2,2],[.03,.03]);
% line([2,2],[0.01,.03]);
% line([-2,-2],[0.01,.03]);
% 
% line([-10,-2],[.01,.01]);
% 
% line([2,10],[.01,.01]);
% 
%  legend('Measured Intensity','Actual Intensity');
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 xyslice=vq1(:,:,51);%This is accessing the values across z,  51 i
for i=1:101 %going across z axis
    yzslice(i,:)=vq1(:,101,i);%This is accessing the values across y,  101 is middle
     xzslice(i,:)=vq1(101,:,i);%This is accessing the values across x,  101 is middle -- xz wor
    
%idirection=vq(:,:,51);%This is accessing the values across x, 101 is middle
end

%to halfway up Z total.(0 to 10 %by .1 means 101 total z points. )
figure(1);
imagesc(-10:.1:10,10:-.1:0,xzslice); %to show the slice to be analyzed
%line([-10,10], [4,4], 'Color', 'r', 'LineWidth',2.0);
title('BFI iteration 1 (Filter ran 3 times)');
xlabel('Y axis ');
ylabel('Z axis ');
hold on;
colorbar;
caxis([0.00000001 max1]);
colormap jet;
%caxis([0.01 0.03]);
grid on;
hold on;
axis equal;
%truesize([50 100]);
ylim([0 10]); %limits range of y
line([-2.33,-2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([2.33,2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [5,5], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [7,7], 'Color', 'b', 'LineWidth',2.0);



% 


 xyslice=vq2(:,:,51);%This is accessing the values across z,  51 i
for i=1:101 %going across z axis
    yzslice(i,:)=vq2(:,101,i);%This is accessing the values across y,  101 is middle
     xzslice(i,:)=vq2(101,:,i);%This is accessing the values across x,  101 is middle -- xz wor
    
%idirection=vq(:,:,51);%This is accessing the values across x, 101 is middle
end

%to halfway up Z total.(0 to 10 %by .1 means 101 total z points. )
figure(2);
imagesc(-10:.1:10,10:-.1:0,xzslice); %to show the slice to be analyzed
%line([-10,10], [4,4], 'Color', 'r', 'LineWidth',2.0);
title('BFI iteration 2 (Filter ran 3 times)');
xlabel('Y axis ');
ylabel('Z axis ');
hold on;
colorbar;
caxis([0 max2]);
colormap jet;
%caxis([0.01 0.03]);
grid on;
hold on;
axis equal;
%truesize([50 100]);
ylim([0.00000001 10]); %limits range of y
line([-2.33,-2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([2.33,2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [5,5], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [7,7], 'Color', 'b', 'LineWidth',2.0);





 xyslice=vq3(:,:,51);%This is accessing the values across z,  51 i
for i=1:101 %going across z axis
    yzslice(i,:)=vq3(:,101,i);%This is accessing the values across y,  101 is middle
     xzslice(i,:)=vq3(101,:,i);%This is accessing the values across x,  101 is middle -- xz wor
    
%idirection=vq(:,:,51);%This is accessing the values across x, 101 is middle
end

%to halfway up Z total.(0 to 10 %by .1 means 101 total z points. )
figure(3);
imagesc(-10:.1:10,10:-.1:0,xzslice); %to show the slice to be analyzed
%line([-10,10], [4,4], 'Color', 'r', 'LineWidth',2.0);
title('BFI iteration 3 (Filter ran 3 times)');
xlabel('Y axis ');
ylabel('Z axis ');
hold on;
colorbar;
caxis([0.00000001 max3]);
colormap jet;
%caxis([0.01 0.03]);
grid on;
hold on;
axis equal;
%truesize([50 100]);
ylim([0 10]); %limits range of y
line([-2.33,-2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([2.33,2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [5,5], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [7,7], 'Color', 'b', 'LineWidth',2.0);



 xyslice=vq4(:,:,51);%This is accessing the values across z,  51 i
for i=1:101 %going across z axis
    yzslice(i,:)=vq4(:,101,i);%This is accessing the values across y,  101 is middle
     xzslice(i,:)=vq4(101,:,i);%This is accessing the values across x,  101 is middle -- xz wor
    
%idirection=vq(:,:,51);%This is accessing the values across x, 101 is middle
end

%to halfway up Z total.(0 to 10 %by .1 means 101 total z points. )
figure(4);
imagesc(-10:.1:10,10:-.1:0,xzslice); %to show the slice to be analyzed
%line([-10,10], [4,4], 'Color', 'r', 'LineWidth',2.0);
title('BFI iteration 4 (Filter ran 3 times)');
xlabel('Y axis ');
ylabel('Z axis ');
hold on;
colorbar;
caxis([0.00000001 max4]);
colormap jet;
%caxis([0.01 0.03]);
grid on;
hold on;
axis equal;
%truesize([50 100]);
ylim([0 10]); %limits range of y
line([-2.33,-2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([2.33,2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [5,5], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [7,7], 'Color', 'b', 'LineWidth',2.0);





%%%

 xyslice=vq5(:,:,51);%This is accessing the values across z,  51 i
for i=1:101 %going across z axis
    yzslice(i,:)=vq5(:,101,i);%This is accessing the values across y,  101 is middle
     xzslice(i,:)=vq5(101,:,i);%This is accessing the values across x,  101 is middle -- xz wor
    
%idirection=vq(:,:,51);%This is accessing the values across x, 101 is middle
end

%to halfway up Z total.(0 to 10 %by .1 means 101 total z points. )
figure(5);
imagesc(-10:.1:10,10:-.1:0,xzslice); %to show the slice to be analyzed
%line([-10,10], [4,4], 'Color', 'r', 'LineWidth',2.0);
title('BFI iteration 5 (Filter ran 3 times)');
xlabel('Y axis ');
ylabel('Z axis ');
hold on;
colorbar;
caxis([0.00000001 max5]);
colormap jet;
%caxis([0.01 0.03]);
grid on;
hold on;
axis equal;
%truesize([50 100]);
ylim([0 10]); %limits range of y
line([-2.33,-2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([2.33,2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [5,5], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [7,7], 'Color', 'b', 'LineWidth',2.0);


 xyslice=vq6(:,:,51);%This is accessing the values across z,  51 i
for i=1:101 %going across z axis
    yzslice(i,:)=vq6(:,101,i);%This is accessing the values across y,  101 is middle
     xzslice(i,:)=vq6(101,:,i);%This is accessing the values across x,  101 is middle -- xz wor
    
%idirection=vq(:,:,51);%This is accessing the values across x, 101 is middle
end

%to halfway up Z total.(0 to 10 %by .1 means 101 total z points. )
figure(6);
imagesc(-10:.1:10,10:-.1:0,xzslice); %to show the slice to be analyzed
%line([-10,10], [4,4], 'Color', 'r', 'LineWidth',2.0);
title('BFI iteration 6 (Filter ran 3 times)');
xlabel('Y axis ');
ylabel('Z axis ');
hold on;
colorbar;
caxis([0.00000001 max6]);
colormap jet;
%caxis([0.01 0.03]);
grid on;
hold on;
axis equal;
%truesize([50 100]);
ylim([0 10]); %limits range of y
line([-2.33,-2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([2.33,2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [5,5], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [7,7], 'Color', 'b', 'LineWidth',2.0);


 xyslice=vq7(:,:,51);%This is accessing the values across z,  51 i
for i=1:101 %going across z axis
    yzslice(i,:)=vq7(:,101,i);%This is accessing the values across y,  101 is middle
     xzslice(i,:)=vq7(101,:,i);%This is accessing the values across x,  101 is middle -- xz wor
    
%idirection=vq(:,:,51);%This is accessing the values across x, 101 is middle
end

%to halfway up Z total.(0 to 10 %by .1 means 101 total z points. )
figure(7);
imagesc(-10:.1:10,10:-.1:0,xzslice); %to show the slice to be analyzed
%line([-10,10], [4,4], 'Color', 'r', 'LineWidth',2.0);
title('BFI iteration 7 (Filter ran 3 times)');
xlabel('Y axis ');
ylabel('Z axis ');
hold on;
colorbar;
caxis([0.00000001 max7]);
colormap jet;
%caxis([0.01 0.03]);
grid on;
hold on;
axis equal;
%truesize([50 100]);
ylim([0 10]); %limits range of y
line([-2.33,-2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([2.33,2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [5,5], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [7,7], 'Color', 'b', 'LineWidth',2.0);

% 
% figure(3);
% 
% g1=vq(121,:,:);%This is accessing the values across z,  51 is setting it
% %to halfway up Z total.(0 to 10 %by .1 means 101 total z points. )
% vg = vq;
% 
% v = vg(:, 1); %swap x
% vg(:, 1) = vg(:, 3);
% vg(:, 3) = v;
% 
% 
% v2 = vg(:, 2);
% vg(:, 2) = vg(:, 3);
% vg(:, 3) = v;
% 
% g2=v(:,101); %taking all the data from y = 101 so taking x data. 
% %%101 is origin of y if range is 200) (center path)
% %v3 = v1(101,:);%utilize this for accessing y data
% 
% plot(10:-.1:0,g2); %plots the QA
% title('Intensity vs x axis');
% xlabel('x axis (mm)');
% ylabel('Intensity');
% hold on;
% %ylim([0 .06]); %limits range of y
% grid on;
% hold on
% 
% grid(gca,'minor')
% line([3,5],[.03,.03]);
% line([3,3],[0.01,.03]);
% line([5,5],[0.01,.03]);
% line([0,3],[.01,.01]);
% line([5,10],[.01,.01]);
%  legend('Measured Intensity','Actual Intensity');




 xyslice=vq8(:,:,51);%This is accessing the values across z,  51 i
for i=1:101 %going across z axis
    yzslice(i,:)=vq8(:,101,i);%This is accessing the values across y,  101 is middle
     xzslice(i,:)=vq8(101,:,i);%This is accessing the values across x,  101 is middle -- xz wor
    
%idirection=vq(:,:,51);%This is accessing the values across x, 101 is middle
end

%to halfway up Z total.(0 to 10 %by .1 means 101 total z points. )
figure(8);
imagesc(-10:.1:10,10:-.1:0,xzslice); %to show the slice to be analyzed
%line([-10,10], [4,4], 'Color', 'r', 'LineWidth',2.0);
title('BFI iteration 8 (Filter ran 3 times)');
xlabel('Y axis ');
ylabel('Z axis ');
hold on;
colorbar;
caxis([0.00000001 max8]);
colormap jet;
%caxis([0.01 0.03]);
grid on;
hold on;
axis equal;
%truesize([50 100]);
ylim([0 10]); %limits range of y
line([-2.33,-2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([2.33,2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [5,5], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [7,7], 'Color', 'b', 'LineWidth',2.0);


 xyslice=vq9(:,:,51);%This is accessing the values across z,  51 i
for i=1:101 %going across z axis
    yzslice(i,:)=vq9(:,101,i);%This is accessing the values across y,  101 is middle
     xzslice(i,:)=vq9(101,:,i);%This is accessing the values across x,  101 is middle -- xz wor
    
%idirection=vq(:,:,51);%This is accessing the values across x, 101 is middle
end

%to halfway up Z total.(0 to 10 %by .1 means 101 total z points. )
figure(9);
imagesc(-10:.1:10,10:-.1:0,xzslice); %to show the slice to be analyzed
%line([-10,10], [4,4], 'Color', 'r', 'LineWidth',2.0);
title('BFI iteration 9 (Filter ran 3 times)');
xlabel('Y axis ');
ylabel('Z axis ');
hold on;
colorbar;
caxis([0.00000001 max9]);
colormap jet;
%caxis([0.01 0.03]);
grid on;
hold on;
axis equal;
%truesize([50 100]);
ylim([0 10]); %limits range of y
line([-2.33,-2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([2.33,2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [5,5], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [7,7], 'Color', 'b', 'LineWidth',2.0);
 xyslice=vq10(:,:,51);%This is accessing the values across z,  51 i
for i=1:101 %going across z axis
    yzslice(i,:)=vq10(:,101,i);%This is accessing the values across y,  101 is middle
     xzslice(i,:)=vq10(101,:,i);%This is accessing the values across x,  101 is middle -- xz wor
    
%idirection=vq(:,:,51);%This is accessing the values across x, 101 is middle
end

%to halfway up Z total.(0 to 10 %by .1 means 101 total z points. )
figure(10);
imagesc(-10:.1:10,10:-.1:0,xzslice); %to show the slice to be analyzed
%line([-10,10], [4,4], 'Color', 'r', 'LineWidth',2.0);
title('BFI iteration 10 (Filter ran 3 times)');
xlabel('Y axis ');
ylabel('Z axis ');
hold on;
colorbar;
caxis([0.00000001 max10]);
colormap jet;
%caxis([0.01 0.03]);
grid on;
hold on;
axis equal;
%truesize([50 100]);
ylim([0 10]); %limits range of y
line([-2.33,-2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([2.33,2.33], [5,7], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [5,5], 'Color', 'b', 'LineWidth',2.0);

line([-2.33,2.33], [7,7], 'Color', 'b', 'LineWidth',2.0);
