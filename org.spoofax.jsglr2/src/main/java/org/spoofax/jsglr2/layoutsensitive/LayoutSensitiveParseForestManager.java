package org.spoofax.jsglr2.layoutsensitive;

import java.util.ArrayList;
import java.util.List;

import org.metaborg.parsetable.IProduction;
import org.metaborg.parsetable.ProductionType;
import org.spoofax.jsglr2.parseforest.ParseForestManager;
import org.spoofax.jsglr2.parseforest.basic.BasicParseForest;
import org.spoofax.jsglr2.parseforest.basic.TermNode;
import org.spoofax.jsglr2.parser.Parse;
import org.spoofax.jsglr2.parser.Position;

public class LayoutSensitiveParseForestManager
    extends ParseForestManager<BasicParseForest, LayoutSensitiveSymbolNode, LayoutSensitiveRuleNode> {

    @Override public LayoutSensitiveSymbolNode createParseNode(Parse<BasicParseForest, ?> parse, Position beginPosition,
        IProduction production, LayoutSensitiveRuleNode firstDerivation) {
        LayoutSensitiveSymbolNode symbolNode = new LayoutSensitiveSymbolNode(parse.parseNodeCount++, parse,
            beginPosition, parse.currentPosition(), production);

        // parse.notify(observer -> observer.createParseNode(symbolNode, production));

        addDerivation(parse, symbolNode, firstDerivation);

        return symbolNode;
    }

    @Override public BasicParseForest filterStartSymbol(BasicParseForest parseForest, String startSymbol) {
        LayoutSensitiveSymbolNode topNode = (LayoutSensitiveSymbolNode) parseForest;
        List<LayoutSensitiveRuleNode> result = new ArrayList<LayoutSensitiveRuleNode>();

        for(LayoutSensitiveRuleNode derivation : topNode.getDerivations()) {
            String derivationStartSymbol = derivation.production.startSymbolSort();

            if(derivationStartSymbol != null && derivationStartSymbol.equals(startSymbol))
                result.add(derivation);
        }

        if(result.isEmpty())
            return null;
        else {
            LayoutSensitiveSymbolNode filteredTopNode = new LayoutSensitiveSymbolNode(topNode.nodeNumber, topNode.parse,
                topNode.startPosition, topNode.endPosition, topNode.production);

            for(LayoutSensitiveRuleNode derivation : result)
                filteredTopNode.addDerivation(derivation);

            return filteredTopNode;
        }
    }

    @Override public LayoutSensitiveRuleNode createDerivation(Parse<BasicParseForest, ?> parse, Position beginPosition,
        IProduction production, ProductionType productionType, BasicParseForest[] parseForests) {

        // FIXME since EndPosition is wrong, right is also wrong
        Position leftPosition = null;
        Position rightPosition = null;

        for(BasicParseForest pf : parseForests) {
            if(pf instanceof LayoutSensitiveSymbolNode && (((LayoutSensitiveSymbolNode) pf).getProduction().isLayout()
                || ((LayoutSensitiveSymbolNode) pf).getProduction().isIgnoreLayoutConstraint())) {
                continue;
            }
            if(pf instanceof LayoutSensitiveSymbolNode) {
                Position currentStartPosition = ((LayoutSensitiveSymbolNode) pf).getOnlyDerivation().startPosition;
                Position currentLeftPosition = ((LayoutSensitiveSymbolNode) pf).getOnlyDerivation().leftPosition;
                Position currentEndPosition = ((LayoutSensitiveSymbolNode) pf).getOnlyDerivation().endPosition;

                if(currentLeftPosition != null) {
                    leftPosition = leftMost(leftPosition, currentLeftPosition);
                }

                if(currentStartPosition.line > beginPosition.line && !currentStartPosition.equals(currentEndPosition)) {
                    leftPosition = leftMost(leftPosition, currentStartPosition);
                }

            } else if(pf instanceof TermNode) {
                if(pf.startPosition.line > beginPosition.line && pf.startPosition.column < beginPosition.column) {
                    leftPosition =
                        new Position(pf.startPosition.offset, pf.startPosition.line, pf.startPosition.column);
                }
                if(pf.endPosition.line < parse.currentPosition().line
                    && pf.endPosition.column > parse.currentPosition().column) {
                    rightPosition = new Position(pf.endPosition.offset, pf.endPosition.line, pf.endPosition.column);
                }
            } else if(pf != null) {
                System.err.println("Not a valid tree node.");
            }
        }

        LayoutSensitiveRuleNode ruleNode = new LayoutSensitiveRuleNode(parse.parseNodeCount++, parse, beginPosition,
            leftPosition, rightPosition, parse.currentPosition(), production, productionType, parseForests);

        // parse.notify(observer -> observer.createDerivation(ruleNode.nodeNumber, production, parseForests));

        return ruleNode;
    }


    private Position leftMost(Position p1, Position p2) {
        if(p1 == null) {
            return p2;
        }

        if(p1.column > p2.column) {
            return p2;
        }

        return p1;
    }

    @Override public void addDerivation(Parse<BasicParseForest, ?> parse, LayoutSensitiveSymbolNode symbolNode,
        LayoutSensitiveRuleNode ruleNode) {
        // parse.notify(observer -> observer.addDerivation(symbolNode));

        boolean initNonAmbiguous = symbolNode.isAmbiguous();

        symbolNode.addDerivation(ruleNode);

        if(initNonAmbiguous && symbolNode.isAmbiguous())
            parse.ambiguousParseNodes++;
    }

    @Override public TermNode createCharacterNode(Parse<BasicParseForest, ?> parse) {
        TermNode termNode = new TermNode(parse.parseNodeCount++, parse, parse.currentPosition(), parse.currentChar);

        // parse.notify(observer -> observer.createCharacterNode(termNode, termNode.character));

        return termNode;
    }

    @Override public BasicParseForest[] parseForestsArray(int length) {
        return new BasicParseForest[length];
    }

}
