class LinksController < ApplicationController
  before_action :set_link, only: [:show]

  # GET /links
  # GET /links.json
  def index
    @link = Link.new
    @top_links = Link.order(accesses: :desc).first(100)
  end

  def show
    if params[:token]
      @link = Link.find_by(token: params[:token])
      if redirect_to @link.in_url
        @link.accesses += 1
        @link.save
      end
    else
      @link = Link.find(params[:id])
    end
  end

  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :index }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find_by(token: params[:token])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:in_url)
    end
end
