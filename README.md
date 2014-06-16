Heap Sort
=========

I decided to implement heap sort after watching a lecture on MIT open courseware (before app academy attendence)  

This is my implementation along with 3 other implementations I found of heapsort on the internet commented accordingly.

All implementations are in Ruby.


The tests were performed on a Macbook Pro dual core 2.5 Ghz i5, 4GB ram

Testing procedure also shown in the code. Simple Time.now just before heapsort call and directly after completion.  
It is understood this will give some margin of error, but that's a negligible factor in these cases.

Results of the tests are as follows and commented inside the code:

###########################################################################################################

My implementation  
1,000,000 @ 1.02 sec, 10,000,000 @ 9.43 sec, 100,000,000 @ 111.43 sec 1,000,000,000 (ran out of ram)

###########################################################################################################

http://eigenclass.blogspot.com/2008/10/sorting-algs-in-ruby.html implementation  
1,000,000 @ 416.04 sec (no other tests run)

###########################################################################################################

http://my.safaribooksonline.com/book/web-development/ruby/9781593271824/sorting-algorithms/heap_sort
wicked cool ruby scripts implementation  
1,000,000 @ 2.09 sec, 10,000,000 @ 21.56 sec, 100,000,000 @ 221.93 sec

###########################################################################################################

http://www.codecodex.com/wiki/Heapsort#Ruby
implementation of heapsort  
1,000,000 @ 3.63 sec, 10,000,000 @ 41.82 sec, 100,000,000 @ 473.65 sec

###########################################################################################################


