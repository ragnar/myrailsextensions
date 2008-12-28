module ActionView::Helpers::AssetTagHelper
        # :call-seq:
        #       stylesheet_link_tag(*sources) -> String
        #
        alias_method :orig_stylesheet_link_tag, :stylesheet_link_tag
        def stylesheet_link_tag(*sources)
                options = sources.extract_options!.stringify_keys
                cache   = options.delete("cache")
                recursive = options.delete("recursive")
                extraname = options.delete("extraname") || "cached"

                if ActionController::Base.perform_caching && cache
                        total = 0
                        StylesheetSources.create( self, @controller, sources, recursive).expand_sources.each do |source|
                                total += StylesheetTag.new(self, @controller, source).public_path.split("?").last.to_i
                        end
                        cache = "computed/#{extraname}-#{total}"
                end
                sources.push( {:cache => cache, :recursive => recursive})
                orig_stylesheet_link_tag( *sources )
        end

        # :call-seq:
        #       javascript_include_tag(*sources) -> String
        #
        alias_method :orig_javascript_include_tag, :javascript_include_tag
        def javascript_include_tag( *sources )
                options = sources.extract_options!.stringify_keys
                cache   = options.delete("cache")
                recursive = options.delete("recursive")
                extraname = options.delete("extraname") || "cached"

                if ActionController::Base.perform_caching && cache
                        total = 0
                        JavaScriptSources.create( self, @controller, sources, recursive).expand_sources.each do |source|
                                total += JavaScriptTag.new(self, @controller, source).public_path.split("?").last.to_i
                        end
                        cache = "computed/#{extraname}-#{total}"
                end
                sources.push( {:cache => cache, :recursive => recursive})
                orig_javascript_include_tag( *sources )
        end
end

STDERR.puts "**   Loaded ActionView::Helpers::AssetTagHelper extensions."
