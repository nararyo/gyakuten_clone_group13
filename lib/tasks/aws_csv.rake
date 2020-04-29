namespace :aws_csv do

  desc "csvファイルのデータをaws_textsテーブルにインポートする"
  task aws_texts: :environment do
    path = File.join Rails.root, "db/csv_data/aws_text_data.csv"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
        title: row["title"],
        content: row["content"]
      }
    end
    puts "インポート処理開始"

    begin
      AwsText.create!(list)
      puts "インポート完了"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗しました:UnknownAttributeError"
    end
  end

end
