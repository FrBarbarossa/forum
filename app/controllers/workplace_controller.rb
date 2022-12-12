class WorkplaceController < ApplicationController
    before_action :logged_only, only: [:create_topic, :new_topic, :new_message]
    before_action :section_access_check, only: [:section, :topic, :create_topic, :new_message]
    before_action :topic_access_check, only: [:topic, :new_message]

    def mainpage
        @p_sections = Section.eager_load({topics: [:messages]}).where(status: "opened")
        p @p_sections.first.topics
    end

    def section
        @c_section = Topic.eager_load({messages: [:account]}, :account).where(section_id: params[:id]).reorder('messages.created_at DESC')

        p @c_section.first
    end

    def new_topic
        p current_account.id
    end

    # Добавить валидации!
    def new_message
        @message = Message.new({ account_id: current_account.id, content: params[:content], topic_id: params[:topic_id]})
        @message.valid?
        p @message.errors
        return unless @message.valid?
        @message.save
        redirect_to request.original_url
    end

    def create_topic
        @topic = Topic.new({title: params[:title], section_id: params[:id], account_id: current_account.id})
        @message = @topic.messages.build({account_id: current_account.id, content: params[:content]})

        return unless @topic.valid?
        return unless @message.valid?

        @topic.save
        redirect_to '/section/' + params[:id] # Переделать на созданный топик
    end

    def topic
        @messages = Message.eager_load([:account, :topic]).where(topic_id: params[:topic_id]).with_rich_text_content
    end

end
