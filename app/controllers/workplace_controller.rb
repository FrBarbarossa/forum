class WorkplaceController < ApplicationController
    def mainpage
        @p_sections = Section.where(status: "opened")
    end

    def section
        @p_sections = Section.where(status: "opened")
    end
end
