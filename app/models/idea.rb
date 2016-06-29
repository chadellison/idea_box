class Idea < ActiveRecord::Base
  enum quality: [:swill, :plausible, :genius]

  def update_quality(amount)
    qualities = ["swill", "plausible", "genius"]
    current_quality = qualities.index(quality)
    new_quality = current_quality + amount.to_i
    new_quality = current_quality if new_quality > 2 || new_quality < 0
    update(quality: new_quality)
  end
end
