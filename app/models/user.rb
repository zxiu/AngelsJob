class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable
  enum role: [:user, :admin]
  has_one :personal_info
  has_many :education_infos
  has_many :career_infos
  has_many :skills
  has_and_belongs_to_many :agents
  has_many :intents

  def personal_info_checked?
    true
  end

  def education_infos_checked?
    true
  end

  def career_infos_checked?
    true
  end

  def skills_checked?
    true
  end

end
