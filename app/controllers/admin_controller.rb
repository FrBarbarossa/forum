class AdminController < ApplicationController
  before_action :section_moderation_check
  before_action :topic_visibility_check
  before_action :admin_only, only: [:delete_topic, :restore_topic]

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

  def delete_topic
    topic = Topic.find_by(id: params[:topic_id])
    topic.update(status: "deleted")
    redirect_to request.referrer
  end

  def restore_topic
    topic = Topic.find_by(id: params[:topic_id])
    topic.update(status: "opened")
    redirect_to request.referrer
  end

  def pin_topic
    topic = Topic.find_by(id: params[:topic_id])
    topic.update(priority: "important")
    redirect_to request.referrer
  end

  def unpin_topic
    topic = Topic.find_by(id: params[:topic_id])
    topic.update(priority: "normal")
    redirect_to request.referrer
  end

end
