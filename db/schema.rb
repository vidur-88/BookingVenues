# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150525055205) do

  create_table "bookings", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "client_id"
    t.integer  "listing_view_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "status"
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "email_id"
    t.string   "contact_no"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "status"
  end

  create_table "halls", :force => true do |t|
    t.string   "name"
    t.integer  "capacity"
    t.decimal  "rate"
    t.string   "location"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lawns", :force => true do |t|
    t.string   "name"
    t.integer  "capacity"
    t.decimal  "rate"
    t.string   "location"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "listing_views", :force => true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "listing_views", ["imageable_id"], :name => "index_listing_views_on_imageable_id"

  create_table "location_service_cities", :force => true do |t|
    t.string  "name",                                                  :null => false
    t.integer "state_id"
    t.integer "coordinates",      :limit => 0
    t.integer "bounds_ne",        :limit => 0
    t.integer "bounds_sw",        :limit => 0
    t.text    "feed_preferences",              :default => "--- []\n"
  end

  add_index "location_service_cities", ["coordinates"], :name => "index_location_service_cities_on_coordinates"
  add_index "location_service_cities", ["state_id"], :name => "index_location_service_cities_on_state_id"

  create_table "location_service_countries", :force => true do |t|
    t.string  "name",                     :null => false
    t.integer "coordinates", :limit => 0
  end

  add_index "location_service_countries", ["coordinates"], :name => "index_location_service_countries_on_coordinates"

  create_table "location_service_group_localities", :id => false, :force => true do |t|
    t.integer "group_id"
    t.integer "locality_id"
  end

# Could not dump table "location_service_groups" because of following StandardError
#   Unknown type 'postgis.geometry(Polygon,3785)' for column 'boundary_polygon'

# Could not dump table "location_service_localities" because of following StandardError
#   Unknown type 'postgis.geometry(Polygon,3785)' for column 'boundary_polygon'

  create_table "location_service_places", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.integer  "locality_id"
    t.integer  "status_id",                :default => 1
    t.integer  "coordinates", :limit => 0
    t.integer  "bounds_ne",   :limit => 0
    t.integer  "bounds_sw",   :limit => 0
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  add_index "location_service_places", ["address"], :name => "index_location_service_places_on_address"
  add_index "location_service_places", ["bounds_ne"], :name => "index_location_service_places_on_bounds_ne"
  add_index "location_service_places", ["bounds_sw"], :name => "index_location_service_places_on_bounds_sw"
  add_index "location_service_places", ["coordinates"], :name => "index_location_service_places_on_coordinates"
  add_index "location_service_places", ["locality_id"], :name => "index_location_service_places_on_locality_id"
  add_index "location_service_places", ["name"], :name => "index_location_service_places_on_name"
  add_index "location_service_places", ["status_id"], :name => "index_location_service_places_on_status_id"

  create_table "location_service_regions", :force => true do |t|
    t.string  "name",                     :null => false
    t.integer "city_id"
    t.integer "coordinates", :limit => 0
  end

  add_index "location_service_regions", ["city_id"], :name => "index_location_service_regions_on_city_id"
  add_index "location_service_regions", ["coordinates"], :name => "index_location_service_regions_on_coordinates"

  create_table "location_service_states", :force => true do |t|
    t.string  "name",                     :null => false
    t.integer "country_id"
    t.integer "coordinates", :limit => 0
  end

  add_index "location_service_states", ["coordinates"], :name => "index_location_service_states_on_coordinates"
  add_index "location_service_states", ["country_id"], :name => "index_location_service_states_on_country_id"

  create_table "location_service_streets", :force => true do |t|
    t.text     "name"
    t.integer  "status_id",  :default => 2
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

