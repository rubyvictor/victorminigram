class GramsController <ApplicationController
	before_action :authenticate_user, only: [:new, :create, :destroy]

	def index
		@grams = Gram.order(id: :desc).page(params[:page]).per(5)

	end
	def new
		@gram = Gram.new
	end

	def create
    @gram = Gram.new(params.require(:gram).permit(:title, :content, :country_code, :image, :image_cache))

    # !!!!! Associate a Gram to a User !!!!!
    @gram.user = current_user


    if @gram.save
      redirect_to @gram, notice: 'You have successfully grammed!'
    else
      render :new
    end
  end


def show
	@gram = Gram.find(params[:id])
end

def destroy
	@gram = current_user.grams.find(params[:id])
	@gram.destroy

	redirect_to grams_path	
end

private

    def authenticate_user
      redirect_to root_path unless current_user
    end

end
