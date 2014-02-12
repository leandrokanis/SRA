# -*- encoding : utf-8 -*-
class Aluno < ActiveRecord::Base
  acts_as :user
  attr_accessible :matricula
	
	devise :ldap_authenticatable

  validates_uniqueness_of :matricula
  validates_numericality_of :matricula , greater_than: 0
end
