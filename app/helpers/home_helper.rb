module HomeHelper
  def pie
    LazyHighCharts::HighChart.new('pie') do |f|
      f.chart(defaultSeriesType: 'pie', margin: [50, 200, 60, 170])
      series = { type: 'pie', name: 'Participants appeared', data: [['Appeared', @percent], ["Didn't appear", 100 - @percent]] }
      f.series(series)
      f.options[:title][:text] = 'Participants'
      f.legend(layout: 'vertical', style: { left: 'auto', bottom: 'auto', right: '50px', top: '100px' })
      f.plot_options(pie: { allowPointSelect: true, cursor: 'pointer', dataLabels: { enabled: true, color: 'black', style: { font: '10px Trebuchet MS, Verdana, sans-serif' } } })
    end
  end

  def tickets
    LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: 'Number of Participants per Ticket')
      f.xAxis(categories: @Typ)
      f.series(name: 'Participants', yAxis: 0, data: @number)
      f.yAxis [{ allowDecimals: false, title: { text: 'Participants', margin: 70 } }]
      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      f.chart(defaultSeriesType: 'column')
    end
  end

  def extras
    LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: 'Number of Participants per Extra')
      f.xAxis(categories: @extras)
      f.series(name: 'Participants', yAxis: 0, data: @number)
      f.yAxis [{ allowDecimals: false, title: { text: 'Participants', margin: 70 } }]
      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      f.chart(defaultSeriesType: 'column')
    end
  end
end
