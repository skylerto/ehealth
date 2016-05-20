# eHealth

[![Build
Status](https://travis-ci.org/skylerto/ehealth.svg?branch=master)](https://travis-ci.org/skylerto/ehealth)

eHealth is a system which manages patient prescriptions.

## Usage

Does not use a database at this point, there are two command flag which you can
run:

`-i` flag executes the system in interactive mode. Where you can type commands
at a prompt.
```
$ ehealth -i
```

or, you can execute in batch mode, `-b` flag. Batch mode takes a properly formatted file
and produces the correct output to the console.

```
$ eheath -b at1.txt
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/skylerto/ehealth. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

