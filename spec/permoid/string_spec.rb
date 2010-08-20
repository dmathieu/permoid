require 'spec_helper'

describe Permoid::String do
  
  describe 'permalink' do
    it 'should have the method' do
      String.new.respond_to?(:to_permalink).should eql(true)
    end
    
    it 'should export a permalink' do
      "test".to_permalink.should eql('test')
    end
    
    it 'should lowercase' do
      "Test".to_permalink.should eql('test')
    end
  end
end
