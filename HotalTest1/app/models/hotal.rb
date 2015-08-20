class Hotal < ActiveRecord::Base
  attr_accessible :address, :is_admin, :lat, :lon, :name, :password, :status, :tel, :username
  
  validates_presence_of :address, :message => '请输入地址。'
  validates_presence_of :is_admin, :message => '请输入0或1。' 
  validates_presence_of :lon, :message => '请输入0～180数字。'
  validates_presence_of :lat, :message => '请输入0～180数字。'
  validates_presence_of :name, :message => '请输入店名。'
  validates_presence_of :password, :message => '请输入密码。'
  validates_presence_of :status, :message => '请输入0或1。'
  validates_presence_of :tel, :message => '请输入电话号码。'
  validates_presence_of :username, :message => '请输入用户名。'
  
  
  def self.login(name, password)
    password = md5(password || "")  
  end 
  def self.md5(pass)  
    Digest::MD5.hexdigest("--my-salt--#{pass}")  
  end  


end
