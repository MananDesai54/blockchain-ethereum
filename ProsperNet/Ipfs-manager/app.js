const ipfsClient = require('ipfs-http-client');
const express = require('express');
const bodyParser = require('body-parser');
const fileUpload = require('express-fileupload');
const fs = require('fs');
const cors = require('cors');


const ipfs = ipfsClient.create({ host: 'localhost', port: '5001', protocol: 'http' })

const app = express();
app.use(cors('*'));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(fileUpload());

app.post('/upload', (req, res) => {
    const file1 = req.files.file;
    const fileName = req.body.fileName;
    const filePath = 'files/' + fileName;
    file1.mv(filePath, async (err) => {
        if (err) {
            console.log(err);
            res.json({ error: err, status: 500 })
        }

        const fileHash = await addFile(fileName, filePath);
        fs.unlink(filePath, (err) => {
            if (err) console.log(err);
        });
        res.json({ fileHash: fileHash.toString() })
    });
});

const addFile = async (fileName, filePath) => {
    const file = fs.readFileSync(filePath);
    const fileAdded = await ipfs.add({ path: fileName, content: file });
    const fileHash = fileAdded.cid;
    return fileHash;
}

app.listen(8000, () => {
    console.log('Server is listening on port 8000');
});