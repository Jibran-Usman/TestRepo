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

    def showTotalComments(comments)
        articleString = ''

        comments.each do |c|
            articleString << c.body << ','
        end

        articleString

    end

    def showTotalCommentsInACoolWay(comments)
        articleString = ''
        counter = 0

        comments.each do |c|
            i = 0
            loop do
                articleString << '* '
                break if i == counter
                i += 1 
            end

            articleString << c.body << ' - ' << c.commenter << ' <br / > '

            counter += 1
        end

        articleString
    end

end
