require 'spec_helper'

describe CkanApi::Resource do

  subject { CkanApi::Resource }

  it { should respond_to(:show) }

  describe '#show' do

    context 'with a resource id' do
      resource_id = 'b02a85bb-7269-48f2-81ad-3e0e9ec5d843'
      let(:result) { subject.show(resource_id) }

      it 'should return a resource that matches the provided id' do
        result.should be_kind_of Hash
        result['id'].should eq(resource_id)
      end
    end

  end

  describe '#search' do

    context 'with query argument only' do
      let(:result) { subject.search({name: 'personas', format: 'XLS'}) }

      it 'should return a list of matching resources' do
        result.should be_kind_of Hash
        result['results'].each do |resource|
          resource['name'].should match(%r{#{'personas'}}i)
          resource['format'].should eq('XLS')
        end
      end

    context 'with limit and query arguments' do
      let(:result) { subject.search({name: 'personas'}, {limit: 5}) }

      it 'should return a 5 elements list' do
        result.should be_kind_of Hash
        result['results'].count.should be(5)
      end
    end

    end
  end

end
