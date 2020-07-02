# Zybooks Link Plugin
#
# The following plugin creates a liquid tag that links to the most recent zybooks for the course
# it needs to have the zybook in the _config.yml file for it successfully link for students.
#
#
# example usage
# {% zybook chapter:x section:x %}{% endzybook %}
#
#  For example:
#   {% zybook chapter:13 section:2 %}Loops{%endzybook%}
# would create the following link (assuming Summer Book)
# <a href="http://https://learn.zybooks.com/zybook/COLOSTATECS1634Summer2020/chapter/13/section/2" target="_blank">Loops</a>
#
# All arguments are OPTIONAL  the defaults are follows
# chapter = nothing
# section = 1 (if chapter is specified)
# resource_id = nothing
# So just putting in {% zybook %} would link to the TOC of your zybook.
#
#
#
module Jekyll
  module CSU_Plugin_Zybook
    class ZybookTag < Liquid::Block


       @@DEFAULTS = {
          :chapter => '',
          :section => '1',
          :book_base => 'https://learn.zybooks.com/zybook/',
          :book_id => 'invalid',
          :resource_id => ''
        }

        def self.DEFAULTS
            return @@DEFAULTS
        end

        def initialize(tag_name, markup, tokens)
            super

            @config = {}
            # set defaults
            override_config(@@DEFAULTS)

            # override configuration with values defined within _config.yml

            if Jekyll.configuration({}).has_key?('zybook')
                jek_config = Jekyll.configuration({})['zybook']
                override_config(jek_config)
            end

            params = markup.split



            if params.size > 0
                # override configuration with parameters
                pconfig = {} # reset local config
                params.each do |param|
                    param = param.gsub /\s+/, '' # remove whitespaces
                    key, value = param.split(':',2) # split first occurrence of ':' only
                    pconfig[key.to_sym] = value
                end
                override_config(pconfig)
            end
        end

      def override_config(config)
         config.each{ |key,value| @config[key] = value }
      end

      def render(context)
        content = super

        rtn = ""
        if @config[:chapter].empty?
            rtn = "<a href='#{@config[:book_base]}/#{@config["book_id"]}/' target='_blank'>#{content}</a>".gsub(%r{/{2,}}, '/')
        elsif @config[:resource_id].empty?
            rtn = "<a href='#{@config[:book_base]}/#{@config["book_id"]}/chapter/#{@config[:chapter]}/section/#{@config[:section]}/' target='_blank'>#{content}</a>".gsub(%r{/{2,}}, '/')
        else #content_resource_id was included
            rtn = "<a href='#{@config[:book_base]}/#{@config["book_id"]}/chapter/#{@config[:chapter]}/section/#{@config[:section]}?content_resource_id=#{@config[:resource_id]}' target='_blank'>#{content}</a>".gsub(%r{/{2,}}, '/')
        end

        return rtn
      end
    end
  end
end

Liquid::Template.register_tag('zybook', Jekyll::CSU_Plugin_Zybook::ZybookTag)


