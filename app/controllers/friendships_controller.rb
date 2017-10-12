# friendship controller
class FriendshipsController < ApplicationController
  before_action :find_request, only: [:create]
  def create
    if !@friend_request
      h = { friend_id: params[:friend_id], status: 'Pending' }
    else
      @friend_request.update(status: 'Friends')
      h = { friend_id: params[:friend_id], status: 'Friends' }
    end
    friend = current_user.friendships.create(friend_params.merge(h))
    render json: { friend: friend }
  end

  def destroy
    friend_request = Friendship.find_by(id: params[:id])
    return unless friend_request
    friend = friend_request.user_id
    unfriend = current_user.friendships.find_by(friend_id: friend)
    unfriend.destroy if unfriend
    friend_request.destroy
    render json: { user: friend }
  end

  private

  def find_request
    user = User.find(params[:friend_id])
    @friend_request = user.friendships.find_by(friend_id: current_user.id)
  end

  def friend_params
    params.permit(preferences: {})
  end
end
