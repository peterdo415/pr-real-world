# == Schema Information
#
# Table name: articles
#
#  id          :bigint           not null, primary key
#  body        :text(65535)      not null
#  description :string(255)
#  title       :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_articles_on_title  (title) UNIQUE
#
class Article < ApplicationRecord
  validates :title, :body, presence: true
  validates :title, uniqueness: true

  belongs_to :user

  def to_json(current_user = user)
    slug = title.gsub(/ /, '-')
    author = current_user.as_json(only: %i[username bio image])
    { 'article' => as_json({ only: %i[title discription body created_at updated_at] }).merge({ slug: }, { author: }) }
  end
end
