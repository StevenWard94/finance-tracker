class FriendshipsController < ApplicationController

  def destroy
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    @friend = User.find(@friendship.friend_id)
    @friendship.destroy
    flash[:notice] = "You are no longer friends with #{@friend.full_name} <#{@friend.email}>."
    redirect_to my_friends_path
  end

end
