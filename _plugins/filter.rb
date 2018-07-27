
module Jekyll
  module TagFilter
    def asset_url(input)
      "#Jekyll:Page.url/#{input}"
    end
  end
end

Liquid::Template.register_filter(Jekyll::TagFilter)
