class Main
  def self.execute
    puts 'start'

    # bme280 = JSON.parse('{"pressuer": 959.47, "temp": 28.01, "humid": 42.0}')
    # mh19 = JSON.parse('{"co2": 687}')

    bme280 = JSON.parse(`python app/scripts/bme280.py`.gsub(/'/, "\""))
    # mh19 = JSON.parse(`python -m mh_z19`)
    ConditionDegree.create!(temperature: bme280['temp'], humidity: bme280['humid'], pressure: bme280['pressuer'])

    puts 'end'
  end
end
