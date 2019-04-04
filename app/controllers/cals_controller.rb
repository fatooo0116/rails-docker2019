class CalsController < ApplicationController
  before_action :set_cal, only: [:show, :edit, :update,:destroy]
  before_action :authenticate_user!, only: [:index, :show, :edit, :update,:destroy]


  def index
    if params[:category]
        @cals = Cal.where('title LIKE ?', "%#{params[:category]}%").paginate(:page => params[:page], :per_page => 20)
    else
        @cals = Cal.paginate(:page => params[:page], :per_page => 20)
    end



    @custom_renderer = Class.new(WillPaginate::ActionView::LinkRenderer) do
      def container_attributes
        {
            class: "pagination"
          }
      end
    end
  end








  def new
    @cal = Cal.new
  end



  def create
    @cal = Cal.new(cal_params)
    ## @cal.user_id = current_user.id

    # @work.pimg = url

    if @cal.save

      redirect_to @cal, notice: 'Your work was created successfully'
    else
      render :new
    end
  end

  def edit
  end



  def update
    if @cal.update(cal_params)
        redirect_to @cal, notice: 'Your work was updated successfully'
    else
        render :edit
    end
  end



  def destroy
    @cal.delete
    redirect_to  cals_path, notice: 'Your work was deleted successfully'
  end





  private
    def cal_params
      params.require(:cal).permit(:cname, :cdesc, :ccontact,:ctel,:start_at,:expire_at)
    end

    def set_cal
      @cal = Cal.find(params[:id])
    end

end
