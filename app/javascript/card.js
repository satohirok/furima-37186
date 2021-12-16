const pay = () => {
  Payjp.setPublicKey("pk_test_48fc75cabdeae2b0d5f26dbb"); // PAY.JPテスト公開鍵
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    
  });
};

window.addEventListener("load", pay);