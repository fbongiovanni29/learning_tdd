require "rails_helper.rb"

#.feature gives methods to all of Capybara's methods for interacting with pagee
RSpec.feature "User submits a link" do
		#Scenario describes one potential outcome of user creating a link
		scenario "they see the page for the submitted link" do
			#just variablels
			link_title = "THis Testing Rails book is awesome!"
			link_url = "http://testingrailsbook.com"
			#visit is a Capybara that visits the defined path
			visit root_path
			#click_on tells Capybara to click a link
			click_on "Submit a new link"

			#fill_in fills in the html id (link_title & link_url) with the variables of the same name aboves
			fill_in "link_title", with: link_title
			fill_in "link_url", with: link_url

			#clicks on the Submit button
			click_on "Submit"

			#expect is an assertion method in RSpec
			#Here it takes the page object which is provided by Capybara to give access to the current page
			#Call .to to return the value of expect and pass it a matcher
			#Match returns truthy or falsy
			#Have link comes from Capyabra and returns true if it finds a link with the given text
			expect(page).to have_link link_title, href: link_url
	end
end
