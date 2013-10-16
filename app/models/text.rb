class Text < ActiveRecord::Base
  ALTERATIONS = ['Disemvowel', 'Munge', 'ROT 13']
  attr_accessor :alteration
  attr_accessible :text, :alteration

  before_create :alter

  private

  def alter
    case alteration
    when 'Disemvowel'
      disemvowel
    when 'Munge'
      munge
    when 'ROT 13'
      rot_13
    else
      self.text = 'INVALID!'
    end
  end

  def disemvowel
    self.text = text.tr 'aeiou', ''
  end



  def rot_13
    self.text = text.tr 'A-Za-z', 'N-ZA-Mn-za-m'
  end
end
