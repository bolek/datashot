module Json2Csv
  def self.convert(json, csv_options)
    json = JSON.parse(json)
    if json.is_a?(Array)
      
      headers = json.first.try(:keys)
    else
      headers = json.keys
      json = [json]
    end

    csv_options[:headers] = headers if csv_options[:write_headers] && csv_options[:headers].nil?

    CSV.generate(csv_options) { |csv| json.each{ |hash| csv << hash.values } }
  end
end
