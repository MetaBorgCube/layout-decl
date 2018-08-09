package org.spoofax.jsglr2.layoutsensitive;

import java.util.List;

import org.metaborg.parsetable.IProduction;
import org.metaborg.parsetable.ProductionType;
import org.spoofax.jsglr2.parseforest.IDerivation;
import org.spoofax.jsglr2.parseforest.basic.BasicParseForest;
import org.spoofax.jsglr2.parseforest.basic.RuleNode;
import org.spoofax.jsglr2.parser.Parse;
import org.spoofax.jsglr2.parser.Position;
import org.spoofax.jsglr2.parser.PositionInterval;

import com.google.common.collect.Lists;

public class LayoutSensitiveRuleNode extends RuleNode implements IDerivation<BasicParseForest> {

    public LayoutSensitiveRuleNode(int nodeNumber, Parse<?, ?> parse, Position startPosition, Position leftPosition,
        Position rightPosition, Position endPosition, IProduction production, ProductionType productionType,
        BasicParseForest[] parseForests) {
        super(nodeNumber, parse, startPosition, endPosition, production, productionType, parseForests);
        this.leftPosition = leftPosition;
        this.rightPosition = rightPosition;
    }

    public List<PositionInterval> getLongestMatchPositions() {
        List<PositionInterval> result = Lists.newArrayList();
        if(production.isLongestMatch()) {
            result.add(new PositionInterval(startPosition, endPosition));
        }
        for(BasicParseForest pf : parseForests) {
            if(pf instanceof LayoutSensitiveRuleNode) {
                result.addAll(((LayoutSensitiveRuleNode) pf).getLongestMatchPositions());
            } else if(pf instanceof LayoutSensitiveSymbolNode) {
                List<PositionInterval> positions = ((LayoutSensitiveSymbolNode) pf).getLongestMatchPositions();
                if(positions == null) {
                    System.out.println("");
                }
                
                result.addAll(positions);
            }
        }
        return result;
    }

}
