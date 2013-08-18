helpers do
  def chart_data_for_question(question_id)
    question = Question.find_by_id(question_id)

    data = []
    colors = ["#113F8C",
              "#01A4A4",
              "#00A1CB",
              "#61AE24",
              "#D0D102",
              "#32742C",
              "#D70060",
              "#E54028",
              "#F18D05",
              "#616161"]

    question.choices.each do |choice|
      data << { value: choice.answers.count, color: colors.sample, label: choice.content }
    end

    return data.to_json
  end
end
