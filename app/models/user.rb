class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :shopping_carts
  has_many :addresses
  has_many :orders

  attr_accessor :password_confirmation

  validates :email, presence: {message: "请输入邮箱"}
  validates :email, uniqueness: {message: "邮箱已注册"}
  validates :password, presence: {message: "请输入密码"}, if: :need_validate_password
  validates :password, length: {minimum: 6, message: "密码需不少于6位"}, if: :need_validate_password
  validates :password_confirmation, presence: {message: "请重复输入密码"}, if: :need_validate_password

  validates :password, confirmation: {message: "两次密码不一致"}, if: :need_validate_password


  def need_validate_password
    self.new_record? || (!self.password.nil? || !self.password_confirmation.nil?)
  end

end
