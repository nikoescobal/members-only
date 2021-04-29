class SecretsController < ApplicationController
  before_action :set_secret, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create]

  # GET /secrets or /secrets.json
  def index
    @secrets = Secret.all
  end

  # GET /secrets/1 or /secrets/1.json
  def show; end

  # GET /secrets/new
  def new
    @secret = current_user.secrets.build
  end

  # GET /secrets/1/edit
  def edit; end

  # POST /secrets or /secrets.json
  def create
    @secret = current_user.secrets.build(secret_params)

    respond_to do |format|
      if @secret.save
        format.html { redirect_to @secret, notice: 'Secret was successfully created.' }
        format.json { render :show, status: :created, location: @secret }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @secret.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /secrets/1 or /secrets/1.json
  def update
    respond_to do |format|
      if @secret.update(secret_params)
        format.html { redirect_to @secret, notice: 'Secret was successfully updated.' }
        format.json { render :show, status: :ok, location: @secret }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @secret.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /secrets/1 or /secrets/1.json
  def destroy
    @secret.destroy
    respond_to do |format|
      format.html { redirect_to secrets_url, notice: 'Secret was successfully destroyed.' }
      format.json { head :no_content }
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
