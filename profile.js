//button
let btnSave = document.getElementById("btnSave");
btnSave.addEventListener("click",func);

function func(e)
{
    console.log("Click kiya !!!");

    // profile 
    let pName = document.getElementById('pName');
    console.log(pName.innerText);
    
    let pMob = document.getElementById('pMob');
    console.log(pMob.innerText);
    
    let pEmail = document.getElementById('pEmail');
    console.log(pEmail.innerText);

    let pAddress  = document.getElementById('pAddress');
    console.log(pAddress);

    let pCity  = document.getElementById('pCity');
    console.log(pCity);
    
    // form
    
    let textName = document.getElementById("textName").value;
    console.log(textName);
    document.getElementById("pName").innerHTML = textName;
    
    let textMob = document.getElementById("textMob").value;
    console.log(textMob);
    document.getElementById("pMob").innerHTML = textMob;
 
    let textEmail = document.getElementById("textEmail").value;
    console.log(textEmail);
    document.getElementById("pEmail").innerHTML = textEmail;
   
    let textStreet = document.getElementById("textStreet").value;
    console.log(textStreet);
    document.getElementById("pAddress").innerHTML = textStreet;

    let textCity = document.getElementById("textCity").value;
    console.log(textCity);
    document.getElementById("pCity").innerHTML = textCity;
    
    //img
    let imgUser = document.getElementById("imgUser").firstElementChild;
    
    console.log(pEmail.innerText);

    e.preventDefault();

}