class HomeController < ApplicationController
  before_action :require_login

  include HomeHelper

  def index
  end

  def statistics
    pie_aux
    @appeared = pie

    tickets_aux
    @char_ticket = tickets

    extras_aux
    @char_extra = extras
  end

  def pie_aux
    @total_part = Participant.pluck(:appeared).size
    @total_total_part_true = Participant.pluck(:appeared).select { |a| a == true }.size
    @percent = (@total_total_part_true.to_f / @total_part) * 100
    @number_of_participants = Participant.all.size
  end

  def tickets_aux
    @typ =  Ticket.pluck('DISTINCT kind')
    @typ_ids = Ticket.pluck('id')
    @number = []
    @typ_ids.each do |t|
      @number << Participant.pluck(:ticket_id).select { |a| a == t }.size
    end
  end

  def extras_aux
    @extras =  Extra.pluck('DISTINCT kind')
    @extras_ids = Extra.pluck('id')
    @number = []
    @extras_ids.each do |t|
      @number << Partextra.pluck(:extra_id).select { |a| a == t }.size
    end
  end
end
