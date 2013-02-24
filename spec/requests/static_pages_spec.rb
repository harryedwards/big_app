require 'spec_helper'

describe "StaticPages" do

  subject {  page  }

  let(:base_title) {  "Ruby on Rails Tutorial Sample App"}

  describe "Home page" do
  before {  visit root_path }

    it { should have_content('Sample App') }
    it { should have_selector('title',  :text => "#{base_title}")  }

  end

  describe "Help page" do

   before {  visit help_path  }

    it { should have_content('Help') }
    it { should have_selector('title', 
      	:text => "#{base_title} | Help") }
    
  end

  

  describe "About page" do
   before {  visit about_path  }
    it "should have the content 'About'" do
    	page.should have_content('About')
    end

    it "should have the right title" do
      page.should have_selector('title', 
      	:text => "#{base_title} | About") 
    end
  end

  

  describe "Contact page" do
    before {  visit contact_path  }
    it "should have the content 'Contact Us'" do
    	page.should have_content('Contact Us')
    end

    it "should have the right title" do
      page.should have_selector('title', 
      	:text => "#{base_title} | Contact Us") 
    end
  end

  it "should have the right links to the layout" do
     visit root_path
     click_link "About"
     page.should have_selector 'title', text: ('About')
  end

  it "should have the right links to the layout" do
     visit root_path
     click_link "Contact"
     page.should have_selector 'title', text: ('Contact')
     click_link "Home"
     click_link "Sign up now!"
     page.should have_selector('h1', text:('Sign Up'))
  end


end
