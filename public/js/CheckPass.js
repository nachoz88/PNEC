function CheckPass()
{
    var pass1 = document.getElementById('inputPassword');
    var pass2 = document.getElementById('confirmPassword');

    //Store the Confimation Message Object ...
    var message = document.getElementById('confirmMessage');

    //Set the colors we will be using ...
    var goodColor = "#66cc66";
    var badColor = "#ff6666";
    //Compare the values in the password field 
    //and the confirmation field

        if (/*pass1.value=="" && */pass2.value=="")
    {
        message.innerHTML = ""
    }


    else if(pass1.value == pass2.value && pass1.value!=""){
        //The passwords match. 
        //Set the color to the good color and inform
        //the user that they have entered the correct password         
        message.style.color = goodColor;
        message.innerHTML = "Passwords Match!"
    }
     
        
    else if (pass1.value=="")
    {
        message.style.color = badColor;
        message.innerHTML = "Password field empty"
    }

    else
    {
        //The passwords do not match.
        //Set the color to the bad color and
        //notify the user.
        message.style.color = badColor;
        message.innerHTML = "Passwords Do Not Match!"
    }
}