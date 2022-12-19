module AdminHelper
    PRETENDERS_PRIORITY = ["Moderator", "User", "Admin"]
    ADMINS_ONLY = %i[delete_topic restore_topic delete_msg restore_msg new_section create_section hide_section
        show_section delete_section restore_section open_pretenders dismiss_moder make_moder find_pretender find_moderators fire_moder]
    EXCEPTING = %i[new_section create_section hide_section
        show_section delete_section restore_section open_pretenders dismiss_moder make_moder find_pretender find_moderators fire_moder]

  def appoint_moderators_for_hidden_chapter(section_id, chapter_id)
    return if Chapter.find_by(id: chapter_id).status != 'hidden'

    @sect = Section.find_by(id: section_id)
    Account.where(role: 'Moderator').each { |moder| @sect.moderations.create(account_id: moder.id) }
  end

  def status_updater(model_object, status)
    model_object.update(status:)
    redirect_to request.referrer
  end

  def newbie(account)
    return if account.role == 'Moderator'

    account.update(role: 'Moderator')
    account.save
    Chapter.where(status: 'hidden').each do |chap|
      chap.sections.each do |sec|
        sec.moderations.create(account_id: account.id)
      end
    end
  end

  def fired(account)
    return if account.moderations.size > Chapter.find_by(status: "hidden").sections.size + 1

    account.update(role: 'User')
    account.moderations.destroy_all
  end
end
