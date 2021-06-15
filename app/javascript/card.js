const pay = () => {
  Payjp.setPublicKey("pk_test_8e6273bd6d9b0be9807cb3a5"); 
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number:     formData.get("purchase_shipping_address[number]"),
      cvc:        formData.get("purchase_shipping_address[cvc]"),
      exp_month:  formData.get("purchase_shipping_address[exp_month]"),
      exp_year:   `20${formData.get("purchase_shipping_address[exp_year]")}`,
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("purchase_shipping_address[number]").removeAttribute("name");
      document.getElementById("purchase_shipping_address[cvc]").removeAttribute("name");
      document.getElementById("purchase_shipping_address[exp_month]").removeAttribute("name");
      document.getElementById("purchase_shipping_address[exp_year]").removeAttribute("name");

      document.getElementById("charge-form").onsubmit();
    });
  });
};

window.addEventListener("load", pay);