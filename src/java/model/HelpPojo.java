/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

/**
 *
 * @author Bhaskor
 */
public class HelpPojo {
    private String helpId;
    private String helpDetails;
    private String type;
    private String helpQuantity;

    public HelpPojo() {
    }
    
    public String getHelpId() {
        return helpId;
    }

    public void setHelpId(String helpId) {
        this.helpId = helpId;
    }

    public String getHelpDetails() {
        return helpDetails;
    }

    public void setHelpDetails(String helpDetails) {
        this.helpDetails = helpDetails;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getHelpQuantity() {
        return helpQuantity;
    }

    public void setHelpQuantity(String helpQuantity) {
        this.helpQuantity = helpQuantity;
    }

 
}
