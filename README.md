## SYNOPSIS:

  methods to add posix (fcntl based and nfs safe) locking to the builtin File
  class

## URLS:

  - [http://raa.ruby-lang.org/project/posixlock/](http://raa.ruby-lang.org/project/posixlock/)

  - [http://www.codeforpeople.com/lib/ruby/posixlock/](http://www.codeforpeople.com/lib/ruby/posixlock/)

## EXAMPLES:

`File.open('even_an_nfs_mounted_file','r+').posixlock File::LOCK_EX`

`File.open('even_an_nfs_mounted_file','r+').lockf File::F_LOCK, 0`

`open('even_an_nfs_mounted_file','r') do |f|
  f.lockf File::F_LOCKR, 42
end`

`f = open 'foo', 'r+'

if((pid = f.lockf File::F_TEST, 0))
  STDERR.puts "process <#{ pid }> prevents write lock"
end`

`f = open 'foo', 'r'

if((pid = f.lockf File::F_TESTR, 0))
  STDERR.puts "process <#{ pid }> prevents read lock"
end`

## DOCS:

  - posixlock.c

  - File#posixlock has an identical interface to the builtin File#flock

  - for File#lockf see man (3) lockf

    the additional flags

      File::F_LOCKR

      File::F_LOCKW

      File::F_TLOCKR

      File::F_TLOCKW

      File::F_TESTR

      File::F_TESTW

    have the obvious meaning


## AUTHOR:

  ara.t.howard@noaa.gov

## BUGS:

## HISTORY:

  0.0.1: |
    changed behaviour so that, instead of replacing flock, two new methods are
    added: File#posixlock gives access to read/write locks with an interface
    identical to File#flock, and File#lockf gives access to a lockf impl
    similar to the one posix specifies with added functionality for read
    locks.  the biggest difference between the two methods is that lockf will
    throw errors for errno's like EAGAIN, EACCESS, etc.

  0.0.0: |
    initial version
