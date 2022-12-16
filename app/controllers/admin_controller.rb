class AdminController < ApplicationController
  def hide_topic
    topic = Topic.find_by(id: params[:topic_id])
    topic.update(status: "hidden")
    redirect_to request.referrer
  end

  def show_topic
    topic = Topic.find_by(id: params[:topic_id])
    topic.update(status: "opened")
    redirect_to request.referrer
  end
end
