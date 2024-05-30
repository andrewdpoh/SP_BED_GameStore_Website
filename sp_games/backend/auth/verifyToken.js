const jwt = require('jsonwebtoken');
const JWT_SECRET = require('../jwtConfig.js');

var verifyToken = (req, res, next) => {
    let authHeader = req.headers.authorization;
    if (!authHeader || !authHeader.startsWith("Bearer ")) {
        res.status(403).send({
            auth: 'false',
            message: 'Not authorized'
        });
        return;
    };
    let token = authHeader.replace("Bearer ", "");
    jwt.verify(token, JWT_SECRET, (err, decoded) => {
        if (err) {
            res.status(403).send({
                auth: 'false',
                message: 'Not authorized'
            });
            return;
        }
        req.token = decoded;
        next();
    })
};

module.exports = verifyToken;