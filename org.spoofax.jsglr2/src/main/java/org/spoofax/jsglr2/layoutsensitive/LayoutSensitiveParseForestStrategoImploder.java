package org.spoofax.jsglr2.layoutsensitive;

import java.util.List;

import org.metaborg.parsetable.IProduction;
import org.spoofax.jsglr2.imploder.StrategoTermImploder;
import org.spoofax.jsglr2.parseforest.basic.BasicParseForest;

public class LayoutSensitiveParseForestStrategoImploder
    extends StrategoTermImploder<BasicParseForest, LayoutSensitiveSymbolNode, LayoutSensitiveRuleNode> {

    public LayoutSensitiveParseForestStrategoImploder() {
        super(new LayoutSensitiveParseForestTokenizer());
    }

    @Override protected IProduction parseNodeProduction(LayoutSensitiveSymbolNode symbolNode) {
        return symbolNode.production;
    }

    @Override protected LayoutSensitiveRuleNode parseNodeOnlyDerivation(LayoutSensitiveSymbolNode symbolNode) {
        return symbolNode.getOnlyDerivation();
    }

    @Override protected List<LayoutSensitiveRuleNode>
        parseNodePreferredAvoidedDerivations(LayoutSensitiveSymbolNode symbolNode) {
        return symbolNode.getPreferredAvoidedDerivations();
    }

    @Override protected List<LayoutSensitiveRuleNode>
        longestMatchedDerivations(List<LayoutSensitiveRuleNode> derivations) {
////        // TODO remove derivations according to longest match criteria
////        // get the derivations where longest match node expands the most
////
////        // collect longestMatch nodes
////
//        
//        List<List<LayoutSensitiveRuleNode>> longestMatchNodes = Lists.newArrayList();
////
////        System.out.println(derivations.size() + " derivations ");
////        int deriv = 0;
//        for(LayoutSensitiveRuleNode rn : derivations) {
////            System.out.println("derivation " + deriv);
//            List<LayoutSensitiveRuleNode> currentLongestMatchNodes = collectLongestMatchNodes(rn);
//            longestMatchNodes.add(currentLongestMatchNodes);
////            for(LayoutSensitiveRuleNode ln : currentLongestMatchNodes) {
////                System.out.println(ln.startPosition + ", " + ln.endPosition);
////            }
////            deriv++;
//        }
//
//        int size = -1;
//
//        int currentLongestDerivation = 0;
//        boolean disambiguatedLongestMatch = false;
//
//        for(int i = 1; i < longestMatchNodes.size(); i++) {
//            List<LayoutSensitiveRuleNode> list = longestMatchNodes.get(i);
//
//            // FIXME: list of longest-match nodes should be the same?
//            if(size == -1) {
//                size = list.size();
//            } else if(size != list.size()) {
//                System.out.println("Number of longest match nodes differ");
//            }
//
//            for(int j = 0; j < list.size(); j++) {
//                Boolean secondNodeExpandsLonger =
//                    expandsLonger(longestMatchNodes.get(currentLongestDerivation).get(j), list.get(j));
//                if(secondNodeExpandsLonger == null) {
//                    continue;
//                } else if(secondNodeExpandsLonger) {
//                    currentLongestDerivation = i;
//                    disambiguatedLongestMatch = true;
//                    break;
//                } else {
//                    disambiguatedLongestMatch = true;
//                    break;
//                }
//            }            
//        }
//
//        if(disambiguatedLongestMatch) {
////            System.out.println("chose " + currentLongestDerivation);
//            return Lists.newArrayList(derivations.get(currentLongestDerivation));            
//        }
//
        return derivations;
    }
//
//    // whether node2 expands longer than node1
//    private Boolean expandsLonger(LayoutSensitiveRuleNode node1, LayoutSensitiveRuleNode node2) {
//        assert (node1.startPosition.equals(node2.startPosition));
//
//        if(node2.endPosition.line > node1.endPosition.line || (node2.endPosition.line == node1.endPosition.line
//            && node2.endPosition.column > node1.endPosition.column)) {
//            return true;
//        } else if(node1.endPosition.line > node2.endPosition.line || (node1.endPosition.line == node2.endPosition.line
//            && node1.endPosition.column > node2.endPosition.column)) {
//            return false;
//        }
//
//        return null;
//    }
//
//    private List<LayoutSensitiveRuleNode> collectLongestMatchNodes(LayoutSensitiveRuleNode rn) {
//        List<LayoutSensitiveRuleNode> result = Lists.newArrayList();
//
//        if(rn.production.isLongestMatch()) {
//            result.add(rn);
//        }
//
//        for(BasicParseForest pf : rn.parseForests) {
//            if(pf instanceof LayoutSensitiveSymbolNode) {
//                if(((LayoutSensitiveSymbolNode) pf).getDerivations().size() > 1) {
////                    List<LayoutSensitiveRuleNode> derivations = ((LayoutSensitiveSymbolNode) pf).getDerivations();
////                    List<LayoutSensitiveRuleNode> subNodes = longestMatchedDerivations(derivations);
////                    LayoutSensitiveRuleNode onlyDerivation = ((LayoutSensitiveSymbolNode) pf).getOnlyDerivation();
//                    result.addAll(collectLongestMatchNodes(((LayoutSensitiveSymbolNode) pf).getOnlyDerivation()));
//                } else {
//                    result.addAll(collectLongestMatchNodes(((LayoutSensitiveSymbolNode) pf).getOnlyDerivation()));
//                }
//            } else if(pf instanceof LayoutSensitiveRuleNode) {
//                result.addAll(collectLongestMatchNodes((LayoutSensitiveRuleNode) pf));
//            }
//        }
//
//
//        return result;
//    }



}
