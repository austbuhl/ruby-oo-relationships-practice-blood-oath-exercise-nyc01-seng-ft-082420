
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

    def self.find_by_name(name)
        self.all.find { |cult| cult.name == name}
    end

    def self.find_by_location(location)
        self.all.filter { |cult| cult.location == location}.map { |cult| cult.name}
    end

    def self.find_by_founding_year(year)
        self.all.filter { |cult| cult.founding_year == year}.map { |cult| cult.name}
    end

    def self.least_popular
        self.all.min_by { |cults| cults.cult_population }
    end

    def self.most_common_location
        self.all.max_by { |cults| cults.location }.location
    end

    def cult_population
        BloodOath.all.filter { |oaths| oaths.cult == self}.count
    end

    def recruit_follower(follower)
        BloodOath.new(self, follower, "2020-08-31")
    end

    def followers
        BloodOath.all.filter { |oaths| oaths.cult == self }.map { |oaths| oaths.follower } 
    end

    def average_age
        self.followers.sum { |followers| followers.age} / self.followers.count.to_f
    end

    def my_followers_mottos
        self.followers.each { |followers| puts followers.life_motto }
    end


end