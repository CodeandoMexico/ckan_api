require 'spec_helper'

describe CkanApi::Package do

  subject { CkanApi::Package }

  it { should respond_to(:list) }

  describe '#list' do

    context 'without arguments' do
      let(:result) { subject.list() }

      it 'should return a results list' do
        result.should be_kind_of Array
      end

    end

    context 'with limit arguments' do
      let(:result) { subject.list({ limit: 5 }) }

      it 'should return a list of 5 results' do
        result.should be_kind_of Array
        result.count.should be(5)
      end
    end

    context 'with limit and offset arguments' do
      let(:result) { subject.list({ limit: 5, offset: 10 }) }

      it 'should return a list of 5 results with 10 offset' do
        result.should be_kind_of Array
        result.count.should be(5)
      end
    end
  end

  describe '#search' do

    context 'without arguments' do
      let(:result) { subject.search }

      it 'should return a results list' do
        result.should be_kind_of Hash
      end
    end

    context 'with query parameter' do
      let(:result) { subject.search({q: "author:Santa Catarina"}) }

      it 'should return a list of matching packages' do
        result.should be_kind_of Hash
        result["results"].each do |package|
          package["author"].should eq("Santa Catarina")
        end
      end
    end
  end
end
