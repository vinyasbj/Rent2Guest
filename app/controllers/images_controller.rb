class ImagesController < ApplicationController
	def index
    	@images = Image.all
  	end
  	def show
		@image = Image.find(params[:id])
	end

	def new
		@image = Image.new
	end

	def edit
		@image = Image.find(params[:id])
	end

	def create
		@image = Image.new(image_params)
		@image.room_id = Room.find(current_user.id).id
		respond_to do |format|
	      if @image.save
	        format.html { redirect_to @image, notice: 'image was successfully created.' }
	        format.json { render :show, status: :created, location: @image }
	      else
	        format.html { render :new }
	        format.json { render json: @image.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def update
		 @image = Image.find(params[:id])
		respond_to do |format|
	      if @image.update(image_params)
	        format.html { redirect_to @image, notice: 'image was successfully updated.' }
	        format.json { render :show, status: :created, location: @image }
	      else
	        format.html { render :new }
	        format.json { render json: @image.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def destroy
	@image = Image.find(params[:id])
		@image.destroy
	    respond_to do |format|
	      format.html { redirect_to images_url, notice: 'image was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	end
	private 
    def image_params
      params.require(:image).permit(:room_id,:image)
    end
end
