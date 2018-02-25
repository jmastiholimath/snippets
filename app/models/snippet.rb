#------------------------------------------------------------------------------
# Snippet Model
#
# Name                      SQL Type             Null    Default Primary
# ------------------------- -------------------- ------- ------- -------
# id                        integer              false           true
# description               text                false           false
# private                   boolean          false
#
#------------------------------------------------------------------------------

class UnicodeLengthValidator < ActiveModel::Validator
  def validate(record)
    if record.description.mb_chars.size > 8192
      record.errors[:base] << "Length Outside range"
    end
  end
end


class Snippet < ActiveRecord::Base
	attr_accessor :description_short
	#validation
	include ActiveModel::Validations
	validates :description, presence: true
	validates_with UnicodeLengthValidator

	def description_short
		self.description_short= self.description.truncate(15)
	end
end
