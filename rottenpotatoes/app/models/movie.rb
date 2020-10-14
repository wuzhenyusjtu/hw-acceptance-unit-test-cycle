class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.similar_movies id, options

    options = options.select { |key,value| value != nil and value != '' }

    if options.keys.length == 0
      return none()
    end

    builder = all()
    options.each do |key, value|
      builder = builder.where("%s = '%s'" % [key, value])
    end
    builder = builder.where("id != '%s'" % [id])
    builder
  end
end