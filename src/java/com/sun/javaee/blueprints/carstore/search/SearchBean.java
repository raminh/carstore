/* Copyright 2006 Sun Microsystems, Inc. All rights reserved. You may not modify, use, reproduce, or distribute this software except in compliance with the terms of the License at: http://developer.sun.com/berkeley_license.html
$Id: SearchBean.java,v 1.6 2007/01/17 18:00:08 basler Exp $ */

package com.sun.javaee.blueprints.carstore.search;

import com.sun.javaee.blueprints.carstore.model.CatalogFacade;
import com.sun.javaee.blueprints.carstore.model.Item;
import com.sun.javaee.blueprints.carstore.util.CarstoreConstants;
import java.util.List;



/**
 *
 * @author basler
 */
public class SearchBean {
    
    public String searchString="TOYOTA";
    private boolean searchTags=true, showResults=false;
    private List<IndexDocument> hitsList=null;
    private List<Item> itemList=null;
    public  CatalogFacade itemlistcat;

    
    /** Creates a new instance of SearchBean */
    public SearchBean() {
        itemlistcat =new CatalogFacade();
    }
    
    
    public void setSearchString(String searchString) {
        this.searchString=searchString;
    }
    public String getSearchString() {
        return searchString;
    }
    
    public void setSearchTags(boolean searchTags) {
        this.searchTags=searchTags;
    }
    public boolean getSearchTags() {
        return searchTags;
    }

    public void setShowResults(boolean showResults) {
        this.showResults=showResults;
    }
    public boolean getShowResults() {
        return showResults;
    }

    
    public List<IndexDocument> getHits() {
        return hitsList;
    }

    public List<Item> getItems() {
        return itemList;
    }
  
    
    public String searchAction() {
        // perform search
        try {
            
            // string to search
            SearchIndex si=new SearchIndex();
            // alter search string if tagged
            String searchxx=searchString;
            if(searchTags && searchString.indexOf(":") < 0) {
                searchxx="disabled:0 AND (contents:" + searchString + " OR tag:" + searchString + ")";
            }
            hitsList=si.query(CarstoreConstants.CARSTORE_INDEX_DIRECTORY, searchxx);
            setShowResults(true);
        } catch (Exception e) {
            e.printStackTrace();
        }

 //       itemList = itemlistcat.getItemsByCarName(searchString, 0, 9);
        
 //       setShowResults(true);
        return "displayResults";
    }
 
}
