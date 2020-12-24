require "pry"
class Backer
    attr_accessor :name, :projectbacker, :project
    @@all = []
    def initialize(name)
        @name = name
        @@all << self

    end

    def self.all
        @@all
    end

    def back_project(project)
        ProjectBacker.new(project, self)
    end

    def project_backer
        ProjectBacker.all.select {|backed_project| backed_project.backer ==self}
    end

    def backed_projects
        project_backer.map {|backed_project| backed_project.project}
    end

end