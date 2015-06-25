class HomeController < ApplicationController
  before_action :require_login

  def index
  end

  def statistics
	@total_part= Participant.pluck(:appeared).size
  	@total_total_part_true = Participant.pluck(:appeared).select {|a| a == true}.size
  	@percent = (@total_total_part_true.to_f  / @total_part) *100

  	@number_of_participants= Participant.all.size

  	


	@appeared = LazyHighCharts::HighChart.new('pie') do |f|
	      f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
	      series = {
	               :type=> 'pie',
	               :name=> 'Participants appeared',
	               :data=> [
	                  ['Appeared', @percent],
	                  ["Didn't appear", 100-@percent]
	               ]
	      }
	      f.series(series)
	      f.options[:title][:text] = "Participants"
	      f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
	      f.plot_options(:pie=>{
	        :allowPointSelect=>true, 
	        :cursor=>"pointer" , 
	        :dataLabels=>{
	          :enabled=>true,
	          :color=>"black",
	          :style=>{
	            :font=>"10px Trebuchet MS, Verdana, sans-serif"
	          }
	        }
	      })
	end

	@Types=  Ticket.pluck('DISTINCT kind')
	@Types_ids = Ticket.pluck('id')

	@number=[]
	@Types_ids.each do |t|
		@number << Participant.pluck(:ticket_id).select {|a| a == t}.size
	end


    @char_ticket = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => "Number of Participants per Ticket")
        f.xAxis(:categories => @Types)
        f.series(:name => "Participants", :yAxis => 0, :data => @number)

        f.yAxis [
          {allowDecimals: false,:title => {:text => "Participants", :margin => 70} },
        ]

        f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
        f.chart({:defaultSeriesType=>"column"})
    end


    @extras=  Extra.pluck('DISTINCT kind')
	@extras_ids = Extra.pluck('id')

	@number=[]
	@extras_ids.each do |t|
		@number << Partextra.pluck(:extra_id).select {|a| a == t}.size
	end


    @char_extra = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => "Number of Participants per Extra")
        f.xAxis(:categories => @extras)
        f.series(:name => "Participants", :yAxis => 0, :data => @number)

        f.yAxis [
          { allowDecimals: false,:title => {:text => "Participants", :margin => 70} },
        ]

        f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
        f.chart({:defaultSeriesType=>"column"})
    end
  end
end
