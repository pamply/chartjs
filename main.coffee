Chart = require('chart.js')

canvas = document.getElementById("canvas")

generateData = ->
  data = []
  time = new Date().getTime()
  offset = 5*60*1000
  for i in [1..60]
    value = Math.round(Math.random()*10000)
    time += offset
    data.push(x: time, y:value)
  return data

data =
  datasets: [{
      label: '# of Votes'
      backgroundColor: "rgba(75,192,192,0.4)"
      borderColor: "rgba(75,192,192,1)"
      data: generateData()
      fill: false
      borderWidth: 5
  }]

options =
  responsive: true
  scales: {
    xAxes: [{
      type: 'time'
      time: {
        unit:'hour'
      }
      position: 'top'
      ticks: {
        min:0
        max: 10
        maxTicksLimit: 5
      }
    }]
    yAxes: [{
      type: 'linear'
      ticks: {
        min: 0
        max: 100
        maxTicksLimit: 3

      }
    }]

  }

myChart = new Chart(canvas, {
  type:   'line'
  data:    data
})
