# frozen_string_literal: true

# Class for mainpages
class WorkplaceController < ApplicationController
  include WorkplaceHelper

  before_action :logged_only, only: %i[create_topic new_topic new_message]
  before_action :section_access_check, only: %i[section topic create_topic new_message new_topic like_msg unlike_msg]
  before_action :topic_access_check, only: %i[topic new_message like_msg unlike_msg]
  before_action :admin_only, only: :new_chapter

  def mainpage
    @p_sections = Chapter.eager_load(sections: { topics: [:messages] }).in_order_of(:status, CHAPTERS_PRIORITY)
                         .order('sections.created_at')
  end

  def section
    @c_section = Topic.eager_load({ messages: [:account] },
                                  :account).where(section_id: params[:id]).in_order_of(:priority, SORT_PRIORITY)
                      .order('messages.created_at DESC').page(params[:page])
    p @c_section.total_pages
  end

  def new_topic
    p current_account.id
  end

  def new_message
    @message = Message.new({ account_id: current_account.id, content: params[:content],
                             topic_id: params[:topic_id] })
    return unless @message.valid?

    @message.save
    redirect_to request.original_url
  end

  def create_topic
    @topic = Topic.new({ title: params[:title], section_id: params[:id], account_id: current_account.id })
    @message = @topic.messages.build({ account_id: current_account.id, content: params[:content] })

    return unless @topic.valid?
    return unless @message.valid?

    @topic.save
    redirect_to "/section/#{params[:id]}/topic/#{@topic.id}"
  end

  def topic
    @messages = Message.eager_load(%i[account topic
                                      likes]).where(topic_id: params[:topic_id])
                       .order('messages.created_at').with_rich_text_content
    add_view
  end

  def like_msg
    Like.create(account_id: current_account.id, message_id: params[:msg_id])
    @message = Message.eager_load(%i[account likes]).find_by(id: params[:msg_id])
    render 'like'
  end

  def unlike_msg
    Like.find_by(account_id: current_account.id, message_id: params[:msg_id]).destroy
    @message = Message.eager_load(%i[account likes]).find_by(id: params[:msg_id])
    render 'like'
  end

  private

  def add_view
    return unless session[:user_id]

    statement = View.where(topic_id: params[:topic_id]).where(account_id: current_account.id).empty?
    View.create!({ account_id: current_account.id, topic_id: params[:topic_id] }) if session[:user_id] && statement
  end

  def new_chapter; end
end
