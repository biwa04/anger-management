# frozen_string_literal: true

class EmotionAI
  require 'selenium-webdriver'

  def initialize(session = nil, status = :initial)
    @session = session || (Selenium::WebDriver.for :chrome)
    @session.manage.timeouts.implicit_wait = 10
    @status = status
    # status: initial, open, result
  end

  def result(sentence)
    open
    submit(sentence)

    return if @status != :result

    @session.find_element(:id, 'emotionText').text
  end

  private

  def open
    @session.navigate.to 'https://emotion-ai.userlocal.jp/'
    @status = :open
  end

  def submit(sentence)
    return if @status != :open

    form = @session.find_element(:id, 'inputArea')
    form.send_keys(sentence)
    form.submit

    @status = :result
  end
end
