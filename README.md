# README

新しいことに挑戦することが好きなので、その一歩目を踏み出し安いSNSサイトを作りたいと考えました。  
趣味とcommitを合わせて、Shummitという名前にしました。

# name
<img width="1440" alt="スクリーンショット 2020-02-25 18 59 05" src="https://user-images.githubusercontent.com/57954776/75236426-1c3a0f00-5801-11ea-8981-af554cc01659.png">
 Shummit
趣味で繋がるSNSサイト。  
Userがイベントを立ち上げ、他のUserがそのイベントに参加することができます。    
開催場所をgoogleAPIを使いMap表示させたり、イベントに参加しているグループメンバー間でやりとりできます。  

# VPC
<img width="1286" alt="スクリーンショット 2020-03-10 15 10 31" src="https://user-images.githubusercontent.com/57954776/76287854-caa58000-62e8-11ea-863c-6497d5fe2fb6.png">


# Dependency

*ruby 2.5.7p206  
*bootstrap-sass","~>3.3.6"  
*Rails 5.2.4.1  
*gem 2.7.6.2  

# gem
*gem "devise"(認証機能の実装)  
*gem "paranoia"（論理削除の実装）  
*gem "kaminari","~>1.1.1"（ページネーションの実装）  
*gem "bootstrap-sass","~>3.3.6"（ブートストラップの実装）  
*gem "jquery-rails"（jqueryの実装）  
*gem 'jp_prefecture'（都道府県名の取得）  
*gem "refile", require: "refile/rails", github: 'manfe/refile'  
*gem "refile-mini_magick"（画像の表示）  
*gem "pry-byebug"（デバック）  
*gem 'rails-i18n'（日本語化対応）  
*gem 'ransack'（検索機能）  
*gem 'rubocop', require: false  (コードの自動修正)
*gem 'rubocop-rails'  （コードの自動修正）

# Setup
*$ git clone https://github.com/keigo10/Shummit.git  
*$ cd Shummit  
*$ bundle install  
*$ rails db:migrate  
*　eventのshowページにあるAPI_KEYはご自身のKEYをご使用ください。  

# Usage
管理者側：  
*User情報を管理  
*イベントのジャンルの追加および管理  
*イベント情報の管理  
User側：  
*ユーザー情報の登録および変更  
*イベントの立ち上げ及び情報の変更  
*他のUserが立ち上げたイベントに参加し、掲示板にてやり取りする。  

# Authors
[keigo10](https://github.com/keigo10)

# References
https://qiita.com/38lvd3/items/c1a44abfd5cb8eb14bd3  
https://qiita.com/savaniased/items/ce7dd5a825ad0f6be53c  
https://qiita.com/tanutanu/items/7ce8826615f1af605164
