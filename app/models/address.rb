class Address < ApplicationRecord
  belongs_to :user
  validates :address_type, inclusion: { in: ["User", "Order"]}
  validates :address, presence: {message: "地址不能为空"}
  validates :name, presence: { message: "姓名不能为空" }
  validates :cellphone, presence: { message: "手机号码不能为空"}
  validates :cellphone, format: { with: /\A1[3,5,7,8][0-9]{9}\z/, message: "手机号码格式不正确"}, unless: proc { |x| x.cellphone.blank?}
end
