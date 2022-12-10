class WorkplaceController < ApplicationController
    def mainpage
        @p_sections = Section.where(status: "opened")
        @topics_inf = @p_sections.map{ |sec| [sec.topics.size, sec.topics.map{ |topic| topic.messages.size }.sum] }
        p @topics_inf
        p @topics_inf.sum{ |elem| elem[1]}
    end

    def section
        @c_section = Topic.where(section_id: params[:id])
        @p_sections = Section.where(status: "opened")
        p request.original_url
    end

    def new_topic
        p params
    end
end
