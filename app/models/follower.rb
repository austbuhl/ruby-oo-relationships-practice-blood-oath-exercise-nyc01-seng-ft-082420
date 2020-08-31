
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

    def cults
        BloodOath.all.filter { |oaths| oaths.follower == self}.map { |oaths| oaths.cult}
    end

    def join_cult(cult)
        BloodOath.new(cult, self, "2020-08-31")
    end

    def self.of_a_certain_age(age)
        self.all.filter { |followers| followers.age >= age}.map { |followers| followers.name}
    end


end