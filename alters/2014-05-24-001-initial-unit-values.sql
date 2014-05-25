use correlateme;

SET AUTOCOMMIT = 0;
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE unit;
TRUNCATE TABLE unit_type;

INSERT INTO unit_type (`name`) VALUES
  ('quantity'),
  ('time'),
  ('length'),
  ('mass'),
  ('temperature'),
  ('volume'),
  ('area'),
  ('energy');

INSERT INTO unit (`unit_type_id`, `value_in_canonical_unit`, `canonical_p`, `name_singular`, `name_plural`, `abbreviation`) VALUES
  ((SELECT id FROM unit_type WHERE name='time'), 1.0, 1, 'second', 'seconds', 'S'),
  ((SELECT id FROM unit_type WHERE name='time'), 60, 0, 'minute', 'minutes', 'M'),
  ((SELECT id FROM unit_type WHERE name='time'), 3600, 0, 'hour', 'hours', 'H'),

  ((SELECT id FROM unit_type WHERE name='mass'), 1.0, 1, 'kilogram', 'kilograms', 'kg'),
  ((SELECT id FROM unit_type WHERE name='mass'), 0.001, 0, 'gram', 'grams', 'g'),
  ((SELECT id FROM unit_type WHERE name='mass'), 0.453592, 0, 'pound', 'pounds', 'lb'),
  ((SELECT id FROM unit_type WHERE name='mass'), 0.0283495, 0, 'ounce', 'ounces', 'oz'),

  ((SELECT id FROM unit_type WHERE name='length'), 1.0, 1, 'meter', 'meters', 'm'),
  ((SELECT id FROM unit_type WHERE name='length'), 0.01, 0, 'centimeter', 'centimeters', 'cm'),
  ((SELECT id FROM unit_type WHERE name='length'), 0.001, 0, 'millimeter', 'millimeters', 'mm'),
  ((SELECT id FROM unit_type WHERE name='length'), 0.0254, 0, 'inch', 'inches', 'in'),
  ((SELECT id FROM unit_type WHERE name='length'), 0.3048, 0, 'foot', 'feet', 'ft'),

  ((SELECT id FROM unit_type WHERE name='volume'), 1.0, 1, 'liter', 'liters', 'L'),
  ((SELECT id FROM unit_type WHERE name='volume'), 0.001, 0, 'milliliter', 'milliliters', 'mL'),
  ((SELECT id FROM unit_type WHERE name='volume'), 0.0295735, 0, 'fluid ounce', 'fluid ounces', 'fl. oz.'),
  ((SELECT id FROM unit_type WHERE name='volume'), 0.236588, 0, 'cup', 'cups', 'cup'),

  ((SELECT id FROM unit_type WHERE name='energy'), 1.0, 1, 'kilocalorie', 'kilocalories', 'kcal'),

  ((SELECT id FROM unit_type WHERE name='temperature'), 1.0, 1, 'degree Celsius', 'degrees Celcius', '&deg;C');

SET AUTOCOMMIT = 1;
SET FOREIGN_KEY_CHECKS = 1;

COMMIT;
