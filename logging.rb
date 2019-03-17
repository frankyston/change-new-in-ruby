module Logging
  def make_noise
    puts "Started making noise"
    super
    puts "Finished making noise"
  end
end

class Bird
  def self.new(*arguments, &block)
    instance = allocate
    instance.singleton_class.include(Logging)
    instance.send(:initialize, *arguments, &block)
    instance
  end
end

class Duck < Bird
  def initialize(name)
    @name = name
  end

  def make_noise
    puts "#{@name}: Quack, quack!"
  end
end

object = Duck.new('Felix')
object.make_noise