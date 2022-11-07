class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product
        self.reviews.all.sort{ |a,b| a.star_rating <=> b.star_rating }.last
    end

    def remove_reviews(product)
        self.products.find_by(id: product.id).reviews.destroy_all
    end
end