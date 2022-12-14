# frozen_string_literal: true

# Class for admin's tools
class AdminController < ApplicationController
  include AdminHelper

  before_action :section_moderation_check, except: EXCEPTING
  before_action :topic_visibility_check, except: EXCEPTING
  before_action :admin_only, only: ADMINS_ONLY

  def hide_topic
    topic = Topic.find_by(id: params[:topic_id])
    status_updater topic, 'hidden'
  end

  def show_topic
    topic = Topic.find_by(id: params[:topic_id])
    status_updater topic, 'opened'
  end

  def delete_topic
    topic = Topic.find_by(id: params[:topic_id])
    status_updater topic, 'deleted'
  end

  def restore_topic
    topic = Topic.find_by(id: params[:topic_id])
    status_updater topic, 'opened'
  end

  def pin_topic
    topic = Topic.find_by(id: params[:topic_id])
    topic.update(priority: 'important')
    redirect_to request.referrer
  end

  def unpin_topic
    topic = Topic.find_by(id: params[:topic_id])
    topic.update(priority: 'normal')
    redirect_to request.referrer
  end

  def open_topic
    topic = Topic.find_by(id: params[:topic_id])
    topic.update(closed: false)
    redirect_to request.referrer
  end

  def close_topic
    topic = Topic.find_by(id: params[:topic_id])
    topic.update(closed: true)
    redirect_to request.referrer
  end

  def hide_msg
    message = Message.find_by(id: params[:msg_id])
    status_updater message, 'hidden'
  end

  def show_msg
    message = Message.find_by(id: params[:msg_id])
    status_updater message, 'visible'
  end

  def delete_msg
    message = Message.find_by(id: params[:msg_id])
    status_updater message, 'deleted'
  end

  def restore_msg
    message = Message.find_by(id: params[:msg_id])
    status_updater message, 'visible'
  end

  def new_section; end

  def create_section
    @section = Section.new({ title: params[:title],
                             description: params[:content],
                             status: Chapter.find_by(id: params[:chapter_id]).status,
                             chapter_id: params[:chapter_id] })
    return unless @section.valid?

    @section.save
    appoint_moderators_for_hidden_chapter(@section.id, params[:chapter_id])
    redirect_to '/'
  end

  def hide_section
    section = Section.find_by(id: params[:section_id])
    status_updater section, 'hidden'
  end

  def show_section
    section = Section.find_by(id: params[:section_id])
    status_updater section, 'opened'
  end

  def delete_section
    section = Section.find_by(id: params[:section_id])
    status_updater section, 'deleted'
    section.moderations.update_all(disabled: true)
  end

  def restore_section
    section = Section.find_by(id: params[:section_id])
    status_updater section, 'opened'
    section.moderations.update_all(disabled: false)
  end

  def open_pretenders
    @pretenders = Account.eager_load(:user, :moderations).all.in_order_of(:role, PRETENDERS_PRIORITY)
  end

  def make_moder
    @account = Account.find_by(id: params[:account_id])
    @account.moderations.create(account_id: params[:account_id], section_id: params[:section_id])
    newbie @account
    render 'open_pretenders'
  end

  def dismiss_moder
    @account = Account.eager_load(:moderations).find_by(id: params[:account_id])
    @account.moderations.find_by(section_id: params[:section_id]).destroy
    fired @account
    render 'open_pretenders'
  end

  def find_pretender
    @pretenders = Account.eager_load(:user, :moderations).where('users.login LIKE ?', "%#{params[:name]}%")
                         .or(Account.eager_load(:user, :moderations).where('name LIKE ?', "%#{params[:name]}%"))
                         .in_order_of(:role, PRETENDERS_PRIORITY)
    render 'open_pretenders'
  end

  def find_moderators
    @pretenders = Account.eager_load(:user, :moderations).where(role: 'Moderator')
    render 'open_pretenders'
  end

  def fire_moder
    Account.find_by(id: params[:account_id]).moderations.delete_all
    @pretenders = Account.eager_load(:user, :moderations).where(role: 'Moderator')
    fired Account.find_by(id: params[:account_id])
    render 'open_pretenders'
  end

  def create_chapter
    @chapter = Chapter.new(title: params[:title])
    return unless @chapter.valid?

    @chapter.save
    redirect_to '/'
  end
end
