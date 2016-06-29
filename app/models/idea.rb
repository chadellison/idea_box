class Idea < ActiveRecord::Base
  enum quality: [:swill, :plausible, :genius]

  def update_quality(amount)
    qualities = ["swill", "plausible", "genius"]
    current_quality = qualities.index(quality)
    new_quality = current_quality + amount.to_i
    new_quality = current_quality if new_quality > 2 || new_quality < 0
    update(quality: new_quality)
  end

  def self.filter(text = "")
    ids = self.where("title like ?", "%#{text}%").pluck(:id) +
    self.where("body like ?", "%#{text}%").pluck(:id).uniq #order(created_at: :desc)
    self.where(id: ids).order(created_at: :desc)
  end
end
