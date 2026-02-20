class Proposals::AcceptsController < ApplicationController
  def create
    # authorization
    @proposal = Proposal.sent_to(current_user).find(params[:proposal_id])
    @proposal.transaction do
      # update proposal
      @proposal.touch(:accepted_at)
      # create match record
      Match.create(sock_1: @proposal.sock, sock_2: @proposal.proposed_sock)
    end
    redirect_back_or_to(authenticated_root_path)
  end
end
