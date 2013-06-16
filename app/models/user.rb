class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  before_create :set_default_role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  has_and_belongs_to_many :roles
  has_many :products

  def role?(role)
    !!self.roles.find_by_name(role)
  end

  private
    def set_default_role
      begin
        self.roles << Role.find_by_name('member')
      rescue ActiveRecord::RecordNotFound
          Role.create(name: 'member')
          retry
      end
    end
end
