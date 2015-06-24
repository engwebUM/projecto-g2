class Extra < ActiveRecord::Base
  has_many :partextras

  @teste=1234

  def self.test
    @teste
  end

  def self.set_test(p)
  	@teste=p
  end
end
