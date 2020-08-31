
class Cult

    attr_accessor :name, :location, :founding_year, :slogan
    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def self.all
        @@all
    end

    def cult_population
        BloodOath.all.filter { |oaths| oaths.cult == self}.count
    end

    def recruit_follower(follower)
        BloodOath.new(self, follower, "2020-08-31")
    end

    def self.find_by_name(name)
        self.all.find { |cult| cult.name == name}
    end

    def self.find_by_location(location)
        self.all.filter { |cult| cult.location == location}.map { |cult| cult.name}
    end

    def self.find_by_founding_year(year)
        self.all.filter { |cult| cult.founding_year == year}.map { |cult| cult.name}
    end


end