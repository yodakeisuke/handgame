require './handgame_modules.rb'

#人間のプレイヤー
class Player
  include Hands
  attr_accessor :hand,:finger
  
#じゃんけんの出す手を決定する
  def decide_hand
#出す手を受け取る    
    puts <<-SHOUT
    じゃんけん…
    ・半角数値を入力して手を決定#{HAND_TYPE} 
    ・1〜3以外を入力{終了}
    SHOUT
    @hand = gets.to_i
   #出した手を表示
    if HAND_TYPE.has_key?(@hand)
      puts "ポイ！"
      puts "-----------------------------------------"
      puts "あなたは、#{HAND_TYPE[@hand]}を出しました"
    #1〜3以外が入力されたら終了   
    else
      puts "やっぱやめた"
      exit!
    end
  end
  
  #あっちむいてほいの出す指を決定する
  def decide_finger
    #出す指を受け取る 
    puts <<-SHOUT
    あっちむいて…
    ・半角数値を入力して方角を決定#{FINGER_TYPE} 
    ・1〜4以外を入力{終了}
    SHOUT
    @finger = gets.to_i
    #出した指を表示
    if FINGER_TYPE.has_key?(@finger)
      puts "ホイ！"
      puts "-----------------------------------------"
      puts "あなたは、#{FINGER_TYPE[@finger]}を出しました"
    #1〜4以外が入力されたら終了 
    else
      puts "やっぱやめた"
      exit!
    end
  end  
end

#コンピュータの対戦相手
class NonPlayer
  include Hands
  attr_accessor :hand,:finger
#じゃんけんの出す手を生成する
  def generate_hand
  #出す手をランダムで決める
  @hand = HAND_TYPE.keys.to_a.sample.to_i
  puts "あいては、#{HAND_TYPE[@hand]}を出しました"
  end
  
 #あっちむいてほいの出す指を生成する
  def generate_finger
  #出す指をランダムで決める
  @finger = FINGER_TYPE.keys.to_a.sample.to_i
  puts "あいては、#{FINGER_TYPE[@finger]}を出しました"
  end
  
end
