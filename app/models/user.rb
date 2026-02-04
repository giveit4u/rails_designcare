class User < ApplicationRecord
  has_secure_password validations: false

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true

  # 소셜 로그인 사용자를 위한 비밀번호 유효성 검사 조건부 설정
  validates :password, presence: true, length: { minimum: 6 }, if: -> { password_digest_changed? || new_record? && provider.blank? }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = SecureRandom.hex(15) if user.password_digest.blank?
      user.name = auth.info.name
      user.avatar_url = auth.info.image
    end
  end
end
