

def returns_arg(arg):
    return arg
    
def foo(cond):
    x = SOURCE
    if cond:
        x = returns_arg(x)
    else:
        SANITIZE(x)
    SINK(x)

