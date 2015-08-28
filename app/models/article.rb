class Article < ActiveRecord::Base
    def tag_list=(tag_string)
      tag_names = tag_string.split(",").collect{|s| s.strip.downcase}.uniq
      new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
      self.tags = new_or_found_tags
    end
    
    def tag_list
      self.tags.map do |tag|
        tag.name
      end.join(", ")
    end
    has_many :taggings
    has_many :tags, through: :taggings
    has_many :comments
end
