let express = require('express');
let router = express.Router();

module.exports = router

///server side velocity computation
router.get('/compute', function (req, res) {

    if(req.query = {}) {
        res.send({ data: 'invalid data'  })
        return 0
    }

    let PythonShell = require('python-shell');
    let pyshell = new PythonShell('./compute_input.py', { mode: 'json' });

    let data = req.query

    pyshell.options

    pyshell.send(data)

    pyshell.on('message', function (message) {
    // received a message sent from the Python script (a simple "print" statement)
        res.send(message)
        // console.log(message);
    });

    // end the input stream and allow the process to exit
    pyshell.end(function (err) {
        if (err) throw err;
        console.log('python script for time series processing done');
    });
})
