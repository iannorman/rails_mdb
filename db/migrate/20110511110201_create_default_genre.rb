class CreateDefaultGenre < ActiveRecord::Migration
  def self.up
    genre = Genre.create!(:name => 'Default')
    Film.all.each do |film|
      genre.films << film
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
