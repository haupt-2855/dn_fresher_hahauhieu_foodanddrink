class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :ratings, dependent: :destroy
  before_save :downcase_email

  validates :password, presence: true,
                    length: {minimum: Settings.length.password}, allow_nil: true
  validates :email, presence: true, uniqueness: true,
    length: {maximum: Settings.length.email},
    format: {with: Settings.format.VALID_EMAIL_REGEX}
  has_secure_password

  private

  def downcase_email
    email.downcase!
  end
end
