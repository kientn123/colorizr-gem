class String

  def self.color_codes
    codes = {
      red: 31,
      green: 32,
      yellow: 33,
      blue: 34,
      pink: 35,
      light_blue: 94,
      white: 97,
      light_grey: 37,
      black: 30
    }
    codes
  end

  def self.create_colors
    self.color_codes.each do |color, code|
      self.class_eval(%Q{
        def #{color}
          \"\\e[#{code}m\#\{self\}\\e[0m\"
        end
      })
    end
  end

  def self.colors
    self.color_codes().keys
  end

  def self.sample_colors
    self.color_codes().each do |color, _|
      puts "This is " + "#{color}".send(color)
    end
  end

end

String.create_colors
