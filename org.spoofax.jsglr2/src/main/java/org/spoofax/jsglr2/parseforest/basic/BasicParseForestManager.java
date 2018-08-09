package org.spoofax.jsglr2.parseforest.basic;

import java.util.ArrayList;
import java.util.List;

import org.metaborg.parsetable.IProduction;
import org.metaborg.parsetable.ProductionType;
import org.spoofax.jsglr2.parseforest.ParseForestManager;
import org.spoofax.jsglr2.parser.Parse;
import org.spoofax.jsglr2.parser.Position;

public class BasicParseForestManager extends ParseForestManager<BasicParseForest, SymbolNode, RuleNode> {

    @Override public SymbolNode createParseNode(Parse<BasicParseForest, ?> parse, Position beginPosition,
        IProduction production, RuleNode firstDerivation) {
        SymbolNode symbolNode =
            new SymbolNode(parse.parseNodeCount++, parse, beginPosition, parse.currentPosition(), production);

        // parse.notify(observer -> observer.createParseNode(symbolNode, production));

        addDerivation(parse, symbolNode, firstDerivation);

        return symbolNode;
    }

    @Override public BasicParseForest filterStartSymbol(BasicParseForest parseForest, String startSymbol) {
        SymbolNode topNode = (SymbolNode) parseForest;
        List<RuleNode> result = new ArrayList<RuleNode>();

        for(RuleNode derivation : topNode.getDerivations()) {
            String derivationStartSymbol = derivation.production.startSymbolSort();

            if(derivationStartSymbol != null && derivationStartSymbol.equals(startSymbol))
                result.add(derivation);
        }

        if(result.isEmpty())
            return null;
        else {
            SymbolNode filteredTopNode = new SymbolNode(topNode.nodeNumber, topNode.parse, topNode.startPosition,
                topNode.endPosition, topNode.production);

            for(RuleNode derivation : result)
                filteredTopNode.addDerivation(derivation);

            return filteredTopNode;
        }
    }

    @Override public RuleNode createDerivation(Parse<BasicParseForest, ?> parse, Position beginPosition,
        IProduction production, ProductionType productionType, BasicParseForest[] parseForests) {

        Position leftPosition = null;
        Position rightPosition = null;

        for(BasicParseForest pf : parseForests) {
            if(pf instanceof SymbolNode) {
                Position currentStartPosition = ((SymbolNode) pf).getOnlyDerivation().startPosition;
                Position currentLeftPosition = ((SymbolNode) pf).getOnlyDerivation().leftPosition;
                Position currentRightPosition = ((SymbolNode) pf).getOnlyDerivation().rightPosition;
                Position currentEndPosition = ((SymbolNode) pf).getOnlyDerivation().endPosition;

                if(currentLeftPosition != null) {
                    leftPosition = leftMost(leftPosition, currentLeftPosition);
                }

                if(currentStartPosition.line > beginPosition.line && !currentStartPosition.equals(currentEndPosition)) {
                    leftPosition = leftMost(leftPosition, currentStartPosition);
                }

                if(currentRightPosition != null) {
                    rightPosition = rightMost(rightPosition, currentRightPosition);
                }

                if(currentEndPosition.line < parse.currentPosition().line
                    && !currentStartPosition.equals(currentEndPosition)) {
                    rightPosition = rightMost(rightPosition, currentEndPosition);
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



        RuleNode ruleNode = new RuleNode(parse.parseNodeCount++, parse, beginPosition, parse.currentPosition(),
            production, productionType, parseForests);
        ruleNode.leftPosition = leftPosition;
        ruleNode.rightPosition = rightPosition;

        // parse.notify(observer -> observer.createDerivation(ruleNode.nodeNumber, production, parseForests));

        return ruleNode;
    }

    @Override public void addDerivation(Parse<BasicParseForest, ?> parse, SymbolNode symbolNode, RuleNode ruleNode) {
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

    private Position leftMost(Position p1, Position p2) {
        if(p1 == null) {
            return p2;
        }

        if(p1.column > p2.column) {
            return p2;
        }

        return p1;
    }

    private Position rightMost(Position p1, Position p2) {
        if(p1 == null) {
            return p2;
        }

        if(p1.column < p2.column) {
            return p2;
        }

        return p1;
    }


}
