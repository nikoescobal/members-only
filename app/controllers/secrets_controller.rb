class SecretsController < ApplicationController
  before_action :set_secret, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create]

  # GET /secrets or /secrets.json
  def index
    @secrets = Secret.all
  end

  # GET /secrets/1 or /secrets/1.json

  # GET /secrets/new
  def new
    @secret = Secret.new
  end

  # GET /secrets/1/edit

  # POST /secrets or /secrets.json
  def create
    @secret = current_user.secrets.build(secret_params)

    respond_to do |format|
      if @secret.save
        format.html { redirect_to root_path, notice: 'Secret was successfully created.' }
        format.json { render :show, status: :created, location: @secret }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @secret.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_secret
    @secret = Secret.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def secret_params
    params.require(:secret).permit(:title, :body)
  end
end
