# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

if Language.count == 0
	puts "Populating target languages..."
	languages = Language.create([{langname: 'English', langcode: 'en'}, 
								{langname: 'French', langcode: 'fr'},
								{langname: 'German', langcode: 'de'},
								{langname: 'Spanish', langcode: 'es'},
								{langname: 'Italian', langcode: 'it'},
								{langname: 'Japanese', langcode: 'ja'},
								{langname: 'Korean', langcode: 'ko'},
								{langname: 'Polish', langcode: 'pl'},
								{langname: 'Portuguese', langcode: 'pt'},
								{langname: 'Russian', langcode: 'ru'},
								{langname: 'Simplified Chinese', langcode: 'zh'},])
else
	puts "Target Languages are already set, skipping seeding."
end