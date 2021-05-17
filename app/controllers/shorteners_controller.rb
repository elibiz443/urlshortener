class ShortenersController < ApplicationController
  include ApplicationHelper

  http_basic_authenticate_with name: ENV['AUTHENT_USER'], password: ENV['AUTHENT_PASSWORD'], except: [:new, :show, :create, :redirect]

  def index
    @shorteners = Shortener.all
    @shorteners = Shortener.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @shortener = Shortener.find(params[:id])
  end

  def redirect
    @shortener = Shortener.where(slug: params[:slug]).first

    @shortener.increment!(:count)

    redirect_to @shortener.given_url
  end

  def new
    @shortener = Shortener.new
  end

  def create
    @shortener = Shortener.new(shortener_params)

    if @shortener.save
      redirect_to shortener_url(@shortener)
    else
      render 'new'
    end
  end

  def create
    @shortener = Shortener.new(shortener_params)

    respond_to do |format|
      if @shortener.save
        format.html { redirect_to shortener_url(@shortener) }
        format.json { render :show, status: :created, location: @shortener }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shortener.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @shortener.update(shortener_params)
        format.html { redirect_to @shortener, notice: "Link Successfully Updated." }
        format.json { render :show, status: :ok, location: @shortener }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shortener.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shortener.destroy
    respond_to do |format|
      format.html { redirect_to shorteners_url, notice: "Link Successfully Destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def shortener_params
    params.require(:shortener).permit(
    :given_url,
    :count
    )
  end
end
