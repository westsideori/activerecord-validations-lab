class Post < ActiveRecord::Base
    validate :title_must_be_clickbait_y

    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
    ]
    
    def title_must_be_clickbait_y
        # if !self.title.include?(["Won't Believe",
        #     "Secret", "Top", "Guess"])
        #     error.add(:title, "Not clickbait-y enough!")
        # end
        if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
            errors.add(:title, "must be clickbait")
        end
    end

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    # include ActiveModel::Validations
    # validates_with TitleValidator
end
