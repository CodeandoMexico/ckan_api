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

end
