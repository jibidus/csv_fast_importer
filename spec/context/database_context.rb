shared_context 'test_kaamelott table with columns row_index, id and label' do
  include DatabaseHelper

  before do
    ActiveRecord::Base.connection.execute <<-SQL
      DROP TABLE IF EXISTS test_kaamelott;
      CREATE TABLE test_kaamelott ( row_index int4 NULL, id serial NOT NULL, label varchar(32) NOT NULL );
    SQL
  end

  def row_count
    sql_select('SELECT COUNT(*) FROM test_kaamelott').to_i
  end
end
