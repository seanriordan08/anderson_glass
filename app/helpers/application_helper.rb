module ApplicationHelper

  def asset_url (asset, size)
    "#{request.protocol}#{request.host_with_port}#{image_path("custom/#{size}/" + asset)}"
  end

  def gather_images(size)
    absolute_url = []
    @images = Picture.all
    @images = @images.map(&:image_file_name).uniq
    @images = @images.map do |i|
      absolute_url << asset_url(i, size)
      asset_path(i)
    end
    @images = @images.combination(1).to_a
    @images = @images.each_with_index.map do |x, i|
      x << {:'data-img-src' => absolute_url.fetch(i)}
    end
  end

  def get_banner_image
    if Picture.where(on_banner: true).exists?
      set_banner_image
      @banner = Picture.where(on_banner: true)
      "custom/banner/#{@banner.map(&:image_file_name).join('')}"
    else
      'custom/banner/new_york.jpeg'
    end
  end

  def set_banner_image
    return unless Picture.all.size == 1

    Picture.first.update_attributes(on_banner: true) if Picture.first.on_banner.blank?
  end


  def content_modified_stamp(content)
    return "Nobody" if content.last_modified_by.blank?

    content.last_modified_by
  end

  def content_time_stamp(content)
    return "Ever" if content.last_modified_date.blank?

    Time.zone.parse("#{content.last_modified_date}").strftime("%b %e, %Y %l:%M:%S %p")
  end

end