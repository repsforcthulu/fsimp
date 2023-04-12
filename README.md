# fsimp
simplifies file creation, opening, writing and deleting in Ruby.

-fsimp bundles creation/opening into the init logic; 
 $ f = Fsimp.new('test.txt')
 -after init, fsimp currently supports the following methods:
 foo.name
 foo.perm (permissions)
 foo.write
 foo.read
 foo.delete
