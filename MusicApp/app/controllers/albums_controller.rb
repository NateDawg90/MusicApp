class AlbumsController < ApplicationController

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @band = Band.find(params[:band_id])
    @album = Album.new(band_id: params[:band_id])
    render :new
  end

  def create
    @album = Album.new(album_params)
    # @album.user_id = current_user.id
    if @album.save
      redirect_to album_url(@album)
    else
      @band = @album.band
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :record_type, :band_id, :yr)
  end

end
