

def very_simple():
    x = SOURCE
    SINK(x)
    
def returns_arg(arg):
    return arg
    
def with_call():
    x = SOURCE
    y = returns_arg(x)
    SINK(y)
    
def has_sink(x):
    SINK(x)
    
def has_source():
    return SOURCE

def to_callee():
    a = SOURCE
    has_sink(a)
    
def from_callee():
    a = has_source()
    SINK(a)
    
def up_and_down()
    has_sink(has_source())

# Now with a sanitizer

def safe():
    s = SOURCE
    SANITIZE(s)
    SINK(s)

