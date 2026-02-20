class AcceptsProposal < ApplicationService
  attr_reader :for_user, :proposal_id

  def call
    # authorization
    proposal = Proposal.sent_to(@for_user).find(@proposal_id)
    create_acceptance(proposal)

    proposal
  end

private

  def create_acceptance(proposal)
    proposal.transaction do
      # update proposal
      proposal.touch(:accepted_at)
      # create match record
      Match.create(sock_1: proposal.sock, sock_2: proposal.proposed_sock)
    end
  end
end
