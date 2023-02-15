# frozen_string_literal: true

class EmotionAI
  require 'selenium-webdriver'

  def initialize
    @session = Selenium::WebDriver.for :chrome
    @session.manage.timeouts.implicit_wait = 10
  end

  def open
    @session.navigate.to 'https://emotion-ai.userlocal.jp/'
  end

  def input(sentence)
    form = @session.find_element(:id, 'inputArea')
    form.send_keys(sentence)
    form.submit
  end

  def is_angry?(sentence)
    input(sentence)
    result_text = @session.find_element(:id, 'emotionText')
    result_text.text == '怒りの感情が強い文章です'
  end
end
