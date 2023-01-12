package com.codeup.adlister.util;

public class Validate {
    public static Boolean checkValidEmail(String email){
        int atCounter = 0;
        for (int i = 0; i < email.length(); i++ ){
            if(email.charAt(i) == '@'){
                atCounter += 1;
            }
        }
        Boolean validEmail = (atCounter == 1);
        return validEmail;
    }
}
