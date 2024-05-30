$(document).ready(() => {
    $('#purchase').click(() => {
        axios.get('http://localhost:3000/cart')
        .then((res) => {
            return axios.post('http://localhost:3000/purchase', {}, {
                headers: {'authorization':`Bearer ${localStorage.getItem('token')}`}
            })
        })
        .then((res) => {
            return axios.delete('http://localhost:3000/cart', {
                headers: {'authorization':`Bearer ${localStorage.getItem('token')}`}
            })
        })
        .then((res) => {
            $('#checkoutDiv')[0].hidden = true;
            $('#successDiv')[0].hidden = false;
        })
        .catch((err) => {
            if (err.response.status == 404) { // if cart is empty
                $('#checkoutDiv')[0].hidden = true;
                $('#noItemsDiv')[0].hidden = false;
                return;
            }
            console.log(err)
        })
    })
    return false;
})