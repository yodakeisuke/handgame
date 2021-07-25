require './actor.rb'
require './judge.rb'

#各インスタンスを生成
def setup_game
  plr = Player.new
  npc = NonPlayer.new 
  judge = Judge.new
  return actors = {:plr => plr, :npc => npc,:judge => judge}
end

#あっちむいてほいを行う
def move_hoi_game(actors)
  #プレイヤーの指選択
  actors[:plr].decide_finger
  #コンピュータの指選択
  actors[:npc].generate_finger
  #勝敗を判定
  progress = actors[:judge].hoi_judge(actors[:plr].finger,actors[:npc].finger)
  #あいこならじゃんけんをもう一度
  start_game(actors) if progress == "restart"
end

#じゃんけんを行う
def start_game(actors)
  #プレイヤーの手選択
  actors[:plr].decide_hand
  #コンピュータの手選択
  actors[:npc].generate_hand
  #勝敗を判定
  progress = actors[:judge].jyan_judge(actors[:plr].hand,actors[:npc].hand)
  
  #あいこならじゃんけんをもう一度
  start_game(actors) if progress == "restart"
  #勝敗が決したならあっちむいてほいへ進む
  move_hoi_game(actors) if progress == "next"
end

#===スタートポイント===
begin
  actors = setup_game
  start_game(actors)
rescue Exception => e
  puts e.message
  puts e.backtrace.inspect
  puts "エラーが発生しました"
end
#===エンド===