require 'spec_helper'
require 'json'

describe Jobsitecli::Page do

  describe "#create" do
    let(:params) { { page: { old_id: 12, title: "foo" }}}
    let(:page) { Jobsitecli::Page.new }
    it "add page to jobsite" do
      with_configuration(host: 'localhostes', port: 3000, token: '7e3491081d372f7fc294f8e558c1d774') do
        page.create(params)
        object = JSON.parse(page.last_response)
        object['created_at'].should_not be_nil
        object['created_at'].should == object['updated_at']
      end
    end
    after do
      page.delete(params[:page][:old_id])
    end
  end

  # cannot test update because of IO stream error

end
