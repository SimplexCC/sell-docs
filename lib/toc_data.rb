require 'nokogiri'

def toc_data(page_content)
  html_doc = Nokogiri::HTML::DocumentFragment.parse(page_content)

  # get a flat list of headers
  headers = []
  html_doc.css('h1, h2').each do |header|

    title = header.children.to_s.gsub(/<[^>]*>/, '')

    if header[:class] == 'toc-seperator'
      headers.push({
        type: 'seperator',
        title: title
      })

    else
      headers.push({
        type: 'header',
        id: header.attribute('id').to_s,
        content: header.children,
        title: title,
        level: header.name[1].to_i,
        children: []
      })
    end

  end

  [2].each do |header_level|
    header_to_nest = nil
    headers = headers.reject do |header|
      if header[:type] == 'seperator'
        false
      elsif header[:level] == header_level
        header_to_nest[:children].push header if header_to_nest
        true
      else
        header_to_nest = header if header[:level] < header_level
        false
      end
    end
  end

  headers
end
