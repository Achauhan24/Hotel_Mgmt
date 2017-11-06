class Customer < ApplicationRecord
	has_many :microposts,dependent: :destroy
  has_many :active_relationships,class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships,class_name: "Relationship",
                                  foreign_key: "followed_id",
                                  dependent: :destroy                                
  has_many :following,through: :active_relationships,source: :followed
  has_many :followers,through: :passive_relationships,source: :follower

	attr_accessor :remember_token, :activation_token
    before_create :create_activation_digest
  before_save :downcase_email
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password,presence: true, length: {minimum: 6}


	def Customer.new_token
    SecureRandom.urlsafe_base64
  end
  def Customer.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  def remember
    self.remember_token = Customer.new_token
    update_attribute(:remember_digest, Customer.digest(remember_token))
  end
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def feed
    Micropost.where("customer_id=?",id)
  end

  def follow(other_user)
    following<<other_user

  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end
	private

    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = Customer.new_token
      self.activation_digest = Customer.digest(activation_token)
    end
end
