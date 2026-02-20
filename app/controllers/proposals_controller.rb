class ProposalsController < ApplicationController
  # This call runs before every action and loads the sock based on the sock_id parameter from the URL.
  before_action :load_sock, only: [ :new, :create ]

  # GET /socks or /{:sock_id
  def new
    @proposal = Proposal.new
    @socks = Sock.all
  end

  # This action creates a new proposed match between two socks.
  def create
    @proposal = Proposal.new(sock_id: params[:sock_id], proposed_sock_id: params[:proposal][:proposed_sock_id])
    # Save the proposed match to the database
    @proposal.save!
    redirect_to @sock, notice: "Proposed match was successfully created."
  end

  # PATCH /proposals/:id
  # Only used for declining proposals
  def update
    @proposal = Proposal.sent_to(current_user).find(params[:id])
    @proposal.decline!
    redirect_back_or_to(authenticated_root_path)
  end

private
  # This method finds and loads the sock using parameters from the request.
  def load_sock
    @sock = Sock.find(params[:sock_id])
  end
end
