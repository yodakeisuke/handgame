#じゃんけんおよびあっちむいてほいのジャッジ
class Judge
  #じゃんけんの勝者を保持
  attr_accessor :jyan_winner
  #第１引数側目線での勝敗を決定する
  def jyan_judge(first_hand,second_hand)
    #あいこの時
    if first_hand == second_hand
      puts "あいこです"
      return "restart" 
    end  
    #first_handが1:グー
    if first_hand == 1
      if second_hand == 2 
        puts "プレイヤーが攻撃の権利を得ます"
        @jyan_winner = "プレイヤー"
      end
      if second_hand == 3 
        puts "プレイヤーは回避してください"
        @jyan_winner = "コンピュータ"
      end      
    end
    #first_handが2:チョキ
    if first_hand == 2
      if second_hand == 3 
        puts "プレイヤーが攻撃の権利を得ます"
        @jyan_winner = "プレイヤー"
      end
      if second_hand == 1 
        puts "プレイヤーは回避してください"
        @jyan_winner = "コンピュータ"
      end     
    end   
     #first_handが3:パー
    if first_hand == 3
      if second_hand == 1 
        puts "プレイヤーが攻撃の権利を得ます"
        @jyan_winner = "プレイヤー"
      end
      if second_hand == 2 
        puts "プレイヤーは回避してください"
        @jyan_winner = "コンピュータ"
      end     
    end
    #あいこでなければ次のゲームを進める情報を返す
    puts "-----------------------------------"
    return "next"
    
  end
  
  #あっちむいてほいの勝敗の結果を返す
  #第１引数側目線での勝敗を返す
  def hoi_judge(first_finger,second_finger)
    #２者が指した方向のあたりハズレを返す
    if first_finger == second_finger
      puts "-----------------------------------"
      puts "#{@jyan_winner}の勝利です"
      puts "-----------------------------------"
      return "finish"
    else  
      puts "-----------------------------------"
      return "restart"
    end
  end
  
end