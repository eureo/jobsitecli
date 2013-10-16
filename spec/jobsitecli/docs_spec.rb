require 'spec_helper'
require 'json'

describe Jobsitecli::Doc do

  describe "#create" do
    let(:file) { File.new(File.join(File.dirname(__FILE__), "../support/docs/formulaire.pdf")) }
    let(:params) { { doc: { oldid: 12, file: file, title: "foo" }}}
    let(:doc) { Jobsitecli::Doc.new }
    it "add doc to jobsite" do
      with_configuration(host: 'localhostes', port: 3000, token: '7e3491081d372f7fc294f8e558c1d774') do
        doc.create(params)
        object = JSON.parse(doc.last_response)
        object['created_at'].should_not be_nil
        object['created_at'].should == object['updated_at']
      end
    end
    after do
      doc.delete(params[:doc][:oldid])
    end
  end

  # cannot test update because of IO stream error

end
