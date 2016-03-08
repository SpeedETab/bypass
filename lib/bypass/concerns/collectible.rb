module Bypass
  module Collectible
    include Enumerable
    
    attr_reader :members

    def initialize(list)
      @members = []
      list.each do |item|
        @members << member_class.new(item)
      end
    end

    def each(&block)
      @members.each do |member|
        block.call member
      end
    end

    def inspect
      @members.map do |member|
        member.inspect
      end
    end

    def params
      @members.map do |member|
        member.params
      end
    end

    def count
      @members.size
    end

    alias :size :count

    protected

    def member_class
      unless collection_regex === self.class.name
        raise "#{self.class.name} must end in 'Collection' or override #{self.class.name}#member_class"
      end

      klass = eval self.class.name.gsub(collection_regex, "")

      unless klass.is_a? Class
        raise "#{klass} must be defined as a Class."
      end

      klass
    end

    def collection_regex
      /Collection\z/
    end
  end
end
