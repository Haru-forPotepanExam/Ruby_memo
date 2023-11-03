 require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます
 
 puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
 
 memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています
 
 # if文を使用して続きを作成していきましょう。
 # 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
 
 if memo_type == 1
   puts "拡張子を除いたファイル名を入力してください。"
   file_name = gets.chomp
   
   puts "メモの内容を入力してください。", "Ctrl+Dで保存します。"
   file_content = STDIN.read
   newfile = CSV.open("#{file_name}.csv", "w+") do |csv|
     csv << ["#{file_content}"]
   end
   
 elsif memo_type == 2
    puts "編集したいファイルの拡張子を除いたファイル名を入力してください。"
    file_name = gets.chomp
    
    puts "編集する内容を入力してください。", "Ctrl+Dで保存します。"
    file_content = STDIN.read
    existfile = CSV.open("#{file_name}.csv", "a") do |csv|
      csv << ["#{file_content}"]
    end
    
  else
    puts "1か2の数字を入力してください。"
  end