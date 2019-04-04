class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update,:destroy]
  before_action :authenticate_user!, only: [:index, :show, :edit, :update,:destroy]


  def index
    if params[:category]
        @works = Work.where('title LIKE ?', "%#{params[:category]}%").paginate(:page => params[:page], :per_page => 20)
    else
        @works = Work.paginate(:page => params[:page], :per_page => 20)
    end



    @custom_renderer = Class.new(WillPaginate::ActionView::LinkRenderer) do
      def container_attributes
        {
            class: "pagination"
          }
      end
    end
  end



  def  json_works
    @works = Work.all
    render json: @works
  end




  def new
    @work = Work.new
  end



  def create
    @work = Work.new(work_params)
    @work.user_id = current_user.id

    @work.pimg = params[:pimg] # Assign a file like this, or

    # @work.pimg = url

    if @work.save

      redirect_to @work, notice: 'Your work was created successfully'
    else
      render :new
    end
  end

  def edit
  end



  def update
    if @work.update(work_params)
        redirect_to @work, notice: 'Your work was updated successfully'
    else
        render :edit
    end
  end



  def destroy
    @work.delete
    redirect_to  works_path, notice: 'Your work was deleted successfully'
  end






  private
    def work_params
      params.require(:work).permit(:title, :content, :images,:pimg)
    end

    def set_work
      @work = Work.find(params[:id])
    end
end
