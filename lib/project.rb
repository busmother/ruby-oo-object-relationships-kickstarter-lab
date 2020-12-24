require "pry"
class Project
    attr_accessor :name, :title, :projectbacker, :backer
    @@all = []
    def initialize(title)
        @title = title
        @@all << self
    end

    def self.all
        @@all
    end

    def add_backer(backer)
        ProjectBacker.new(self, backer)
    end

    def backed_projects
        ProjectBacker.all.select {|backedproject| backedproject.project == self }
    end

    def backers
        backed_projects.map {|project| project.backer}
    end
end