class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def leave_review(user, star_rating, comment)
        self.reviews.create(user: user, star_rating: star_rating, comment: comment)
    end

    def print_all_reviews 
        self.reviews.each do |r|
            puts "Review for #{r.product.name} by #{r.user.name}: #{r.star_rating}. #{r.comment}"
        end
    end

    def average_rating
        self.reviews.average(:star_rating)
    end
end