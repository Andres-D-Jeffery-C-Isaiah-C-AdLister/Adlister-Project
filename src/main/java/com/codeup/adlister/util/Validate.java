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

    public static Boolean checkInvalidRegistration(String username, String email, String password, String passwordConfirmation){
        return (
                username.isEmpty() ||
                email.isEmpty() ||
                (!checkValidEmail(email)) ||
                password.isEmpty() ||
                (!password.equals(passwordConfirmation))
        );
    }
}
