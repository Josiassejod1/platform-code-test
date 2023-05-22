require 'award'

def update_quality(awards)
  awards.each do |award|
    reward_engine(award)
  end
end

def reward_engine(award)
  if award.name != 'Blue First' && award.name != 'Blue Compare'
    if award.quality > 0
      if award.name != 'Blue Distinction Plus'
        award.decrease_quantity(1)
      end
    end
  else
    if award.quality < 50
      award.increase_quantity(1)
      if award.name == 'Blue Compare'
        if award.expires_in < 11
          if award.quality < 50
            award.increase_quantity(1)
          end
        end
        if award.expires_in < 6
          if award.quality < 50
            award.increase_quantity(1)
          end
        end
      end
    end
  end
  if award.name != 'Blue Distinction Plus'
    award.expires_in -= 1
  end
  if award.expires_in < 0
    if award.name != 'Blue First'
      if award.name != 'Blue Compare'
        if award.quality > 0
          if award.name != 'Blue Distinction Plus'
            award.quality -= 1
          end
        end
      else
        award.quality = award.quality - award.quality
      end
    else
      if award.quality < 50
        award.increase_quantity(1)
      end
    end
  end
end