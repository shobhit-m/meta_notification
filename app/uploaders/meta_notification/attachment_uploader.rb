# encoding: utf-8

class AttachmentUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model. class AttachmentUploader < CarrierWave::Uploader::Base
    # Include RMagick or MiniMagick support:
    include CarrierWave::RMagick
    # include CarrierWave::MiniMagick

    # Choose what kind of storage to use for this uploader:
    # storage :file
    storage :fog

    # Add an allowlist of extensions which are allowed to be uploaded.
    # For images you might use something like this:
    def extension_allowlist 
      %w(jpg jpeg gif png)
    end

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    include CarrierWave::MimeTypes
    process :set_content_type
    process :store_dimensions

    def store_dimensions
      if file && model
        img = ::Magick::Image::read(file.file).first
        model.width = img.columns
        model.height = img.rows
      end
    end

    # Override the filename of the uploaded files:
    # Avoid using model.id or version_name here, see uploader/store.rb for details.
    def filename
      @name ||= "#{timestamp}-#{super}" if original_filename.present? and super.present?
    end

    def timestamp
      var = :"@#{mounted_as}_timestamp"
      model.instance_variable_get(var) or model.instance_variable_set(var, Time.now.to_i)
    end
    # Provide a default URL as a default if there hasn't been a file uploaded:
    # def default_url(*args)
    #   # For Rails 3.1+ asset pipeline compatibility:
    #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    #
    #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
    # end

    # Process files as they are uploaded:
    # process scale: [200, 300]
    #
    # def scale(width, height)
    #   # do something
    # end

    # Create different versions of your uploaded files:
    version :large do
      process :crop
    end

    def crop
      if model.crop_x.present?
        manipulate! do |img|
          x = model.crop_x.to_i
          y = model.crop_y.to_i
          w = model.crop_w.to_i
          h = model.crop_h.to_i
          img.crop!(x, y, w, h)
        end
      else
        if(model.width.to_i < 255 || model.height.to_i < 194 )
          resize_to_fit(model.width.to_i, model.height.to_i)
        else
          resize_to_fit(255, 194)
        end
      end
    end

    version :grid, from_version: :large do
      process resize_padding: [255, 194]
    end

    version :thumb, from_version: :large do
      process resize_padding: [60, 46]
    end

    def resize_with_pad(width, height, background=:transparent, gravity=::Magick::CenterGravity)
      manipulate! do |img|
        new_img = ::Magick::Image.new(width, height)
        if background == :transparent
          filled = new_img.matte_floodfill(1, 1)
        else
          filled = new_img.color_floodfill(1, 1, ::Magick::Pixel.from_color(background))
        end
        destroy_image(new_img)
        filled.composite!(img, gravity, ::Magick::OverCompositeOp)
        destroy_image(img)
        filled = yield(filled) if block_given?
        filled
      end
    end

    def resize_padding(width, height)
      (model.width.to_i < width && model.height.to_i < height ) ? resize_with_pad(width, height,"#F0F0F0") : resize_and_pad(width, height,"#F0F0F0")
    end

  endclass.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
