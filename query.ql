import python
import semmle.python.security.TaintTracking


class ExampleTaint extends TaintKind {

    ExampleTaint() { this = "example" }

}

class ExampleSink extends TaintSink {

    ExampleSink() {
        exists(CallNode call |
            call.getFunction().(NameNode).getId() = "SINK" and
            this = call.getAnArg()
        )
    }

    override predicate sinks(TaintKind taint) {
        taint instanceof ExampleTaint
    }

}

class ExampleSource extends TaintSource {

    ExampleSource() { this.(NameNode).getId() = "SOURCE" }

    override predicate isSourceOf(TaintKind kind) {
        kind instanceof ExampleTaint
    }

}

class ExampleSanitizer extends Sanitizer {

    ExampleSanitizer() { this = "Example sanitizer" }

    override predicate sanitizingNode(TaintKind taint, ControlFlowNode node) { 
        node.(CallNode).getFunction().(NameNode).getId() = "SANITIZE" and
        taint instanceof ExampleTaint
    }

}

from TaintSource src, TaintSink sink
where src.flowsToSink(sink)

select src, sink

