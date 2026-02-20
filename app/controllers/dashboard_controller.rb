class DashboardController < ApplicationController
  def welcome
    @socks = Sock.all
    @proposals = Proposal.sent_to(current_user)
  end
end
