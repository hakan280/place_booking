class CommentMailer < ApplicationMailer

  def new_comment(place) #notify owner when new comment
    @place = place
    mail(to: @place.owner.email, subject: 'Your Place has new comment')

  end

end
