class HomeController < ApplicationController

    def index
        @works = Work.order(created_at: :desc).first(12)
      end
    
      def ourwork
        @work = Work.find(params[:id])
      end
end
