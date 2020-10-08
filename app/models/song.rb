class Song < ActiveRecord::Base

    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def find_by_slug(slug)
        Song.find_by(id: slug.id)
    end
end