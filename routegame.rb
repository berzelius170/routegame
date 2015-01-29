require 'bundler'
Bundler.require

$options = ['scissors', 'paper', 'rock']

def loses_to(option)
  option_index = $options.index(option)
  loses_to_index = option_index - 1
  $options[loses_to_index]
end

get '/' do
  redirect '/throw/rock'
end

get '/throw/:object' do
  player = params[:object]
  computer = $options.sample

  "Player throws #{player} and computer throws #{computer}. " + if player == computer
    'Tie!'
  elsif player == loses_to(computer)
    'Player wins!'
  else
    'Computer wins!'
  end
end