class PinsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
      @pins = Pin.all
    search = params[:search]
    @pins = @pins.joins(:user).where("body LIKE ?", "%#{search}%") if search.present?
    if params[:tag_ids]
      @pins = []
      params[:tag_ids].each do |key, value|      
        @pins += Tag.find_by(name: key).pins if value == "1"
      end
      @pins.uniq!
    end
  end

      def new
        @pin = Pin.new
      end
    
      def create
        pin = Pin.new(pin_params)

        pin.user_id = current_user.id

        if pin.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @pin = Pin.find(params[:id])
      end
    
      def edit
        @pin = Pin.find(params[:id])
      end

      def update
        pin = Pin.find(params[:id])
        if pin.update(pin_params)
          redirect_to :action => "show", :id => pin.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        pin = Pin.find(params[:id])
        pin.destroy
        redirect_to action: :index
      end

      private
      def pin_params
        params.require(:pin).permit(:name, :address, :url, :about, :image, :lat, :lng, tag_ids: [])
      end

end