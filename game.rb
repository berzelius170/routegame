require 'bundler'
Bundler.require

def checkWin(choice,sum)
  if choice == "even"
    if sum.even? == true
      "Player win"
    else
      "Computer win"
    end
  elsif choice == "odd"
    if sum.odd? == false
      "Player win"
    else
      "Computer win"
    end
  else
     "Wrong choice input. Structure is as follows:\n/odds/:choice/:object"
  end
end

get '/odds/:choice/:number' do
  player = params[:number]
  computer = rand(3)
  choice = params[:choice]

  string1 = "Player throws #{player}, computer throws #{computer}. Choice was #{choice}."
  sum = player.to_i + computer
  string2 = checkWin(choice,sum)
  "#{string1}<br>" + "#{string2}"

end



