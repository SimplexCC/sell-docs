module Multilang
  def block_code(code, full_lang_name)
    if full_lang_name
      parts = full_lang_name.split('--')
      short_lang_name = (parts) ? parts[0] : ""
      super(code, short_lang_name).sub("highlight language-#{short_lang_name}") do |match|
        match + " tab-" + full_lang_name
      end
    else
      super(code, full_lang_name)
    end
  end
end

require 'middleman-core/renderers/redcarpet'
Middleman::Renderers::MiddlemanRedcarpetHTML.send :include, Multilang
