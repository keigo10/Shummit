# frozen_string_literal: true

require 'application_system_test_case'

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test 'visiting the index' do
    visit events_url
    assert_selector 'h1', text: 'Events'
  end

  test 'creating a Event' do
    visit events_url
    click_on 'New Event'

    fill_in 'Entrance fee', with: @event.entrance_fee
    fill_in 'Event image', with: @event.event_image_id
    check 'Event status' if @event.event_status
    fill_in 'Events name', with: @event.events_name
    fill_in 'Genre', with: @event.genre_id
    fill_in 'Persons', with: @event.persons
    fill_in 'Sports', with: @event.sports
    fill_in 'User', with: @event.user_id
    click_on 'Create Event'

    assert_text 'Event was successfully created'
    click_on 'Back'
  end

  test 'updating a Event' do
    visit events_url
    click_on 'Edit', match: :first

    fill_in 'Entrance fee', with: @event.entrance_fee
    fill_in 'Event image', with: @event.event_image_id
    check 'Event status' if @event.event_status
    fill_in 'Events name', with: @event.events_name
    fill_in 'Genre', with: @event.genre_id
    fill_in 'Persons', with: @event.persons
    fill_in 'Sports', with: @event.sports
    fill_in 'User', with: @event.user_id
    click_on 'Update Event'

    assert_text 'Event was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Event' do
    visit events_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Event was successfully destroyed'
  end
end
