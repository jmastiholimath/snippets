module Api
  module V1
    class SnippetsController < ApplicationController
      protect_from_forgery with: :null_session, if: Proc.new {|c| c.request.format.json? }
      respond_to :json

      ##API for Snippet create
      ##URL: Verb: POST
      ## /api/v1/snippets
      def create
        snippet = Snippet.new(snippet_params)

        if snippet.save
         api_status = ApiStatus.success(msg: "Your request was processed successfully")
        else
          api_status = ApiStatus.error(msg: "Something went wrong", errors: snippet.errors.full_messages.join(','))
        end
        render :json => api_status.to_json
      end

      ##Read snippet
      ##Verb: GET
      ##URL: api/v1/snippets/:id
      def show
        snippet = Snippet.find(params[:id])

        if snippet
          api_status = ApiStatus.success(:msg => "Your request was processed successfully.",
                                          :snippet => snippet)
        else
          api_status = ApiStatus.error(:msg => "There was an error handling your request")
        end
        render json: api_status.to_json
      end

      ##List N recent snippets
      ##Verb: GET
      ##URL: /api/v1/snippets?n=10
      def index
        snippets = Snippet.limit(params[:n]).order('id desc')
        api_status = ApiStatus.success(:msg => "Your request was processed successfully.",
                                       :snippets => snippets)
        render json: api_status.to_json
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
  end
end