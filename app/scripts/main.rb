class Main
  def self.execute
    puts 'start'

    # bme280 = JSON.parse('{"pressuer": 959.47, "temp": 28.01, "humid": 42.0}')
    # mh19 = JSON.parse('{"co2": 687}')

    bme280 = JSON.parse(`python bme280_sample.py`.gsub(/'/, "\""))
    mh19 = JSON.parse(`sudo python -m mh_z19`)
    ConditionDegree.create!(temperature: mh19['temp'], humidity: mh19['humid'], pressure: mh19['pressuer'], co2: bme280['co2'])

    puts 'end'
  end
end