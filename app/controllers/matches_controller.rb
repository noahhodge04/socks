class MatchesController < ApplicationController
  # GET /socks/{:sock_id}/matches/new
  before_action :load_sock
  def new
    @match = Match.new
    @socks = Sock.all
  end

  # POST /socks/(sock_id)/matche
  def create
    @match = Match.new(sock_1_id: params[:sock_id], sock_2_id: params[:match][:match_id])
    @match.save
    redirect_to @sock, notice: "Match was successfully created"

    # @sock = Sock.find(params[:sock_id])

    # respond_to do |format|
    #   if @sock.save
    #     format.html { redirect_to @sock, notice: "Sock was successfully created." }
    #     format.json { render :show, status: :created, location: @sock }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @sock.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  private
    def load_sock
      @sock = Sock.find(params[:sock_id])
    end

end
