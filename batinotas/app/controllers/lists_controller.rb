class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  def index
    @lists = List.all
  end

  # GET /lists/1
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
    list_cookie
    @cook = cookie_to_array(cookies[:listsCookie])
  end

  # GET /lists/1/edit
  def edit
  end


  # POST /lists
  def create
    @list = List.new(list_params)
    @list.url = @list.name.parameterize
    if @list.save
      list_cookie
      @cook = cookie_to_array(cookies[:listsCookie])
      add_list_to_cookie @list
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /lists/1
  def update
    if @list.update(list_params)
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lists/1
  def destroy
    remove_list_from_cookie @list
    @list.destroy
    redirect_to lists_url, notice: 'List was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find_by(url: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :url)
    end

    def list_cookie
      cookies[:listsCookie] ||= '' #orEquals. A ||= B Si A no es true entonces hace A=B.
    end

    helper_method :list_cookie #al setearlo como helper lo puedo usar en la vista.(magia negra)
    helper_method :cookie_to_array

    def cookie_to_array(cookie)
      cookie.split(",")
    end

    def array_to_string(array)
      array.join(",")
    end

    def add_list_to_cookie(list)
      @cookie_array = cookie_to_array(cookies[:listsCookie])
      @cookie_array << list.url
      @cookie_array = @cookie_array.last(5)
      cookies[:listsCookie] = array_to_string @cookie_array
      #list_cookie << list.url
      #cookies[:listsCookie] = list_cookie.last(5)
    end

    def remove_list_from_cookie(list)
      @cookie_array = cookie_to_array(cookies[:listsCookie])
      @cookie_array.delete(list.url)
      cookies[:listsCookie] = array_to_string @cookie_array
    end
end
