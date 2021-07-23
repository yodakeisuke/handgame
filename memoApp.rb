
require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"
@memo_type = gets.to_s

puts "拡張子を除いたファイル名を入力してください"
@file_name = gets

puts "メモしたい内容を入力してください"
puts "完了したらCNTL + Dを押してください"

#改行除去＋""囲いたい
@inputs = readlines
@inputs.each do |input|
  input.chomp!
  input = "\"" + input + "\""
  puts input
end

#逆に破壊的変更？になっていない？
puts @inputs

if @memo_type = "1"

  # ファイルへ書き込み
  CSV.open("#{@file_name}.csv", "w") do |csv|
      csv << @inputs
  end
else  
  puts "1以外"
end
