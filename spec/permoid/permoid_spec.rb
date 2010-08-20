require 'spec_helper'

class TestPermalinkClass
  include Mongoid::Document
  include Permoid::Base
  
  field :title
end

describe Permoid::Base do
  before :each do
    TestPermalinkClass.delete_all
  end
  
  describe 'permalink' do
    it 'should have the method' do
      TestPermalinkClass.new.respond_to?(:set_permalink).should eql(true)
    end
    
    it 'should be a Mongoid::Document object' do
      TestNoMongoidClass = Struct.new(:title)
      lambda do
        TestNoMongoidClass.send(:include, Permoid::Base)
      end.should raise_error
    end
    
    it 'should set the permalink' do
      test = TestPermalinkClass.create(:title => 'test permalink')
      test.permalink.should eql('test-permalink')
    end
    
    it 'should set a fixed permalink' do
      test = TestPermalinkClass.new(:title => 'test permalink')
      test.set_permalink 'blah'
      test.permalink.should eql('blah')
    end
    
    it 'should not have twice the same permalink' do
      test = TestPermalinkClass.create(:title => 'test permalink')
      test.permalink.should eql('test-permalink')
      
      second = TestPermalinkClass.create(:title => 'test permalink')
      second.permalink.should eql('test-permalink-1')
    end
    
    it 'should increment if there are more than twice the same permalink' do
      test = TestPermalinkClass.create(:title => 'test permalink')
      test.permalink.should eql('test-permalink')
      
      second = TestPermalinkClass.create(:title => 'test permalink')
      second.permalink.should eql('test-permalink-1')
      
      third = TestPermalinkClass.create(:title => 'test permalink')
      third.permalink.should eql('test-permalink-2')
    end
    
    it 'should not increment if the permalink is the current object' do
      test = TestPermalinkClass.create(:title => 'test permalink')
      test.permalink.should eql('test-permalink')
      
      test.save!
      test.permalink.should eql('test-permalink')
    end
    
    it 'should return the permalink' do
      test = TestPermalinkClass.create(:title => 'test permalink')
      test.to_param.should eql(test.permalink)
    end
  end
end
