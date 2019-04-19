mov=VideoReader('marple13.avi');
nframes=mov.NumberOfFrames;
mov1=VideoWriter('test5.avi');
open(mov1);
for i=1:2:75
    mov=VideoReader('marple13.avi');
    imag=read(mov,i);
    writeVideo(mov1,imag);
end
close(mov1);
