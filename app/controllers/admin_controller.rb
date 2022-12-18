# frozen_string_literal: true

# Class for admin's tools
class AdminController < ApplicationController
  before_action :section_moderation_check, except: %i[new_section create_section hide_section
                                                      show_section delete_section restore_section]
  before_action :topic_visibility_check, except: %i[new_section create_section hide_section
                                                    show_section delete_section restore_section]
  before_action :admin_only,
                only: %i[delete_topic restore_topic delete_msg restore_msg new_section create_section hide_section
                         show_section delete_section restore_section]

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

  private

  def appoint_moderators_for_hidden_chapter(section_id, chapter_id)
    return if Chapter.find_by(id: chapter_id).status != 'hidden'
    @sect = Section.find_by(id: section_id)
    Account.where(role: "Moderator").each{|moder| @sect.moderations.create(account_id: moder.id)}
  end

  def status_updater(model_object, status)
    model_object.update(status:)
    redirect_to request.referrer
  end
end
