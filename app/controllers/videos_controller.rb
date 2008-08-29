class VideosController < ApplicationController

  before_filter(:prepare_resources)
  
  # GET /videos
  # GET /videos.xml
  def index
    @videos = @customer.videos

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @videos }
    end
  end

  # GET /videos/1
  # GET /videos/1.xml
  def show
    send_file(@video.path)
  end

  # PUT /videos/1
  # PUT /videos/1.xml
  def update

    respond_to do |format|
      if @video.update_attributes(params[:video])
        flash[:notice] = 'Video was successfully updated.'
        format.html { redirect_to(@video) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @video.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.xml
  def destroy
    @video.destroy

    respond_to do |format|
      format.html { redirect_to(videos_url) }
      format.xml  { head :ok }
    end
  end

  private
  def prepare_resources
    @customer = Customer.find(params[:customer_id])
    @video = @customer.videos.find(params[:id]) unless params[:id].blank?
  end
  
end
