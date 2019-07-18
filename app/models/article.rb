class Article < ApplicationRecord

	after_initialize :afteri
	before_update :beforeu
	after_update :afteru


	has_many :comments, dependent: :destroy
	validates :title, presence: true,
                    length: { minimum: 5 }

    validates_associated :comments
    
	def self.foo
		where('title = ?', 'Hamza Awais')
    end

    def self.foo
    	where('title = ?', 'Jibran Usman')
    end

private
    def afteri
    	self.title << 'After initialize'
  	end

  	def beforeu
    	self.title << 'Before Update'
  	end

  	def afteru
    	self.title << 'After Update'
  	end
end
