class AcceptsProposal < ApplicationService
  attr_reader :for_user, :proposal_id

  def self.call(**args)
      new(**args).call
  end

  def initialize(**args)
      args => { for_user:, proposal_id: }
      @for_user = for_user
      @proposal_id = proposal_id
  end

  def call
    @proposal = Proposal.sent_to(for_user).find(params[proposal_id])
    create_acceptance(proposal)
    # @proposal.transaction do
    #   # update proposal
    #   @proposal.touch(:accepted_at)
    #   # create match record
    #   Match.create(sock_1: @proposal.sock, sock_2: @proposal.proposed_sock)
    # end
    proposal
  end

  def create_accpetance(proposal)
    @proposal.transaction do
      # update proposal
      @proposal.touch(:accepted_at)
      # create match record
      Match.create(sock_1: @proposal.sock, sock_2: @proposal.proposed_sock)
    end
end