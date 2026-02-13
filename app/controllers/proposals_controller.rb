class ProposalsController < ApplicationController
  before_action :load_sock

  # GET /socks/{:sock_id}/proposals/new
  def new
    @proposal = Proposal.new
    @socks = Sock.all
  end

  # POST /socks/{sock_id}/proposals
  def create
    @proposal = Proposal.new(sock_1_id: params[:sock_id], sock_2_id: params[:proposal][:proposal_id])
    @proposal.save
    redirect_to @sock, notice: "Proposal was successfully created."
  end

private

  def load_sock
    @sock = Sock.find(params[:sock_id])
  end
end
