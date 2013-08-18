$(document).ready(function(){
  var ctx = $('#questionDisplay').get(0).getContext('2d');
  generatedChartForSelectedOption();

  function generateChartForQuestion(questionID) {

    function generateChart(data) {
      new Chart(ctx).Doughnut(data);
    };

    var request = $.ajax({
      url: '/protected/surveys/questions/' + questionID + '/chart_data',
      type: 'get',
      dataType: 'json'
    });

    request.done(function(chartData){
      console.log(chartData);
      generateChart(chartData);
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
