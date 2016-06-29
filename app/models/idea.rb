class Idea < ActiveRecord::Base
  enum quality: [:swill, :plausible, :genius]

  def update_quality(amount)
    qualities = ["swill", "plausible", "genius"]
    current_quality = qualities.index(quality)
    update(quality: current_quality + amount.to_i)
  end
end
