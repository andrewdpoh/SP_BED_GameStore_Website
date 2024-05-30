$(document).ready(() => {
    $('#Login').click(() => {
        let data = {
            email: $('#signInEmail').val(),
            password: $('#signInPassword').val()
        }
        axios.post('http://localhost:3000/user/login', data)
            .then((res) => {
                if (res.data.token == null) {
                    document.getElementById('invalidUserAlert').hidden = false;
                    return;
                }
                localStorage.setItem('token', res.data.token);
                location.assign('http://localhost:3001/index.html');
            })
            .catch((err) => {
                console.log(err)
                document.getElementById('invalidUserAlert').hidden = false;
            });
        return false;
    })
});