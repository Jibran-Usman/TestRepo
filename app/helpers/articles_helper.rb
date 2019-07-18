module ArticlesHelper
	def is_admin(article)
    	if(I18n.locale == :en)
    		if (article.title.eql? "Admin")
    			I18n.locale = :admin
    		end
    	elsif(I18n.locale == :admin)
    		if (article.title.eql? "Not Admin")
    			I18n.locale = :en
    		end
    	end
    end

    def show_limited_description(article)
        if article.text.length > 20
            article.text[0..20] << "..."
        else
            article.text
        end
    end
end
