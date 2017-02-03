# L10n

![L10n](https://github.com/bvanderlaan/L10n/blob/master/app/assets/images/logo.png "L10n")

L10n (pronounced Lion) is an on premises web application that allows you to store and search for known good string translations that you orginization has already translated.

L10n allows you to search for and input phrases that have known good translations in multiple other languages so you can save the turn around time of getting phrases translated and vetted by reusing pre-translated and vetted phrases your organization has already used.

When inputting new phrases you provide the local language version of the phrase (in my case English) and a comment explaining the context of the phrase, something that explains the usage of the phrase to help translators choose which version of a word to use. Then once you have translations which you know are good for your context and the target language you can add the translations of the phrase. You can add one translated form of a phrase per target language; Not all phrases need to be translated into each target langauge and you can add or update translations at any time.

## Why L10n?

Lets say you create an application, or documentation for that matter, which will be used in multiple region and therefore you choose to localize the text so that your users who read other languages will have an easier time using your application. You probably contract out the translations to a firm; the process is generally to scrape out all the phrases you need translated with context comments, ship them over to the translators, wait, then insert the now translated strings into your application via whatever localization framework your using. L10n is here to address the waiting part of that process.

If you have multiple applications all being translated into the same languages you will probably start to have some overlapping phrases. If your translation firm is good they probably have a phrase map so they won't charge you extra to re-translate phrases you already had them translate (although they will probably charge to you context check them) however you will still have to wait for them to get back to you which can be anywhere from a few days to a couple weeks depending on their throughput, contract agreement, and number of phrases needing to be translated. If the bulk of the phrases are already known wouldn't it be nice if you could just look them up in a local database?

With L10n you can input all the phrases which you have already gotten translated and have checked internally to make sure they are good for your context into a searchable database so that future projects can look up known good pre-translated phrase which they could use to avoid the turn around times.

If one project has already waited the days/weeks to get a set of phrases translated and some of those phrases are words like "Save" or "Delete" as used in a file header bar or "Ok" and "Cancel" as used on a prompt then they could via L10n's web user interface add the phrases to L10n's database complete with context comments (i.e. "Cancel" - "Text used in a button on a prompt meant to terminate an operation") then future projects who are adding a file header bar or confirmation prompts could look up those phrases via L10n's web user interface and find all the known good translations for those phrase thus saving them the turn around time to get them retranslated and revetted by the translation firm.

## What you get with L10n

When you setup a L10n server you get a database and an easy to use web based interface.

## Installation

L10n is a Ruby-on-Rails app which by default connects to a MySQL database.
You can configure L10n to use a different SQL database if you so choose by updating the ```config/database.yml``` file.

To install L10n from scratch you will need to have [Ruby-on-Rails 4](http://rubyonrails.org/) and the [Bundler gem](http://bundler.io/) installed. You will also need to install MySQL, or whichever SQL database you plan to use for L10n. The SQL database can be on the same server as L10n or hosted on a different server which L10n will be able to connect to. Once installed perform the following:

1. Clone the repository.
    ```
    git clone https://github.com/bvanderlaan/L10n.git
    ```

2. Navigate into the repositories root folder.
    ```
    cd L10n
    ```

3. Install the required gems via bundler
    ```
    $ bundle install
    ```

    By default the ```config/database.yml``` is setup to use MySQL. The next steps is to setup a database on you MySQL install for L10n to use.

4. Log into MySQL as a root user.

        $ mysql -u root -p
        Enter password: *<your root password>*

5. Now grant privileges to the user that L10n will use to interact with the database. The user L10n will use is defined in ```config/database.yml```. The default user name is *l10nadmin*. We will also setup three different databases for L10n to use, one for production (*l10n*), one for development (*l10n_development*), and one for testing (*l10n_test*).

        mysql> grant all privileges on l10n.*
            -> to 'l10nadmin'@'localhost'
       	    -> identified by '*<your l10nadmin user password>*';


6. You also need to add privileges to the other database that you will create using **Rake**.

        mysql> grant all privileges on l10n_test.*
            -> to 'l10nadmin'@'localhost'
    	    -> identified by '*<your l10nadmin user password>*';


        mysql> grant all privileges on l10n_develpoment.*
            -> to 'l10nadmin'@'localhost'
    	    -> identified by '*<your l10nadmin user password>*';

    At this point you can log out of mysql (remember your logged in as the root user) and log back in as the *l10nadmin* user.

        mysql> exit;
             $ mysql -u l10nadmin -p
       	     Enter password: *<your l10nadmin password>*

    Alright you've proven that your database is ready to go. You can log out of mysql now if you like.

7. Back in a terminal you can now create and populate the database with the required tables and entries using *Rake* (Rake is a tool which comes with Ruby-on-Rails).
    ```
    $ rake db:setup
    ```

8. Lastly you can now start up the Rails server. There is no need to install a web server because Rails applications are self hosting via an in memory web server which comes with Rails. Simply execute the following command to start the L10n application.
    ```
    $ rails server
    ```

    By default it will host the website on port 3000.
    You can optionally specify a different port using the *-p* argument.

    ```
    $ rails server -p 8080
    ```
    This is also running by default in the Development environment. To start L10n in the production environment you need to set the <em>RAILS_ENV</em> variable.
    ```
    $ RAILS_ENV=production rails server -p 8080
    ```

## Donations

If you like Taranis and want to support it and other open source work that I do you can do so via [Gratipay](https://gratipay.com/~bvanderlaan/).

[![Support via Gratipay](https://cdn.rawgit.com/gratipay/gratipay-badge/2.3.0/dist/gratipay.svg)](https://gratipay.com/~bvanderlaan/)


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bvanderlaan/L10n. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The application is available as open source under the terms of the [Apache License, version 2.0](https://opensource.org/licenses/Apache-2.0).