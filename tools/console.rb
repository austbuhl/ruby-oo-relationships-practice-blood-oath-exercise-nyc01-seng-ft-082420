require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

mansons = Cult.new("Manson Family", "Los Angeles", 1969, "Sex, drugs & rock n roll")
heavens_gate = Cult.new("Heaven's Gate", "San Diego", 1974, "Earth will be recycled")
nxivm = Cult.new("NXIVM", "Albany", 1998, "Executive success!")

charles = Follower.new("Charles", 45, "We're all family")
keith = Follower.new("Keith", 50, "I'm a genius")
mojo = Follower.new("Mojo", 7, "Meow")

blood_oath1 = BloodOath.new(mansons, charles, "1969-01-01")
blood_oath2 = BloodOath.new(mansons, mojo, "1969-12-15")
blood_oath3 = BloodOath.new(heavens_gate, mojo, "1978-05-25")
blood_oath4 = BloodOath.new(nxivm, keith, "1998-04-19")
blood_oath5 = BloodOath.new(heavens_gate, keith, "1978-12-31")

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits