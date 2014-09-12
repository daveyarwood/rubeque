# Join parameters to a link.

def join_params(link, url_parameters)
  fp = url_parameters["first_param"]
  sp = url_parameters["second_param"]
  tp = url_parameters["third_param"]
  "#{link}?first_param=#{fp}&second_param=#{sp}&third_param=#{tp}"
end

# tests
url_params = {
  'first_param'  => 123,
  'second_param' => 456,
  'third_param'  => 678
}

url = 'http://www.foobar.com'

assert_equal 'http://www.foobar.com?first_param=123&second_param=456&third_param=678', join_params(url, url_params)
