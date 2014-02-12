# -*- encoding : utf-8 -*-
require 'cancan'
class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  protect_from_forgery
  include ApplicationHelper

  
  def after_sign_in_path_for(resource)
    new_atendimento_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    exception.default_message = "Você não possui permissão para acessar esta área"
    flash[:error] = exception.message
    redirect_as_user (current_user)
  end


  def redirect_as_user(user)

    begin
      if current_user.as_user_type ==  'Aluno'
        redirect_to new_atendimento_path
      elsif current_user.as_user_type == 'Professor'
        redirect_to new_atendimento_path
      elsif current_user.as_user_type == 'Servidor'
        redirect_to atendimentos_path
      elsif current_user.as_user_type == 'Comunidade'
        redirect_to new_atendimento_path
      end
    rescue => e
      redirect_to root_path
    end
  end
end