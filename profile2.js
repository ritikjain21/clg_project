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

    let pImg  = document.getElementById('pImg');
    console.log(pImg);
    
    // form
    
    let textName = document.getElementById("textName").value;
    console.log(textName);
    document.getElementById("pName").innerHTML = textName;
    
    let textEmail = document.getElementById("textEmail").value;
    console.log(textEmail);
    document.getElementById("pEmail").innerHTML = textEmail;
    
    let textMob = document.getElementById("textMob").value;
    console.log(textMob);
    document.getElementById("pMob").innerHTML = textMob;
    
    //img
    let imgUser = document.getElementById("imgUser").firstElementChild;
    
    console.log(pEmail.innerText);

    
    e.preventDefault();
}