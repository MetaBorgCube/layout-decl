package org.spoofax.jsglr2.layoutsensitive;

import org.metaborg.sdf2table.grammar.layoutconstraints.ArithmeticLayoutConstraint;
import org.metaborg.sdf2table.grammar.layoutconstraints.BooleanLayoutConstraint;
import org.metaborg.sdf2table.grammar.layoutconstraints.ComparisonLayoutConstraint;
import org.metaborg.sdf2table.grammar.layoutconstraints.ConstraintElement;
import org.metaborg.sdf2table.grammar.layoutconstraints.ILayoutConstraint;
import org.metaborg.sdf2table.grammar.layoutconstraints.NumericLayoutConstraint;
import org.spoofax.jsglr2.parseforest.AbstractParseForest;

public class LayoutConstraintEvaluator<ParseForest extends AbstractParseForest> {

    public boolean evaluate(ILayoutConstraint layoutConstraint, ParseForest[] parseNodes) throws Exception {

        boolean noValue = false;

        try {
            if(layoutConstraint instanceof ComparisonLayoutConstraint) {
                int c1Result = evaluateNumeric(((ComparisonLayoutConstraint) layoutConstraint).getC1(), parseNodes);
                int c2Result = evaluateNumeric(((ComparisonLayoutConstraint) layoutConstraint).getC2(), parseNodes);
                switch(((ComparisonLayoutConstraint) layoutConstraint).getOp()) {
                    case EQ:
                        return c1Result == c2Result;
                    case GE:
                        return c1Result >= c2Result;
                    case GT:
                        return c1Result > c2Result;
                    case LE:
                        return c1Result <= c2Result;
                    case LT:
                        return c1Result < c2Result;
                }
            }
            
            if(layoutConstraint instanceof BooleanLayoutConstraint) {
                switch(((BooleanLayoutConstraint) layoutConstraint).getOp()) {
                    case AND:
                        return evaluate(((BooleanLayoutConstraint) layoutConstraint).getC1(), parseNodes)
                            && evaluate(((BooleanLayoutConstraint) layoutConstraint).getC2(), parseNodes);
                    case OR:
                        return evaluate(((BooleanLayoutConstraint) layoutConstraint).getC1(), parseNodes)
                            || evaluate(((BooleanLayoutConstraint) layoutConstraint).getC2(), parseNodes);
                    case NOT:
                        return !evaluate(((BooleanLayoutConstraint) layoutConstraint).getC1(), parseNodes);
                }
            }
        } catch(NoValueLayoutException e) {
            noValue = true;
        }
        
        if(noValue) {
            return true;
        } else {
            throw new Exception("Could not evaluate constraint: " + layoutConstraint);
        }
    }

    private int evaluateNumeric(ILayoutConstraint layoutConstraint, ParseForest[] parseNodes) throws Exception {
        
        if(layoutConstraint instanceof NumericLayoutConstraint) {
            ParseForest tree =  parseNodes[((NumericLayoutConstraint) layoutConstraint).getTree()]; //selectCorrectTree(((NumericLayoutConstraint) layoutConstraint).getTree(), parseNodes);

            if(tree instanceof LayoutSensitiveSymbolNode
                && ((LayoutSensitiveSymbolNode) tree).getProduction().isIgnoreLayoutConstraint()) {
                throw new NoValueLayoutException();
            }

            switch(((NumericLayoutConstraint) layoutConstraint).getToken()) {
                case FIRST:
                    if(((NumericLayoutConstraint) layoutConstraint).getElem() == ConstraintElement.COL) {
                        return tree.startPosition.column;
                    } else {
                        return tree.startPosition.line;
                    }
                case LAST:
                    if(((NumericLayoutConstraint) layoutConstraint).getElem() == ConstraintElement.COL) {
                        return tree.endPosition.column;
                    } else {
                        return tree.endPosition.line;
                    }
                case LEFT:
                    if(tree instanceof LayoutSensitiveSymbolNode) {
                        if(((LayoutSensitiveSymbolNode) tree).getOnlyDerivation().leftPosition == null) {
                            throw new NoValueLayoutException();
                        } else if(((NumericLayoutConstraint) layoutConstraint).getElem() == ConstraintElement.COL) {
                            return ((LayoutSensitiveSymbolNode) tree).getOnlyDerivation().leftPosition.column;
                        } else {
                            return ((LayoutSensitiveSymbolNode) tree).getOnlyDerivation().leftPosition.line;
                        }
                    }
                    throw new NoValueLayoutException();
                case RIGHT:
                    // TODO implement this
                    throw new NoValueLayoutException();
            }
        }
        
        if(layoutConstraint instanceof ArithmeticLayoutConstraint) {
            switch(((ArithmeticLayoutConstraint) layoutConstraint).getOp()) {
                case ADD:
                    return evaluateNumeric(((ArithmeticLayoutConstraint) layoutConstraint).getC1(), parseNodes)
                        + evaluateNumeric(((ArithmeticLayoutConstraint) layoutConstraint).getC2(), parseNodes);
                case DIV:
                    return evaluateNumeric(((ArithmeticLayoutConstraint) layoutConstraint).getC1(), parseNodes)
                        / evaluateNumeric(((ArithmeticLayoutConstraint) layoutConstraint).getC2(), parseNodes);
                case MUL:
                    return evaluateNumeric(((ArithmeticLayoutConstraint) layoutConstraint).getC1(), parseNodes)
                        * evaluateNumeric(((ArithmeticLayoutConstraint) layoutConstraint).getC2(), parseNodes);
                case SUB:
                    return evaluateNumeric(((ArithmeticLayoutConstraint) layoutConstraint).getC1(), parseNodes)
                        - evaluateNumeric(((ArithmeticLayoutConstraint) layoutConstraint).getC2(), parseNodes);
            }
        }

        throw new Exception("Could not evaluate constraint: " + layoutConstraint);
    }

}
