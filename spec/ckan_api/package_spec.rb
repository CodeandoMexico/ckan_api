require 'spec_helper'

describe CkanApi::Package do

  subject { CkanApi::Package }

  it { should respond_to(:list) }

  describe '#create' do
    before(:all){ CkanApi::Config.api_url = 'http://api.codeandomexico.org/api/3/' }
    let(:name) { generate_random_string }
    let(:key) { '7d85d965-67e5-4955-9706-46a5416b3ccc' }

    context 'only with name argument' do
      let(:result) { subject.create(name, key) }
      it 'should return a results hash with name' do
        result.should be_kind_of Hash
        result["name"].should eq(name)
      end
    end

    context 'with many optional arguments' do
      let(:body_params) do
        {notes: "This is a description",
         author: "Boby Tables",
         title: "This is a title",
         maintainer: "This is the maintainer"}
      end

      let(:result) { subject.create(name, key, body_params) }
      it 'should return new package with specified arguments' do
        puts result
        body_params.each do |k, v|
          result[k.to_s].should eq(v)
        end
      end
    end
  end

  describe '#delete' do
    before(:all){ CkanApi::Config.api_url = 'http://api.codeandomexico.org/api/3/' }
    let(:name) { generate_random_string }
    let(:key) { '7d85d965-67e5-4955-9706-46a5416b3ccc' }

    context 'with existing package' do
      before { subject.create(name, key) }
      it 'should delete package' do
        subject.delete(name, key)
        search = subject.search({q: name})
        search["count"].should be 0
      end
    end
  end

  describe '#update' do
    before(:all){ CkanApi::Config.api_url = 'http://api.codeandomexico.org/api/3/' }
    let(:name) { generate_random_string }
    let(:key) { '7d85d965-67e5-4955-9706-46a5416b3ccc' }

    context 'with existing package' do
      before { subject.create(name, key) }
      let(:body_params) do
        {notes: "This is a description",
         author: "Boby Tables",
         title: "This is a title",
         maintainer: "This is the maintainer"}
      end
      it 'should update and return package' do
        updated_package = subject.update(name, key, body_params)
        body_params.each do |k, v|
          updated_package[k.to_s].should eq(v)
        end
      end
    end

    context 'with a non-existing package' do
      it 'should return nil' do
        updated_package = subject.update(name, key, {author: "Error"})
        updated_package.should be nil
      end
    end
  end

  describe '#list' do

    before(:all){ CkanApi::Config.api_url = 'http://datamx.io/api/3/' }
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

    before(:all){ CkanApi::Config.api_url = 'http://datamx.io/api/3/' }
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
    before(:all){ CkanApi::Config.api_url = 'http://datamx.io/api/3/' }
    context 'with existing package' do
      package_id = 'da4877f0-0a05-49b3-bf59-d8fd2896566c' 
      let(:result) { subject.show(package_id) } 

      it 'should return a list of the matching package' do
        result.should be_kind_of Hash
        result['id'].should eq(package_id)
      end
    end
  end

  describe '#autocomplete' do
    before(:all){ CkanApi::Config.api_url = 'http://datamx.io/api/3/' }
    let(:string) { 'monte' }

    context 'without limits argument' do
      let(:result) { subject.autocomplete(string) }
      it 'should return an array of matching packages' do
        result.each do |match|
          match["match_displayed"].should match(string)
        end
      end
    end

    context 'with limit argument' do
      let(:limit) { 3 }
      let(:result) { subject.autocomplete(string, limit: limit ) }
      it 'should return an array of matches with a limit' do
        result.size.should be == limit
      end
    end

  end
end
