module VotesHelper

  def vote_total(object)
    object.votes.where(vote_direction: true).count - object.votes.where(vote_direction: false).count
  end

end
