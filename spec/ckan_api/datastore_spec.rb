require 'spec_helper'

describe CkanApi::Datastore do

  subject { CkanApi::Datastore }

  it { should respond_to(:search) }

  describe '#search' do

    context 'without options argument' do
      let(:result) { subject.search('b02a85bb-7269-48f2-81ad-3e0e9ec5d843') }

      it 'should return a resource result' do
        result.should be_kind_of Hash
        result.should have_key('fields')
        result.should have_key('records')
      end

    end

    context 'with options artument' do
      let(:result) { subject.search('b02a85bb-7269-48f2-81ad-3e0e9ec5d843', {limit: '5'}) }

      it 'should return 5 resources per result' do
        result.should be_kind_of Hash
        result['records'].count.should be(5)
      end
    end

  end
end
