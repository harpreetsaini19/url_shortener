class ShortiesController < ApplicationController
  before_action :set_shorty, only: [:show, :destroy, :update]

  # GET /shorties
  # GET /shorties.json
  def index
    @shorties = Shorty.all.order('updated_at DESC')
  end

  # GET /shorties/1
  # GET /shorties/1.json
  def show
  end

  # GET /shorties/new
  def new
    @shorty = Shorty.new
  end

  # POST /shorties
  # POST /shorties.json
  def create
    
    # checking if the shorty already exists
    # if exists return the same shortened_url and update updated_at and alias(if provided)
    # if the shorty doesn't exist generate a new one
    
    @shorty = Shorty.find_by_actual_url(params[:shorty][:actual_url])
    if @shorty
      @shorty.alias = params[:shorty][:alias]
    else      
      @shorty = Shorty.new(shorty_params)
      begin
        shorty_key = SecureRandom.hex(KEY_LENGTH)
      end while Shorty.exists?(shortened_url: shorty_key)
      @shorty.shortened_url = shorty_key
      @shorty.http_status = 301
    end  
    respond_to do |format|
      if @shorty.save
        format.html { redirect_to @shorty}
        format.json { render action: 'show', status: :created, location: @shorty }
      else
        format.html { render action: 'new' }
        format.json { render json: @shorty.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @shorty.update(shorty_params)
        format.html { redirect_to @shorty}
        format.json { render action: 'show', status: :created, location: @shorty }
      else
        format.html { render action: 'new' }
        format.json { render json: @shorty.errors, status: :unprocessable_entity }
      end
    end
  end

  def redirect
    @shorty = Shorty.where(shortened_url:params[:link]).first || Shorty.where(alias: URI::unescape(params[:link])).first || not_found
    @shorty.update(hits:@shorty.hits+1)
    redirect_to @shorty.actual_url, :status => @shorty.http_status
  end

  def destroy
    @shorty.destroy
    redirect_to shorties_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shorty
      @shorty = Shorty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shorty_params
      params.require(:shorty).permit(:actual_url,:alias)
    end
end
