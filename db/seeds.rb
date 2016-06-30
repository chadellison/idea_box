class Seeds
  def initialize
    create_ideas
  end

  def create_ideas
    10.times do
      idea = Idea.create(title: Faker::Name.title, body: Faker::Hacker.say_something_smart)
      puts "created #{idea.title}"
    end
  end
end

Seeds.new
