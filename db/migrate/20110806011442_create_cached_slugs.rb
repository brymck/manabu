class CreateCachedSlugs < ActiveRecord::Migration
  def self.up
    # Add slugs
    add_column :exams,  :cached_slug,  :string
    add_column :levels, :abbreviation, :string
    add_column :levels, :cached_slug,  :string

    # Add uniqueness indexes
    add_index  :exams,  :cached_slug,  :unique => true
    add_index  :levels, :cached_slug,  :unique => true
  end

  def self.down
    remove_column :exams,  :cached_slug
    remove_column :levels, :abbreviations
    remove_column :levels, :cached_slug
  end
end
