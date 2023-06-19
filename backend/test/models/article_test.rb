# == Schema Information
#
# Table name: articles
#
#  id          :bigint           not null, primary key
#  body        :text(65535)      not null
#  description :string(255)
#  slug        :string(255)      not null
#  title       :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_articles_on_title  (title) UNIQUE
#
require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
