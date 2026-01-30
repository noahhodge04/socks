class MatchesController < ApplicationController
  # GET /socks/{:sock_id}/matches/new
  def new
    @match = Match.new
    @socks = Sock.all
  end

  # POST /socks or /socks.json
  def create
    @sock = Sock.find(sock_params[:sock_id])

    respond_to do |format|
      if @sock.save
        format.html { redirect_to @sock, notice: "Sock was successfully created." }
        format.json { render :show, status: :created, location: @sock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sock.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def load_sock
      @sock = Sock.find(sock_params[:sock_id])
    end

end
