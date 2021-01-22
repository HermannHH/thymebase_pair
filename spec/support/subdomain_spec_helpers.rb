def hostname(subdomain)
  subdomain ? "http://#{subdomain}.lvh.me" : 'http://www.lvh.me'
end

def subdomain_url(subdomain, path)
  "#{hostname(subdomain)}#{path}"
end

def switch_to_subdomain(subdomain)
  Capybara.app_host = hostname(subdomain)
end

def switch_to_main_domain
  switch_to_subdomain 'www'
end

Capybara.configure do |config|
  config.always_include_port = true
end
