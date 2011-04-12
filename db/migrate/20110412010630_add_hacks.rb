class AddHacks < ActiveRecord::Migration
  def self.up

    create_table :hacks do |t|
      t.integer   :user_id
      t.string    :title
      t.text      :description
      t.string    :source
      t.integer   :vote_count
      t.integer   :anonymous_vote_count
      t.string    :slug
      t.string    :short_url
    end

    create_table :votes do |t|
      t.integer   :user_id
      t.integer   :hack_id
      t.integer   :count
    end

    create_table :tags do |t|
      t.string    :title
      t.string    :slug
      t.integer   :master_tag_id
      t.integer   :hack_count
    end

    create_table :hack_tags do |t|
      t.integer   :hack_id
      t.integer   :tag_id
    end

    create_table :categories do |t|
      t.string    :title
      t.string    :slug
      t.integer   :hack_count
    end

    create_table :category_tags do |t|
      t.integer   :category_id
      t.integer   :tag_id
    end

  end

  def self.down
    drop_table :hacks
    drop_table :votes
    drop_table :tags
    drop_table :hack_tags
    drop_table :categories
    drop_table :category_tags
  end
end
