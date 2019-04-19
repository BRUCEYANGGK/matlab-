mov=VideoReader('marple13.avi');
nframes=mov.NumberOfFrames;
mov1=VideoWriter('test4.avi');
open(mov1);
for i=75:-2:1
    mov=VideoReader('marple13.avi');
    imag=read(mov,i);
    writeVideo(mov1,imag);
end
close(mov1);
