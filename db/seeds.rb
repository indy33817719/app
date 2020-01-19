100.times do |n|
  Article.create(title: "ブログ始めました#{n}回目", subtitle: "#{n}回目の投稿", body:"ラーメン食べました！#{n}回目")
end