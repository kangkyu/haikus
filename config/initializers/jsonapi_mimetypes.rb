module JSONAPI
	MIMETYPE = "application/vnd.api+json"
end

Mime::Type.register(JSONAPI::MIMETYPE, :api_json)
ActionDispatch::ParamsParser::DEFAULT_PARSERS[Mime::Type.lookup(JSONAPI::MIMETYPE)]= lambda do |body|
	JSON.parse(body)
end