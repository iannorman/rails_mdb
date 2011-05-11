class CommentsController < ApplicationController
before_filter :authenticate_user! #we only want autheitcated users to destory or create comments
  
  def create
    unless request.xhr? #this is an ajax request. If it isn't an ajax request it will be ignored
      render :nothing => true
      return
    end

    film = Film.find(params[:film_id])
    comment = film.comments.create(:text => params[:add_comment_text], :user => current_user)
  
    if comment.valid?
      render :partial => 'comments/comment', :locals => {:comment => comment} #is the comment vaslid? If so, we're rendering this prtial. Passing a local variable to a partial
    else response.status = 422 #if comment not valid then 422 - this means invalid resource
      render :nothing => true
    end  

  end

  
  def destroy
  Comment.destroy(params[:id])
  redirect_to film_path(params[:film_id])
  end


end
