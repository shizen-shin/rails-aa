class Api::Pj1::ClientsController < ApiController
  before_action :set_client, only: [:show]

  #例外処理
  rescue_from Exception, with: :render_status_500
  rescue_from ActiveRecord::RecordNotFound, with: :render_status_404


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

  #新規登録
  def create
    @client = Client.new(client_params)
    if @client.save
      render json: @client, status: :created
    else
      render json: { errors: @client.errors.full_messages }, status: :unprocessable_entity
    end
  end

  #編集
  def update
    if @client.updat(client_params)
      head :no_content
    else
      render json: { errors: @client.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

    def set_client
      @client = Client.find(params[:id])
    end

    #ストロングパラメータの設定
    def client_params
      params.fetch(:client, {}).permit(:client_name, :pj_name, :status, :order_date, :price, :memo)
    end

    def render_status_404(exception)
      render json: { errors: [exception] }, status: 404
    end

    def render_status_500(exception)
      render json: { errors: [exception] }, status: 500
    end
end