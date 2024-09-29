class LeatherColor < ApplicationRecord
    validates :color, presence: true, uniqueness: true
    # validates :image_url, presence: true
    validates :abbreviation, uniqueness: true, allow_nil: true

    before_validation :generate_unique_abbreviation, on: :create

    private

    def generate_unique_abbreviation
      Rails.logger.info("Generating abbreviation for color: #{color}")
      return if color.blank?

      words = color.split

      # Step 1: Try first letters capitalized
      self.abbreviation = words.map { |word| word[0].upcase }.join
      Rails.logger.info("Step 1 abbreviation: #{abbreviation}")
      return unless self.class.exists?(abbreviation: abbreviation)

      # Step 2: Add second letters lowercase
      self.abbreviation = words.map { |word| word[0].upcase + (word[1]&.downcase || "") }.join
      Rails.logger.info("Step 2 abbreviation: #{abbreviation}")
      return unless self.class.exists?(abbreviation: abbreviation)

      # Step 3: Add numbers until unique
      counter = 1
      loop do
        self.abbreviation = "#{abbreviation}#{counter}"
        Rails.logger.info("Step 3 abbreviation attempt: #{abbreviation}")
        break unless self.class.exists?(abbreviation: abbreviation)
        counter += 1
      end

      Rails.logger.info("Final abbreviation: #{abbreviation}")
    end
end
