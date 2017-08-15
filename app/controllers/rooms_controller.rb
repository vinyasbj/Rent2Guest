class RoomsController < ApplicationController
	before_action :authenticate_user! ,except: [:index ,:show]
	def index
		@rooms = Room.all
	end

	def show
		@room = Room.find(params[:id])
	end

	def new
		@room = Room.new
	end

	def edit
		@room = Room.find(params[:id])
	end

	def create
		@room = Room.new(room_params)
		@room.user_id = current_user.id
		respond_to do |format|
	      if @room.save
	        format.html { redirect_to @room, notice: 'room was successfully created.' }
	        format.json { render :show, status: :created, location: @room }
	      else
	        format.html { render :new }
	        format.json { render json: @room.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def update
		 @room = Room.find(params[:id])
		respond_to do |format|
	      if @room.update(room_params)
	        format.html { redirect_to @room, notice: 'room was successfully updated.' }
	        format.json { render :show, status: :created, location: @room }
	      else
	        format.html { render :new }
	        format.json { render json: @room.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def destroy
	@room = Room.find(params[:id])
		@room.destroy
	    respond_to do |format|
	      format.html { redirect_to rooms_url, notice: 'room was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	end

	private 
    def room_params
      params.require(:room).permit(:name,:description,:price,:rules,:minimum_days,:address,:latitude,:longitude,:city_id ,:user_id,:is_authorized)
    end
end