class AvatarUploader < CarrierWave::Uploader::Base

    include Cloudinary::CarrierWave
    process resize_to_fill: [300,300]

    def extension_white_list
        %w(jpg jpeg gif png)
    end

   version :tiny do
     process resize_to_fill: [20, 20]
   end
 
   version :small do
     process resize_to_fill: [30, 30]
   end
 
   version :profile do
     process resize_to_fill: [45, 45]
   end

end
