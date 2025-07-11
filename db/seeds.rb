# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

companies = [
  {
    "company": "EVENTIX",
    "latitude": 34.58,
    "longitude": -108.81
  },
  {
    "company": "ANIMALIA",
    "latitude": 33.35,
    "longitude": -101.88
  },
  {
    "company": "ECLIPTO",
    "latitude": 43.71,
    "longitude": -113.87
  },
  {
    "company": "AEORA",
    "latitude": 46.17,
    "longitude": -86.13
  },
  {
    "company": "OLYMPIX",
    "latitude": 45.2,
    "longitude": -109.19
  },
  {
    "company": "GONKLE",
    "latitude": 37.36,
    "longitude": -99.27
  },
  {
    "company": "EZENTIA",
    "latitude": 38.74,
    "longitude": -98.87
  },
  {
    "company": "ESCENTA",
    "latitude": 42.84,
    "longitude": -107.54
  },
  {
    "company": "INTRAWEAR",
    "latitude": 37.98,
    "longitude": -96.27
  },
  {
    "company": "BITTOR",
    "latitude": 45.32,
    "longitude": -89.13
  },
  {
    "company": "UNIWORLD",
    "latitude": 37.63,
    "longitude": -104.58
  },
  {
    "company": "LINGOAGE",
    "latitude": 43.91,
    "longitude": -92.86
  },
  {
    "company": "TROPOLI",
    "latitude": 41.16,
    "longitude": -112.41
  },
  {
    "company": "HIVEDOM",
    "latitude": 36.1,
    "longitude": -99.37
  },
  {
    "company": "EXTREMO",
    "latitude": 37.57,
    "longitude": -113.26
  },
  {
    "company": "POLARIA",
    "latitude": 35.21,
    "longitude": -85.02
  },
  {
    "company": "ENERSOL",
    "latitude": 39.72,
    "longitude": -85.38
  },
  {
    "company": "NEWCUBE",
    "latitude": 44.52,
    "longitude": -109.61
  },
  {
    "company": "JUMPSTACK",
    "latitude": 35.22,
    "longitude": -99.44
  },
  {
    "company": "BARKARAMA",
    "latitude": 45.66,
    "longitude": -101.57
  },
  {
    "company": "EARGO",
    "latitude": 41.18,
    "longitude": -111.98
  },
  {
    "company": "RENOVIZE",
    "latitude": 43.08,
    "longitude": -92.41
  },
  {
    "company": "TUBESYS",
    "latitude": 34.79,
    "longitude": -98.96
  },
  {
    "company": "BUZZOPIA",
    "latitude": 40.64,
    "longitude": -93.3
  },
  {
    "company": "ANDRYX",
    "latitude": 38.52,
    "longitude": -107.88
  },
  {
    "company": "ACUMENTOR",
    "latitude": 35.69,
    "longitude": -100.43
  },
  {
    "company": "AQUAFIRE",
    "latitude": 40.09,
    "longitude": -92.33
  },
  {
    "company": "EQUITAX",
    "latitude": 40.14,
    "longitude": -101.39
  },
  {
    "company": "ANIXANG",
    "latitude": 45.79,
    "longitude": -114.33
  },
  {
    "company": "ECLIPSENT",
    "latitude": 43.13,
    "longitude": -108.44
  },
  {
    "company": "REMOLD",
    "latitude": 41.33,
    "longitude": -116.06
  },
  {
    "company": "CENTREE",
    "latitude": 46.09,
    "longitude": -84.91
  },
  {
    "company": "BULLZONE",
    "latitude": 38.03,
    "longitude": -88.02
  },
  {
    "company": "ZILODYNE",
    "latitude": 36.79,
    "longitude": -89.8
  },
  {
    "company": "VENOFLEX",
    "latitude": 35.95,
    "longitude": -104.17
  },
  {
    "company": "GEEKULAR",
    "latitude": 44.77,
    "longitude": -89.55
  },
  {
    "company": "PETIGEMS",
    "latitude": 39.57,
    "longitude": -93.42
  },
  {
    "company": "OTHERWAY",
    "latitude": 40.21,
    "longitude": -101.81
  },
  {
    "company": "SULTRAXIN",
    "latitude": 44,
    "longitude": -103.7
  },
  {
    "company": "EXOBLUE",
    "latitude": 45.4,
    "longitude": -102.6
  },
  {
    "company": "POLARAX",
    "latitude": 41.56,
    "longitude": -94.23
  },
  {
    "company": "ZOMBOID",
    "latitude": 38.21,
    "longitude": -85.14
  },
  {
    "company": "PETICULAR",
    "latitude": 38.15,
    "longitude": -93.75
  },
  {
    "company": "GOLOGY",
    "latitude": 43.01,
    "longitude": -92.22
  },
  {
    "company": "COMFIRM",
    "latitude": 36.96,
    "longitude": -105.52
  },
  {
    "company": "NEUROCELL",
    "latitude": 41.14,
    "longitude": -95.35
  },
  {
    "company": "ENTHAZE",
    "latitude": 37.5,
    "longitude": -94.7
  },
  {
    "company": "IPLAX",
    "latitude": 43.75,
    "longitude": -94.21
  },
  {
    "company": "ZILLA",
    "latitude": 45.13,
    "longitude": -97.68
  },
  {
    "company": "MINGA",
    "latitude": 44.35,
    "longitude": -113.31
  },
  {
    "company": "NORSUL",
    "latitude": 32.74,
    "longitude": -95.09
  },
  {
    "company": "GRUPOLI",
    "latitude": 42.69,
    "longitude": -101.85
  },
  {
    "company": "ORONOKO",
    "latitude": 45.14,
    "longitude": -85.69
  },
  {
    "company": "OPPORTECH",
    "latitude": 42.68,
    "longitude": -97.09
  },
  {
    "company": "COMSTAR",
    "latitude": 44.77,
    "longitude": -86.61
  },
  {
    "company": "TERRAGEN",
    "latitude": 33.96,
    "longitude": -93.31
  },
  {
    "company": "TWIGGERY",
    "latitude": 44.1,
    "longitude": -87.95
  },
  {
    "company": "SKINSERVE",
    "latitude": 45.99,
    "longitude": -92.28
  },
  {
    "company": "MAXIMIND",
    "latitude": 33.23,
    "longitude": -95.14
  },
  {
    "company": "AQUAMATE",
    "latitude": 46.23,
    "longitude": -101.26
  },
  {
    "company": "BALOOBA",
    "latitude": 37.39,
    "longitude": -101.36
  },
  {
    "company": "GOGOL",
    "latitude": 35.23,
    "longitude": -85.58
  },
  {
    "company": "NEBULEAN",
    "latitude": 35.85,
    "longitude": -112.15
  },
  {
    "company": "SHEPARD",
    "latitude": 33.24,
    "longitude": -97.12
  },
  {
    "company": "RECOGNIA",
    "latitude": 45.61,
    "longitude": -90.23
  },
  {
    "company": "PROSURE",
    "latitude": 37.71,
    "longitude": -87.96
  },
  {
    "company": "VIDTO",
    "latitude": 45.42,
    "longitude": -105.07
  },
  {
    "company": "GINKOGENE",
    "latitude": 42.24,
    "longitude": -93.37
  },
  {
    "company": "TRIPSCH",
    "latitude": 34.32,
    "longitude": -94.66
  },
  {
    "company": "CENTICE",
    "latitude": 37.58,
    "longitude": -96.51
  },
  {
    "company": "VERTON",
    "latitude": 35.02,
    "longitude": -97.95
  },
  {
    "company": "BUZZMAKER",
    "latitude": 45.74,
    "longitude": -88.01
  },
  {
    "company": "KIGGLE",
    "latitude": 39.87,
    "longitude": -89
  },
  {
    "company": "KANGLE",
    "latitude": 35.27,
    "longitude": -107.72
  },
  {
    "company": "ZORROMOP",
    "latitude": 42.65,
    "longitude": -101.91
  },
  {
    "company": "FIBEROX",
    "latitude": 43.24,
    "longitude": -101.93
  },
  {
    "company": "ISOSPHERE",
    "latitude": 40.43,
    "longitude": -98.63
  },
  {
    "company": "REALMO",
    "latitude": 36.16,
    "longitude": -103.13
  },
  {
    "company": "ENAUT",
    "latitude": 41.76,
    "longitude": -97.01
  },
  {
    "company": "COMCUR",
    "latitude": 43.14,
    "longitude": -102.21
  },
  {
    "company": "GORGANIC",
    "latitude": 38.84,
    "longitude": -116.48
  },
  {
    "company": "METROZ",
    "latitude": 43.85,
    "longitude": -96.6
  },
  {
    "company": "SOPRANO",
    "latitude": 44.94,
    "longitude": -102.64
  },
  {
    "company": "PLASMOX",
    "latitude": 45.25,
    "longitude": -112.43
  },
  {
    "company": "GOKO",
    "latitude": 44.03,
    "longitude": -95.69
  },
  {
    "company": "GAPTEC",
    "latitude": 42.29,
    "longitude": -104.85
  },
  {
    "company": "CHILLIUM",
    "latitude": 43.95,
    "longitude": -94.6
  },
  {
    "company": "GLUKGLUK",
    "latitude": 36.62,
    "longitude": -90.04
  },
  {
    "company": "IZZBY",
    "latitude": 44.27,
    "longitude": -89.72
  },
  {
    "company": "PRINTSPAN",
    "latitude": 42.11,
    "longitude": -91.57
  },
  {
    "company": "WEBIOTIC",
    "latitude": 34.65,
    "longitude": -109.34
  },
  {
    "company": "ZILLANET",
    "latitude": 35.9,
    "longitude": -111.35
  },
  {
    "company": "CUJO",
    "latitude": 35.85,
    "longitude": -90.16
  },
  {
    "company": "SLAMBDA",
    "latitude": 35.61,
    "longitude": -105.57
  },
  {
    "company": "MANTRO",
    "latitude": 45.15,
    "longitude": -115.64
  },
  {
    "company": "CHORIZON",
    "latitude": 39.6,
    "longitude": -98.81
  },
  {
    "company": "MULTIFLEX",
    "latitude": 44.8,
    "longitude": -107.93
  },
  {
    "company": "SQUISH",
    "latitude": 42.27,
    "longitude": -91.17
  },
  {
    "company": "COFINE",
    "latitude": 34.7,
    "longitude": -86.86
  },
  {
    "company": "COMVEY",
    "latitude": 34.35,
    "longitude": -92.27
  }
]

companies.each do |company|
  Company.find_or_create_by(name: company[:company]) do |c|
    c.latitude = company[:latitude]
    c.longitude = company[:longitude]
  end
end
