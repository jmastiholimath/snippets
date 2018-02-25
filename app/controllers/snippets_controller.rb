class SnippetsController < ApplicationController
  before_action :set_snippet, only: [:show, :edit, :update, :destroy]

  # GET /snippets
  # GET /snippets.json
  def index
    @snippets = Snippet.all
    respond_to do |format|
      format.html
      format.json { render json: SnippetDatatable.new(view_context) }
    end
  end

  # GET /snippets/1
  # GET /snippets/1.json
  def show
    if @snippet.private 
      if data = UrlStore.decode(params[:data]) 
        Snippet.find(@snippet.id)
      else
        render :file=>'public/404.html'
      end
    end
  end

  # GET /snippets/new
  def new
    @snippet = Snippet.new
  end

  # POST /snippets
  # POST /snippets.json
  def create
    @snippet = Snippet.new(snippet_params)

    respond_to do |format|
      if @snippet.save
        format.html { redirect_to @snippet.private? ? ("/snippets/#{@snippet.id}?data=#{UrlStore.encode(@snippet.id)}") :  @snippet, notice: 'Snippet was successfully created.' }
        format.json { render :show, status: :created, location: @snippet }
      else
        format.html { render :new }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snippet
      @snippet = Snippet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def snippet_params
      params.require(:snippet).permit(:description, :private)
    end
end
