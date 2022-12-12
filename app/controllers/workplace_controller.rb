class WorkplaceController < ApplicationController
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

    def new_message
        @message = Message.new({ account_id: current_account.id, content: params[:content], topic_id: params[:topic_id]})
        @message.save
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
