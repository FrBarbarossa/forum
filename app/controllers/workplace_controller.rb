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

    def create_topic
        @topic = Topic.new({title: params[:title], section_id: params[:id], account_id: current_account.id})
        @message = @topic.messages.build({account_id: current_account.id, content: params[:content]})

        return unless @topic.valid?
        return unless @message.valid?

        @topic.save
        redirect_to '/section/'+params[:id] # Переделать на созданный топик
    end

end
