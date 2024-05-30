$(document).ready(() => {
    $('#Signup').click(() => {
        let data = {
            username: $(signUpUsername).val(),
            email: $(signUpEmail).val(),
            password: $(signUpPassword).val(),
            type: 'customer',
            profile_pic_url: ''
        }
        axios.post('http://localhost:3000/users/', data)
            .then((res) => {
                document.getElementById('accountCreationSuccess').hidden = false;
            })
            .catch((err) => {
            console.log('err', err);
            document.getElementById('accountCreationFailure').hidden = false;
            });
        return false;
    })
})