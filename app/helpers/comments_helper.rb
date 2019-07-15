module CommentsHelper
	def is_comment_big(comment)
      if (comment.body.length > 20)
        comment.body
      end
    end
end
