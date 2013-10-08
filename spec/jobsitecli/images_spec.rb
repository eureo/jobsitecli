require 'spec_helper'
require 'json'

describe Jobsitecli::Image do

  describe "#create" do
    let(:image_file) { File.new(File.join(File.dirname(__FILE__), "../support/images/santa.jpg")) }
    let(:params) { { image: { oldid: 12, picture: image_file, title: "foo" }}}
    let(:image) { Jobsitecli::Image.new }
    it "add image to jobsite" do
      with_configuration(host: 'localhostes', port: 3000, token: '7e3491081d372f7fc294f8e558c1d774') do
        image.create(params)
        object = JSON.parse(image.last_response)
        object['created_at'].should_not be_nil
        object['created_at'].should == object['updated_at']
      end
    end
    after do
      image.delete(params[:image][:oldid])
    end
  end

  # cannot test update because of IO stream error

end
