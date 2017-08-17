class RoomsController < ApplicationController
	before_action :authenticate_user! ,except: [:index ,:show]

	load_and_authorize_resource
	def index
		if current_user.nil?  
			@rooms = Room.where(is_authorized: true)
		elsif current_user.role? "host"
			@rooms = Room.where(is_authorized: true)
		elsif current_user.role? "guest"
			@rooms = Room.where(is_authorized: true)		
		elsif current_user.role? "admin"
			@rooms = Room.all
		end
		@room_authorized = Room.where(is_authorized: true)
		@room_unauthorized = Room.where(is_authorized: false)
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

	def my_rooms
		# @my_rooms = Room.
	end

	private 
    def room_params
      params.require(:room).permit(:name,:description,:price,:rules,:minimum_days,:address,:latitude,:longitude,:city_id ,:user_id,:is_authorized,amenity_ids: [])
    end
end
