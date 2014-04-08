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

  describe '#show' do

    context 'with existing package' do
      package_id = 'da4877f0-0a05-49b3-bf59-d8fd2896566c' 
      let(:result) { subject.show(package_id) } 

      it 'should return a list of the matching package' do
        result.should be_kind_of Hash
        result['id'].should eq(package_id)
      end
    end
  end
end
