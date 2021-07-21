class Api::Pj1::ClientController < ApiController
  before_action :set_client, only: [:show]

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  #一覧
  def index
    clients = Client.all
    render json: clients
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