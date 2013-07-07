class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :image_url
      t.string :tagline
      t.string :twitter_url
      t.string :linkedin_url
      t.string :github_url
      t.string :blog_url
      t.string :treehouse_url
      t.string :codeschool_url
      t.string :coderwall_url

      t.timestamps
    end
  end
end
