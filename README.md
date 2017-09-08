# README*``*

To Run this app on local, please run these steps:

First, copy the repository on your local.
* _git clone git@github.com:omjrt88/omr.sl.git_
* _cd omr.sl_

Then, install all the gems needed
* _gem install bundler_  (if you didn't have it)
* _bundle install_

Last Step, set the database. (This Database is on **_`MySQL`_**)
* _rake db:create_
* _rake db:migrate_
* _rake db:seed_


--HEROKU

To deploy this project on Heroku, please run the following steps, after you clone de repository on your local machine. (Please, you have to be on the project root)
* _heroku create **`omrsl`**_  --(the name is optional, but is better is you set a name for it. By default or example, _`omrsl`_ )
* _heroku git:remote -a **`omrsl`**_  --(Please use the same name that you define on the first step)
* _heroku addons:create cleardb:ignite_ --(Before this, please Verify if on your heroku website, you have the _`ClearDB MySQL :: Database`_ installed)
![image](https://user-images.githubusercontent.com/6087761/30226031-d4592282-9491-11e7-99e6-cc5f04680bc3.png)
* _heroku config | grep CLEARDB_DATABASE_URL_ --(after this, copy the returned value.)
* Now, set a new Environment key to set database url. Copy the value returned on the last instruction, and modify it. The Key has to be call _`DATABASE_URL`_ and change the text: _`mysql://`_ to _`mysql2://`_.
  The instruction has to something like this one:
  * _heroku config:set `DATABASE_URL`='`mysql2`://bdeee8cc433aff:1edb26b7@us-cdbr-iron-east-05.cleardb.net/heroku_c086b0cbcfd0776?reconnect=true'_
* _heroku config:set BASE_URL=**`omrsl`**.herokuapp.com/_  --(Please change the principal name of the site, to be exactly like the name of the app that you configured on the first step.)
* _git push heroku master_

(First, check if the scripts ran automatically, if not, run the database scripts, just if it's necessary).
* _heroku run rake db:create_
* _heroku run rake db:migrate_
* _heroku run rake db:seed_

Finally, run and see the app:
* _heroku open_