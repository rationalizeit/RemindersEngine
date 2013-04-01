if %w[test development].include? Rails.env
  require "#{Rails.root}/spec/forgery/personal.rb"
end
