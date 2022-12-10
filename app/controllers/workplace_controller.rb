class WorkplaceController < ApplicationController
    def mainpage
        @p_sections = Section.where(status: "opened")
        @topics_inf = @p_sections.map{ |sec| [sec.topics.size, sec.topics.map{ |topic| topic.messages.size }.sum] }
        p @topics_inf
        p @topics_inf.sum{ |elem| elem[1]}
    end

    def section
        @p_sections = Section.where(status: "opened")
    end
end
