counter = (function() {
  var public = {}
    , count;

  public.reset = function() {
    count = 0;
  };

  public.getCount = function() {
    return count;
  };

  public.inc = function() {
    count += 1;
  };

  //initialization code
  public.reset();

  return public;
})();

console.log("The count is: "  + counter.getCount());

counter.inc();
counter.inc();

console.log("The count went up to: "  + counter.getCount());

counter.count = 3.14159;

console.log("The count is still: "  + counter.getCount());

counter.reset();

console.log("The count is now: "  + counter.getCount());
