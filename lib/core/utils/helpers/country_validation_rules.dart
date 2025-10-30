final Map<String, Map<String, dynamic>> countryValidationRules = {
  // Middle East
  'EG': { // Egypt
    'minLength': 10,
    'maxLength': 10,
    'pattern': r'^(1[0-2]|15)[0-9]{8}$',
    'example': '1012345678',
    'name': 'Egypt'
  },
  'SA': { // Saudi Arabia
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^(5[0-9]{8})$',
    'example': '512345678',
    'name': 'Saudi Arabia'
  },
  'AE': { // UAE
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^(5[0-9]{8})$',
    'example': '501234567',
    'name': 'United Arab Emirates'
  },
  'BH': { // Bahrain
    'minLength': 8,
    'maxLength': 8,
    'pattern': r'^(3[0-9]{7}|6[0-9]{7})$',
    'example': '36123456',
    'name': 'Bahrain'
  },
  'QA': { // Qatar
    'minLength': 8,
    'maxLength': 8,
    'pattern': r'^([3-7][0-9]{7})$',
    'example': '33123456',
    'name': 'Qatar'
  },
  'OM': { // Oman
    'minLength': 8,
    'maxLength': 8,
    'pattern': r'^(9[0-9]{7})$',
    'example': '92123456',
    'name': 'Oman'
  },
  'KW': { // Kuwait
    'minLength': 8,
    'maxLength': 8,
    'pattern': r'^([569][0-9]{7})$',
    'example': '50012345',
    'name': 'Kuwait'
  },
  'JO': { // Jordan
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^(7[0-9]{8})$',
    'example': '791234567',
    'name': 'Jordan'
  },
  'LB': { // Lebanon
    'minLength': 8,
    'maxLength': 8,
    'pattern': r'^([0-9]{8})$',
    'example': '71123456',
    'name': 'Lebanon'
  },
  'SY': { // Syria
    'minLength': 10,
    'maxLength': 10,
    'pattern': r'^(9[0-9]{8})$',
    'example': '9512345678',
    'name': 'Syria'
  },
  'IQ': { // Iraq
    'minLength': 10,
    'maxLength': 10,
    'pattern': r'^(7[0-9]{9})$',
    'example': '7712345678',
    'name': 'Iraq'
  },
  'IR': { // Iran
    'minLength': 10,
    'maxLength': 10,
    'pattern': r'^(9[0-9]{9})$',
    'example': '9123456789',
    'name': 'Iran'
  },
  'TR': { // Turkey
    'minLength': 10,
    'maxLength': 10,
    'pattern': r'^(5[0-9]{9})$',
    'example': '5012345678',
    'name': 'Turkey'
  },
  'IL': { // Israel
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^(5[0-9]{8})$',
    'example': '501234567',
    'name': 'Israel'
  },

  // North America
  'US': { // USA
    'minLength': 10,
    'maxLength': 10,
    'pattern': r'^[2-9][0-9]{9}$',
    'example': '2015550123',
    'name': 'United States'
  },
  'CA': { // Canada
    'minLength': 10,
    'maxLength': 10,
    'pattern': r'^[2-9][0-9]{9}$',
    'example': '2045550123',
    'name': 'Canada'
  },
  'MX': { // Mexico
    'minLength': 10,
    'maxLength': 10,
    'pattern': r'^[1-9][0-9]{9}$',
    'example': '5512345678',
    'name': 'Mexico'
  },

  // Europe
  'GB': { // United Kingdom
    'minLength': 10,
    'maxLength': 11,
    'pattern': r'^(7[0-9]{9})$',
    'example': '7412345678',
    'name': 'United Kingdom'
  },
  'FR': { // France
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^(6|7)[0-9]{8}$',
    'example': '612345678',
    'name': 'France'
  },
  'DE': { // Germany
    'minLength': 10,
    'maxLength': 11,
    'pattern': r'^(1[0-9]{9,10}|[2-9][0-9]{9})$',
    'example': '15123456789',
    'name': 'Germany'
  },
  'IT': { // Italy
    'minLength': 9,
    'maxLength': 10,
    'pattern': r'^(3[0-9]{8,9})$',
    'example': '3123456789',
    'name': 'Italy'
  },
  'ES': { // Spain
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^[6-7][0-9]{8}$',
    'example': '612345678',
    'name': 'Spain'
  },
  'NL': { // Netherlands
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^(6[0-9]{8})$',
    'example': '612345678',
    'name': 'Netherlands'
  },
  'BE': { // Belgium
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^(4[0-9]{8})$',
    'example': '471234567',
    'name': 'Belgium'
  },
  'CH': { // Switzerland
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^(7[0-9]{8})$',
    'example': '781234567',
    'name': 'Switzerland'
  },
  'SE': { // Sweden
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^(7[0-9]{8})$',
    'example': '701234567',
    'name': 'Sweden'
  },
  'NO': { // Norway
    'minLength': 8,
    'maxLength': 8,
    'pattern': r'^([4|9][0-9]{7})$',
    'example': '41234567',
    'name': 'Norway'
  },
  'DK': { // Denmark
    'minLength': 8,
    'maxLength': 8,
    'pattern': r'^([2-9][0-9]{7})$',
    'example': '20123456',
    'name': 'Denmark'
  },
  'FI': { // Finland
    'minLength': 9,
    'maxLength': 10,
    'pattern': r'^(4[0-9]{7,8}|50[0-9]{6,7})$',
    'example': '412345678',
    'name': 'Finland'
  },
  'RU': { // Russia
    'minLength': 10,
    'maxLength': 10,
    'pattern': r'^(9[0-9]{9})$',
    'example': '9123456789',
    'name': 'Russia'
  },
  'UA': { // Ukraine
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^(6[0-9]{8}|[3-9][0-9]{8})$',
    'example': '671234567',
    'name': 'Ukraine'
  },
  'PL': { // Poland
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^([5-9][0-9]{8})$',
    'example': '501234567',
    'name': 'Poland'
  },

  // Asia
  'CN': { // China
    'minLength': 11,
    'maxLength': 11,
    'pattern': r'^(1[3-9][0-9]{9})$',
    'example': '13123456789',
    'name': 'China'
  },
  'IN': { // India
    'minLength': 10,
    'maxLength': 10,
    'pattern': r'^[6-9][0-9]{9}$',
    'example': '9123456789',
    'name': 'India'
  },
  'JP': { // Japan
    'minLength': 10,
    'maxLength': 11,
    'pattern': r'^(0[7-9]0[0-9]{8}|0[1-9][0-9]{8})$',
    'example': '9012345678',
    'name': 'Japan'
  },
  'KR': { // South Korea
    'minLength': 9,
    'maxLength': 10,
    'pattern': r'^(01[0-9]{8,9})$',
    'example': '01012345678',
    'name': 'South Korea'
  },
  'SG': { // Singapore
    'minLength': 8,
    'maxLength': 8,
    'pattern': r'^[689][0-9]{7}$',
    'example': '81234567',
    'name': 'Singapore'
  },
  'MY': { // Malaysia
    'minLength': 9,
    'maxLength': 10,
    'pattern': r'^(01[0-9]{8,9})$',
    'example': '0123456789',
    'name': 'Malaysia'
  },
  'TH': { // Thailand
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^[6|8|9][0-9]{8}$',
    'example': '812345678',
    'name': 'Thailand'
  },
  'ID': { // Indonesia
    'minLength': 9,
    'maxLength': 11,
    'pattern': r'^(8[1-9][0-9]{7,9})$',
    'example': '8123456789',
    'name': 'Indonesia'
  },
  'PH': { // Philippines
    'minLength': 10,
    'maxLength': 10,
    'pattern': r'^(9[0-9]{9})$',
    'example': '9123456789',
    'name': 'Philippines'
  },
  'VN': { // Vietnam
    'minLength': 9,
    'maxLength': 10,
    'pattern': r'^(0[3|5|7|8|9][0-9]{8}|16[0-9]{7})$',
    'example': '912345678',
    'name': 'Vietnam'
  },

  // Africa
  'ZA': { // South Africa
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^[6-8][0-9]{8}$',
    'example': '712345678',
    'name': 'South Africa'
  },
  'NG': { // Nigeria
    'minLength': 10,
    'maxLength': 11,
    'pattern': r'^(0[7-9][0-9]{9}|[7-9][0-9]{9})$',
    'example': '7012345678',
    'name': 'Nigeria'
  },
  'KE': { // Kenya
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^(1[0-9]{8}|7[0-9]{8})$',
    'example': '712345678',
    'name': 'Kenya'
  },
  'ET': { // Ethiopia
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^(9[0-9]{8})$',
    'example': '911234567',
    'name': 'Ethiopia'
  },
  'GH': { // Ghana
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^([2|5][0-9]{8})$',
    'example': '201234567',
    'name': 'Ghana'
  },
  'TZ': { // Tanzania
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^(6[0-9]{8}|7[0-9]{8})$',
    'example': '621234567',
    'name': 'Tanzania'
  },

  // South America
  'BR': { // Brazil
    'minLength': 10,
    'maxLength': 11,
    'pattern': r'^([1-9][0-9]{9,10})$',
    'example': '11912345678',
    'name': 'Brazil'
  },
  'AR': { // Argentina
    'minLength': 10,
    'maxLength': 10,
    'pattern': r'^(11[0-9]{8}|[2-9][0-9]{9})$',
    'example': '9112345678',
    'name': 'Argentina'
  },
  'CO': { // Colombia
    'minLength': 10,
    'maxLength': 10,
    'pattern': r'^(3[0-9]{9})$',
    'example': '3012345678',
    'name': 'Colombia'
  },
  'CL': { // Chile
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^(9[0-9]{8})$',
    'example': '912345678',
    'name': 'Chile'
  },
  'PE': { // Peru
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^(9[0-9]{8})$',
    'example': '912345678',
    'name': 'Peru'
  },

  // Oceania
  'AU': { // Australia
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^(4[0-9]{8})$',
    'example': '412345678',
    'name': 'Australia'
  },
  'NZ': { // New Zealand
    'minLength': 8,
    'maxLength': 9,
    'pattern': r'^(2[0-9]{7,8}|[3-9][0-9]{7})$',
    'example': '211234567',
    'name': 'New Zealand'
  },

  // Other important countries
  'PK': { // Pakistan
    'minLength': 10,
    'maxLength': 10,
    'pattern': r'^(3[0-9]{9})$',
    'example': '3012345678',
    'name': 'Pakistan'
  },
  'BD': { // Bangladesh
    'minLength': 10,
    'maxLength': 10,
    'pattern': r'^(1[0-9]{9})$',
    'example': '1812345678',
    'name': 'Bangladesh'
  },
  'LK': { // Sri Lanka
    'minLength': 9,
    'maxLength': 9,
    'pattern': r'^(7[0-9]{8})$',
    'example': '712345678',
    'name': 'Sri Lanka'
  },
  'NP': { // Nepal
    'minLength': 10,
    'maxLength': 10,
    'pattern': r'^(9[0-9]{9})$',
    'example': '9841234567',
    'name': 'Nepal'
  },
};