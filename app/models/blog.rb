class Blog < ApplicationRecord
    validates :title, :description, presence: true

    def self.get_latest
        Blog.order("created_at desc")
    end

end
