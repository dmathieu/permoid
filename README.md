# Permoid

Add permalinks to your Mongoid Models

## Requirements

* Ruby, 1.8.7 or 1.9.2
* Mongoid 2.0.0

## Use

* Install the gem and include it to your project/Gemfile.
* Define a model with a permalink :

     class Testing
         include Mongoid::Document
         include Permoid::Base
        
         field   :title
         validates_presence_of :title
     end

Go roll !


## Warning !

Currently, the gem relies on the title field to build the permalink. There's no way to change that (yet).

## Contributing

If you think Permoid is great but can be improved, feel free to contribute.
To do so, you can :

* [Fork](http://help.github.com/forking/) the project
* Do your changes and commit them to your repository
* Test your changes. We won't accept any untested contributions (except if they're not testable).
* Create an [issue](http://github.com/dmathieu/permoid/issues) with a link to your commits.

And that's it! We'll soon take a look at your issue and review your changes.

## Credits

Damien MATHIEU :: 42 (AT|CHEZ) dmathieu.com
