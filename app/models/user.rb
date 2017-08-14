class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :shopping_carts
  has_many :addresses
  has_many :orders

  attr_accessor :password_confirmation

  validates :email, presence: {message: "请输入邮箱"}
  validates :email, uniqueness: {message: "邮箱已注册"}
  validates :password, presence: {message: "请输入密码"}, unless: Proc.new{ |a| a.email.blank? }
  validates :password, length: {minimum: 6, message: "密码需不少于6位"}, unless: Proc.new{ |a| a.password.blank? }
  validates :password_confirmation, presence: {message: "请重复输入密码"}, unless: Proc.new{ |a| a.password.length < 6 }

  validates :password, confirmation: {message: "两次密码不一致"}, unless: Proc.new{ |a| a.password_confirmation.blank? }

end
