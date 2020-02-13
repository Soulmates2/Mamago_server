class DialogService

  # Dialog 생성
  def self.create_dialog(target:, source:, user:)
    question = Question.all.sample
    dialog = Dialog.create!(user: user, target: target.to_i, source: source.to_i, question: question)
    dialog
  end

  # Dialog 업데이트
  def self.update_dialog(dialog, original: nil, feedback: nil, user_intention: nil, complete: nil)
    source = dialog.source # ko
    target = dialog.target # en -> 사용자의 입력 언어
    update_params =
      # 사용자의 입력을 받아 번역과 예상 의도를 업데이트
      if original.present?
        translated = translate(source: target, target: source, text: comprehand)
        comprehended = translate(source: source, target: target, text: original)
        { original: original, comprehended: comprehended, translated: translated }

      # 사용자의 피드백을 받아 저장
      elsif feedback.in? [true, false]
        { feedback: feedback }

      #사용자의 의도를 받아 최종 번역
      elsif user_intention.present?
        user_intention_translated = translate(source: source, target: target, text: user_intention)
        { user_intention: user_intention, user_intention_translated: user_intention_translated }

      # 끝났는지 확인
      elsif complete.in? [true, false]
        { complete: complete }
      end

    dialog.update!(update_params)
  end

  private

  def translate(source:, target:, text:)
    res = SimpleRequest::Naver::Translate.new.call(
      source: source,
      target: target,
      text: text
    )

    res = OpenStruct.new(res)
    res.data.message.result.translatedText
  end
end