class Api::Pj1::ClientsController < ApiController
  before_action :set_client, only: [:show]

  #例外処理
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  #一覧
  def index
    # @clients = Client.all
    @clients = Client.select(:client_name, :pj_name, :status, :id)
    render json: @clients
  end

  #詳細
  def show
    render json: @client
  end

  private

    def set_client
      @client = Client.find(params[:id])
    end
end