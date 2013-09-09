require 'spec_helper'
require 'json'

describe Jobsitecli::Image do

  describe "#create" do
    let(:image_file) { File.new(File.join(File.dirname(__FILE__), "../support/images/santa.jpg")) }
    let(:params) { { image: { oldid: 12, picture: image_file, title: "foo" }}}
    let(:image) { Jobsitecli::Image.new }
    it "add image to jobsite" do
      image.create(params)
      image.last_response.should be
    end
    after do
      image.delete(params[:oldid])
    end
  end
end
