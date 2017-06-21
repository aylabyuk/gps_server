import fs from 'fs'
import readChunk from 'read-chunk'
import fileType from 'file-type'

export function getnewPath(fileInfo) {

    const buffer = readChunk.sync(fileInfo.timeseriesPreview.path, 0, 4100)

    let f = fileType(buffer)

    let newf = 'gpsUPLOADS/timeseries/' + fileInfo.siteName + '.' + f.ext

    fs.rename(fileInfo.timeseriesPreview.path, newf, (err) => {
        if(err) throw err;
        fs.stat(newf, (err, stats) => {
            if(err) throw err;
        })
    })

    return newf
}