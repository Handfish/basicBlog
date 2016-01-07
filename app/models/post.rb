class Post < ActiveRecord::Base
    def new
        @p = Post.new(post_params)
    end

    validates :title, :content, :presence => true
    validates :title, :length => {:minimum => 2}
    validates :title, :uniqueness => {:message => "is already in use."}

    private
    def post_params
        params.require(:post).permit(:title,:content)
    end
end
