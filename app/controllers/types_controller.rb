# -*- encoding : utf-8 -*-
class TypesController < ApplicationController
  # GET /types
  # GET /types.json
  load_and_authorize_resource :except => [:type_by_place]

  def index
    @types = Type.all(:order => ('name ASC'))

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @types }
    end
  end


  # GET /types/new
  # GET /types/new.json
  def new
    @type = Type.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @type }
    end
  end

  # GET /types/1/edit
  def edit
    @type = Type.find(params[:id])
  end

  # POST /types
  # POST /types.json
  def create
    @type = Type.new(params[:type])

    respond_to do |format|
      if @type.save
        format.html { redirect_to types_url, notice: 'Tipo de Atendimento criado com sucesso.' }
        format.json { render json: @type, status: :created, location: @type }
      else
        format.html { render action: "new" }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /types/1
  # PUT /types/1.json
  def update
    @type = Type.find(params[:id])

    respond_to do |format|
      if @type.update_attributes(params[:type])
        format.html { redirect_to types_url, notice: 'Tipo de Atendimento alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /types/1
  # DELETE /types/1.json
  def destroy
    @type = Type.find(params[:id])
    @type.destroy

    respond_to do |format|
      format.html { redirect_to types_url, notice: 'Tipo de Atendimento deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  def type_by_place
    @type = Place.find(params[:id]).types.order('name ASC')

    respond_to do |format|
      format.js { render json: @type }
    end
  end
end