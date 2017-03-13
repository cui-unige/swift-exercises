# Exercises and Homework on Swift

## Goal

The goals of these exercises and homework are:

* to write simple programs in Swift;
* to write simple tests over the programs;
* to use continuous integration and GitHub.

## Pokemons

A Pokemon is a creature that has a [species](http://bulbapedia.bulbagarden.net/wiki/Pokémon_(species)),
an optional [nickname](http://bulbapedia.bulbagarden.net/wiki/Nickname) (most do not),
at most four [moves](http://bulbapedia.bulbagarden.net/wiki/Move),
a level, experience, stats and other information.

Its [species](http://bulbapedia.bulbagarden.net/wiki/Pokémon_(species))
defines the Pokemon [type](http://bulbapedia.bulbagarden.net/wiki/Type)(s),
the available [moves](http://bulbapedia.bulbagarden.net/wiki/Move),
Each move has exactly one [type](http://bulbapedia.bulbagarden.net/wiki/Type)(s).

The source code in `Sources/swift_exercises.swift` already contains type definitions for all these notions (and more).
**You have to implement the `TODO`s.**

## Install

In order to do this homework, follow these steps:

* [Fork the subject repository](https://github.com/unige-semantics-2017/swift-exercises#fork-destination-box).
  It will create a copy in your own account, where you can work.
* [Invite](https://help.github.com/articles/inviting-collaborators-to-a-personal-repository/) your teachers to your repository.
  It will give them write access, that will only be used to add your grade.
* [Create a pull request](https://help.github.com/articles/creating-a-pull-request-from-a-fork/) from your repository to the reference one.
  This is only possible if you have made some changes to the code.
  The pull request will follow your work: you do not need to create a new one if you update your work.

## Questions

If you have questions on the subject,
please fill an [issue in the subject repository](https://github.com/unige-semantics-2017/swift-exercises/issues).
If your question is about your implementation, please fill an issue in your repository.

## Tests

All exercises are incremental: their code is built upon the previous ones.
You **must** write tests for your code.
It is for instance a good idea to implement the examples given in [bulbapedia](http://bulbapedia.bulbagarden.net/wiki/).

Tests are put in functions located in the `Tests/swift-exercisesTests.swift` file.
Do not forget to list them also explicitly in the `allTests` array.

For testing, we use [wercker continuous integration](http://www.wercker.com).
It has a [command-line](http://www.wercker.com/cli/install) interface that you must install.
To run the tests, type the following command in the terminal:
```sh
$ wercker build
```

Tests will be automatically run in your pull request.
GitHub shows the result (pass or fail) in its interface.
