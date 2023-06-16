function data = readTiff(filename)
    
    info = imfinfo(filename);
    disp(info)
    if strcmp(info.format, 'Tiff') || strcmp(info.format, 'Tif')
        tstack = Tiff(filename);
        im = tstack.read();
        [I,J] = size(im);
        K = length(imfinfo(filename));
        stackSize = [I J K];
        data = zeros(stackSize,'like',im);
        data(:,:,1)  = tstack.read();
        for n = 2:K
            tstack.nextDirectory()
            data(:,:,n) = tstack.read();
        end
    else
        temp_img = imread(img_name);
        image = zeros(size(temp_img,1),size(temp_img,2),size(temp_img,3),size(img_info,1));
        tmp_img = squeeze(image);
        for ii = 1 : size(tiff_info, 1)
            
            image(:,:,ii) = imread(img_name,ii);
                
        end
    end
end