# Could not dump table "location_service_sub_localities" because of following StandardError
#   Unknown type 'postgis.geometry(Polygon,3785)' for column 'boundary_polygon'

  create_table "user_service_addresses", :force => true do |t|
    t.string   "name"
    t.string   "pin_code"
    t.integer  "status",                              :default => 2
    t.integer  "user_id"
    t.datetime "created_at"
    t.integer  "coordinates",            :limit => 0
    t.string   "flat_info"
    t.integer  "building_id"
    t.string   "building_name"
    t.text     "landmark"
    t.string   "area"
    t.text     "address_details"
    t.integer  "locality_id"
    t.string   "locality_name"
    t.string   "extension"
    t.integer  "sms_login_id"
    t.datetime "updated_at"
    t.string   "reference_name"
    t.string   "reference_phone_number"
  end

  add_index "user_service_addresses", ["sms_login_id"], :name => "index_user_service_addresses_on_sms_login_id"
  add_index "user_service_addresses", ["user_id"], :name => "index_user_service_addresses_on_user_id"

  create_table "user_service_android_releases", :force => true do |t|
    t.string   "version",                                :null => false
    t.integer  "numerical_version",                      :null => false
    t.boolean  "is_deprecated",     :default => false
    t.text     "features_added"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "base_version",      :default => "3.0.0"
    t.boolean  "is_released",       :default => true
  end

  add_index "user_service_android_releases", ["numerical_version"], :name => "index_user_service_android_releases_on_numerical_version"
  add_index "user_service_android_releases", ["version"], :name => "index_user_service_android_releases_on_version"

  create_table "user_service_apps", :force => true do |t|
    t.string   "name"
    t.integer  "facebook_app_id"
    t.integer  "google_app_id"
    t.text     "api_public_key"
    t.text     "api_private_key"
    t.integer  "query_limit_per_day"
    t.integer  "status",              :default => 2
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "project_id"
    t.integer  "custom_provider_id"
  end

  create_table "user_service_avatars", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "user_id",                                   :null => false
    t.boolean  "image_under_processing", :default => false
  end

  create_table "user_service_contact_numbers", :force => true do |t|
    t.integer  "number_type"
    t.string   "extension"
    t.string   "number"
    t.integer  "user_id"
    t.integer  "status",                    :default => 6
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "validation_window_ends_at"
  end

  add_index "user_service_contact_numbers", ["number"], :name => "index_user_service_contact_numbers_on_number"
  add_index "user_service_contact_numbers", ["user_id"], :name => "index_user_service_contact_numbers_on_user_id"
  add_index "user_service_contact_numbers", ["validation_window_ends_at"], :name => "index_user_service_contact_numbers_on_validation_window_ends_at"

  create_table "user_service_custom_providers", :force => true do |t|
    t.string "name"
  end

  create_table "user_service_departments", :force => true do |t|
    t.string "name"
    t.string "code"
  end

  create_table "user_service_deployment_panels", :force => true do |t|
    t.integer  "user_id"
    t.string   "change_log"
    t.string   "severity"
    t.text     "db_migration"
    t.string   "redis_cache_rebuilt"
    t.string   "elastic_search_rebuilt"
    t.text     "extra_task_needed"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "user_email"
  end

  create_table "user_service_device_locality_ids", :force => true do |t|
    t.integer  "user_id"
    t.string   "device_id"
    t.integer  "locality_id"
    t.integer  "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_service_email_preferences", :force => true do |t|
    t.boolean "invoice_and_order_updates", :default => true
    t.boolean "promotion_mails",           :default => true
    t.integer "user_id"
    t.string  "unsubscribe_token"
  end

  create_table "user_service_employees", :force => true do |t|
    t.integer  "user_id"
    t.string   "department_name"
    t.text     "about_me"
    t.date     "joined_on"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "order_management_number"
    t.integer  "department_id"
  end

  create_table "user_service_facebook_apps", :force => true do |t|
    t.string "name",       :null => false
    t.string "app_id",     :null => false
    t.string "app_secret", :null => false
  end

  add_index "user_service_facebook_apps", ["name"], :name => "index_user_service_facebook_apps_on_name", :unique => true

  create_table "user_service_facebook_friends", :force => true do |t|
    t.integer "user_id",     :null => false
    t.string  "facebook_id", :null => false
  end

  create_table "user_service_friends", :id => false, :force => true do |t|
    t.integer "user1_id", :null => false
    t.integer "user2_id", :null => false
  end

  create_table "user_service_google_apps", :force => true do |t|
    t.string "name",                                                      :null => false
    t.string "client_id",                                                 :null => false
    t.string "client_secret",                                             :null => false
    t.string "scope",                                                     :null => false
    t.string "response_type", :default => "code token id_token gsession"
    t.string "api_key",                                                   :null => false
    t.string "redirect_uri"
    t.string "version"
  end

  add_index "user_service_google_apps", ["name"], :name => "index_user_service_google_apps_on_name", :unique => true

  create_table "user_service_ios_releases", :force => true do |t|
    t.string   "version",                                                                                                       :null => false
    t.integer  "numerical_version",                                                                                             :null => false
    t.boolean  "is_deprecated",     :default => false
    t.text     "features_added"
    t.datetime "created_at",                                                                                                    :null => false
    t.datetime "updated_at",                                                                                                    :null => false
    t.string   "app_store_url",     :default => "https://itunes.apple.com/in/app/tiny-owl-food-ordering/id916154166?ls=1&mt=8"
    t.string   "base_version",      :default => "1.0.0"
    t.boolean  "is_released",       :default => true
  end

  add_index "user_service_ios_releases", ["numerical_version"], :name => "index_user_service_ios_releases_on_numerical_version"
  add_index "user_service_ios_releases", ["version"], :name => "index_user_service_ios_releases_on_version"

  create_table "user_service_permissions", :force => true do |t|
    t.integer  "role_id"
    t.string   "label"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_service_projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_service_restaurant_agents", :force => true do |t|
    t.integer  "user_id"
    t.string   "department_name"
    t.text     "about_me"
    t.date     "joined_on"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "department_id"
  end

  create_table "user_service_roles", :force => true do |t|
    t.string   "name"
    t.integer  "status",      :default => 2
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.text     "description"
    t.integer  "parent_id"
  end

  create_table "user_service_sms_login_counts", :force => true do |t|
    t.string   "number"
    t.integer  "smstoday"
    t.integer  "smstotal"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.datetime "last_sms_sent_at"
  end

  create_table "user_service_sms_logins", :force => true do |t|
    t.string   "email",                             :null => false
    t.string   "number",                            :null => false
    t.string   "name",                              :null => false
    t.string   "device_id",                         :null => false
    t.string   "pre_token"
    t.string   "post_token"
    t.integer  "number_of_sms_sent", :default => 0
    t.datetime "last_sms_sent_at"
    t.integer  "status",             :default => 2
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "app_version"
    t.integer  "user_id"
    t.integer  "platform"
    t.string   "device_type"
  end

  add_index "user_service_sms_logins", ["post_token"], :name => "index_user_service_sms_logins_on_post_token"
  add_index "user_service_sms_logins", ["pre_token", "post_token"], :name => "index_user_service_sms_logins_on_pre_token_and_post_token"
  add_index "user_service_sms_logins", ["pre_token"], :name => "index_user_service_sms_logins_on_pre_token", :unique => true
  add_index "user_service_sms_logins", ["status"], :name => "index_user_service_sms_logins_on_status"
  add_index "user_service_sms_logins", ["user_id"], :name => "index_user_service_sms_logins_on_user_id"

  create_table "user_service_tinyowl_money_debit_items", :force => true do |t|
    t.integer  "creditor_id"
    t.integer  "debitor_id"
    t.float    "amount",      :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_service_tinyowl_moneys", :force => true do |t|
    t.float    "amount",                            :null => false
    t.integer  "user_id"
    t.string   "reference_id"
    t.string   "reference_type"
    t.string   "type"
    t.integer  "activity_type"
    t.boolean  "expired",        :default => false
    t.datetime "expiry_date"
    t.float    "used_amount",    :default => 0.0
    t.string   "state"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "user_service_tinyowl_moneys", ["user_id"], :name => "index_user_service_tinyowl_moneys_on_user_id"

  create_table "user_service_unverified_card_tokens", :force => true do |t|
    t.string   "card_token",     :null => false
    t.string   "card_reference"
    t.integer  "sms_login_id",   :null => false
    t.integer  "user_id",        :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "user_service_unverified_card_tokens", ["sms_login_id"], :name => "index_user_service_unverified_card_tokens_on_sms_login_id"
  add_index "user_service_unverified_card_tokens", ["user_id"], :name => "index_user_service_unverified_card_tokens_on_user_id"

  create_table "user_service_user_devices", :force => true do |t|
    t.string   "device_id"
    t.integer  "user_locality_id"
    t.integer  "parent_locality_id"
    t.string   "parent_locality_name"
    t.string   "app_version"
    t.string   "platform"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "user_service_user_preferences", :force => true do |t|
    t.integer  "user_id"
    t.string   "app_version"
    t.datetime "last_opened_at"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "device_id"
    t.integer  "last_known_location", :limit => 0
    t.datetime "last_synced_at"
    t.integer  "sms_login_id"
    t.integer  "platform"
    t.string   "device_type"
  end

  add_index "user_service_user_preferences", ["app_version"], :name => "index_user_service_user_preferences_on_app_version"
  add_index "user_service_user_preferences", ["device_type"], :name => "index_user_service_user_preferences_on_device_type"
  add_index "user_service_user_preferences", ["last_opened_at"], :name => "index_user_service_user_preferences_on_last_opened_at"
  add_index "user_service_user_preferences", ["last_synced_at"], :name => "index_user_service_user_preferences_on_last_synced_at"
  add_index "user_service_user_preferences", ["platform"], :name => "index_user_service_user_preferences_on_platform"
  add_index "user_service_user_preferences", ["sms_login_id"], :name => "index_user_service_user_preferences_on_sms_login_id"
  add_index "user_service_user_preferences", ["user_id", "device_id"], :name => "index_user_service_user_preferences_on_user_id_and_device_id", :unique => true

  create_table "user_service_user_providers", :force => true do |t|
    t.integer  "user_id",                                :null => false
    t.integer  "provider_id",                            :null => false
    t.string   "provider_type",                          :null => false
    t.string   "access_token"
    t.datetime "access_token_expires_at"
    t.string   "session_token"
    t.string   "password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",           :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "verify_token"
    t.datetime "verify_token_expires_at"
    t.integer  "status",                  :default => 3
    t.datetime "created_at"
  end

  add_index "user_service_user_providers", ["session_token"], :name => "index_user_service_user_providers_on_session_token"

  create_table "user_service_users", :force => true do |t|
    t.string   "email",                                 :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.integer  "gender"
    t.string   "facebook_id"
    t.string   "google_id"
    t.integer  "status",             :default => 2
    t.string   "juspay_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "blacklist_count",    :default => 0
    t.integer  "email_status",       :default => 6
    t.string   "email_token"
    t.integer  "user_rating",        :default => 0
    t.boolean  "is_screwed",         :default => false
    t.boolean  "is_loyal",           :default => false
    t.string   "base_referral_code"
    t.string   "referral_code"
    t.string   "referral_code_used"
  end

  add_index "user_service_users", ["base_referral_code"], :name => "index_user_service_users_on_base_referral_code"
  add_index "user_service_users", ["referral_code"], :name => "index_user_service_users_on_referral_code"

  create_table "user_service_users_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.integer  "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
  end

  create_table "user_service_web_feedbacks", :force => true do |t|
    t.string "name"
    t.string "email"
    t.string "subject"
    t.text   "message"
  end

end
