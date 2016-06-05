#L10n

L10n (pronounced *Lion*) is a WUI to a translation database. 

The idea is that a company who pays for translations of their applications can store all the translated strings in a single place and reuse them in future applications.

## Installation

1. Clone the repository.
'''
git clone https://github.com/bvanderlaan/website-l10n.git
'''

2. Navigate into the repositories root folder.
'''
cd website-l10n
'''

3. Install bundle
'''
$ bundle install
'''

By default the config/database.yml is setup to use MySQL. The next steps is to setup a database on you MySQL install for L10n to use.

4. Log into MySQL as a root user.
'''
$ mysql -u root -p 
Enter password: *<your root password>*
'''

5. Now grant privileges to the user that L10n will use to interact with the database. The default as defined in config/database.yml is *l10nadmin*.
'''
mysql> grant all privileges on l10n_develpoment.*
    -> to 'l10nadmin'@'localhost'
	-> identified by '*<your l10nadmin user password>*';
'''

6. You also need to add privileges to the other database that you will create using **Rake**.

'''
mysql> grant all privileges on l10n_test.*
    -> to 'l10nadmin'@'localhost'
	-> identified by '*<your l10nadmin user password>*';

	
mysql> grant all privileges on l10n.*
    -> to 'l10nadmin'@'localhost'
	-> identified by '*<your l10nadmin user password>*';
'''

At this point you can log out of mysql (remember your logged in as the root user) and log back in as the *l10nadmin* user.
'''
mysql> exit;
     $ mysql -u l10nadmin -p 
	 Enter password: *<your l10nadmin password>*
'''

You can log out of mysql now if you like.

7. Back in terminal you can now populate the database with the required tables and entries using *Rake*.
'''
$ rake db:setup
'''

8. Start up the Rails server
'''
$ rails server
'''

By default it will host the website on port 3000.
You can optionally specify a different port.

'''
$ rails server -p 8080
'''

## Development

TBD

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bvanderlaan/website-l10n. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [Apache License, version 2.0](https://opensource.org/licenses/Apache-2.0).