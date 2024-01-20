#評価ポイントとコメントを入力するメソッド
def point_n_comment_input
    puts "1から5の数字で評価を入力してください。"
    point = gets.to_i #入力されたポイント
    while true
        if point <= 0 || point > 5 #0以下または5より大きい場合（1~5以外の入力だった場合）
            puts "1から5の数字を入力してください" #数字を入力してくださいと出力。
            point = gets.to_i #入力されたポイント
        else
            puts "コメントを入力してください"
            comment = gets #コメントを入力
            post = "ポイント：#{point} コメント：#{comment}" #post変数に格納
            File.open("data.txt","a") do |file| #fileクラスのopenメソッドでdata.txtを開く
                file.puts(post) #Fileクラスのputsメソッドでファイルの書き込みをする
            end
            break
        end                        
    end
end

#これまでの結果を表示するメソッド
def total_display
    puts "これまでの結果"
    File.open("data.txt","r") do |file|#fileクラスのopenメソッドでdata.txtを開く
        file.each_line do |line|
            puts line #ファイルの中に記載のある評価ポイントとコメントを出力する
        end 
    end
end

while true
    puts "実施したい処理を選択してください\n
        1:評価ポイントとコメントを入力する\n
        2:今までの結果を確認する\n
        3:終了する"
    num = gets.to_i #何をしたいのか決める変数
    case num
    when 1 #評価ポイントとコメントを入力する場合
        puts point_n_comment_input
    when 2 #今までの結果を確認する
        puts total_display
    when 3 #終了する
        puts "終了します"
        break
    else #1から3以外を入力された場合
        puts "1から3の数字を入力してください"
    end
end