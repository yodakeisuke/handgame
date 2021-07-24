
require "csv"

#新規か編集か入力を受ける
def require_memotype
  puts "1(新規でメモを作成) 2(既存のメモ編集する)"
  memo_type = gets.to_s
  memo_type.chomp!
#入力が1か2以外の時は終了
  if memo_type != "1" and 
     memo_type != "2"
    puts "1か2を指定してください"
    exit
  end
  return memo_type
end

#ファイル名の入力を受ける
def require_filename
  puts "拡張子を除いたファイル名を入力してください"
  file_name = gets
  file_name.chomp!
  return file_name
end

#メモ本文の入力を受ける
def require_text
  puts "メモしたい内容を入力してください"
  puts "完了したらCNTL + Dを押してください"
  text = readlines
#入力内容に改行が入るため除去
  text.each do |column|
    column = column.chomp!
  end
  return text
end

def edit_csv
#メモタイプに応じcsvのモードを設定  
  if @memo_type == "1"
    csv_mode = "w"  
  elsif @memo_type == "2" 
    csv_mode = "a"
  end
#CSVへ書き出し
  begin
    CSV.open("#{@file_name}.csv", "#{csv_mode}") do |csv|
      csv << @text
    end
  puts "書き込みを行いました#{@file_name}.csv"
  rescue Exception => e
    puts e.message
    puts e.backtrace.inspect
    puts "書き込みが失敗しました"
  end
end

#開始
@memo_type = require_memotype
@file_name = require_filename
@text = require_text
edit_csv
#終了
