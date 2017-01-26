#Batinotas

Trabajo integrador Taller de Tecnologias de Produccion de Software. Opcion Ruby.

---

## Setting the enviroment for the application:

1. Run the following code in your console. To clone the github repo to your chosen directory:

	```sh	
		$ git clone git@github.com:Gianniballerini/batinotas.git
	```

2. Once cloned you'll need to run the next command to get the necesary dependencies for the proyect to run:

	```sh
		$ bundle install
	```

3. Migrate the database:

	```sh	
		$ rails db:migrate
	```

	And if you want you can have some defult data already loaded in your database runing the command:

	```sh
		$ rails db:seed
	```

	The name of the resulting list and corresponding tasks is 'Lista seed' you should be able to acces it through the URL <http://localhost:3000/lista-seed>

4. Start the server and try it out:

	```sh
		$ rails s
	```

---

## Trying it out:

In a web client like Chrome or Safari enter to the URL http://localhost:3000/

This is the default port where rails opens your aplication.


---

## Running Tests

To run the tests you need to open the console and type:


a. If you want to run them all at once:

```sh
	$ rails test test/models/list_test.rb
```

b. If you want to run them separetly you can also type this:

```sh
	$ rails test test/models/list_test.rb
	$ rails test test/models/task_test.rb
	$ rails test test/models/simple_task_test.rb
	$ rails test test/models/temporal_task_test.rb
	$ rails test test/models/long_task_test.rb
```
