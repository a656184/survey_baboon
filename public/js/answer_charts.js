$(document).ready(function(){

  generatedChartForSelectedOption();

  function generateChartForQuestion(questionID) {

    function generateChart(data) {
      var ctx = $('#questionDisplay').get(0).getContext('2d');
      new Chart(ctx).Doughnut(data);
    };

    function generateLegend(data) {
      var legend = $('#chartLegend');
      legend.text('');
      $(data).each(function(idx, choice){
        console.log(choice.color + '=' + choice.label);

        var colorSplotch = "<div class='color-splotch' style='background-color: " + choice.color + "' ></div>"
        var label = "<div class='chart-label'>" + choice.label + "</div>"
        var legendItem = colorSplotch + label + '<br>';

        legend.append(legendItem );
      });
    }

    var request = $.ajax({
      url: '/protected/surveys/questions/' + questionID + '/chart_data',
      type: 'get',
      dataType: 'json'
    });

    request.done(function(chartData){
      // console.log(chartData);
      generateChart(chartData);
      generateLegend(chartData);
    });

  };

  function generatedChartForSelectedOption(){
    $('select#questionSelect option:selected').each(function(){
      var questionID = $(this).attr('value');
      generateChartForQuestion(questionID);
    });
  };

  $('select#questionSelect').change(function(){
    generatedChartForSelectedOption();
  });

});
