json.extract! config, :id, :conf_name, :conf_repeat_pull, :conf_repeat_push, :conf_url_pull, :conf_type_pull, :created_at, :updated_at
json.url config_url(config, format: :json)
