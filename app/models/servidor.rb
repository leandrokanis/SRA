# -*- encoding : utf-8 -*-
class Servidor < ActiveRecord::Base
  acts_as :pessoa
  attr_accessible :matricula

  validates_uniqueness_of :matricula

end
