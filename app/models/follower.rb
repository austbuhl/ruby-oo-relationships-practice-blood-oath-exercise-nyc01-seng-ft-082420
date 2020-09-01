
class Follower

    attr_accessor :name, :age, :life_motto
    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_active
        self.all.max_by { |cults| cults.cults.count }
    end

    def self.top_ten
        
    end

    def cults
        BloodOath.all.filter { |oaths| oaths.follower == self}#.map { |oaths| oaths.cult}
    end

    def join_cult(cult)
        BloodOath.new(cult, self, "2020-08-31")
    end

    def my_cults_slogans
        self.cults.map { |cults| cults.cult.slogan}
    end

    def self.of_a_certain_age(age)
        self.all.filter { |followers| followers.age >= age}.map { |followers| followers.name}
    end

    ##???
    def fellow_cult_members
        self.cults.filter { |cult| cult.follower == self}
    end
    ####


end