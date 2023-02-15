# frozen_string_literal: true

require 'bundler/setup'
require 'discordrb'
require './libs/emotion_ai'

bot = Discordrb::Bot.new token: ENV['DISCORD_BOT_TOKEN']
emotion_ai = EmotionAI.new

bot.message do |event|
  puts event.content
  event.send_message("表現警察です！\nちくちく言葉やめてください！ふわふわ言葉を使いましょう！\n表現警察でした") if emotion_ai.angry?(event.content)
end

bot.run
