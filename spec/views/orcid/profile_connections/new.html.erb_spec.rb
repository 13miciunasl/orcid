require 'spec_helper'

describe 'orcid/profile_connections/new.html.erb' do
  let(:profile_connection) { Orcid::ProfileConnection.new }
  it 'renders a form' do
    view.stub(:profile_connection).and_return(profile_connection)
    render
    expect(rendered).to(
      have_tag(
        'form.search-form',
        with: { action: orcid.new_profile_connection_path, method: :get }
      )
    ) do
      with_tag('fieldset') do
        profile_connection.available_query_attribute_names.each do |field_name|
          with_tag(
            'input',
            with: { name: "profile_connection[#{field_name}]", type: 'search' }
          )
        end
      end
      with_tag('button', with: { type: 'submit' })
    end
  end
end
