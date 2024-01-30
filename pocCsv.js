// Función para convertir CSV a JSON
function csvToJson(csv) {
    const lines = csv.split('\n');
    const result = [];
    const headers = lines[0].split(',');

    for (let i = 1; i < lines.length; i++) {
        let obj = {};
        let currentline = lines[i].split(',');

        for (let j = 0; j < headers.length; j++) {
            obj[headers[j]] = currentline[j];
        }

        result.push(obj);
    }

    return result;
}

export const handler = async (req, res) => {
    try {
        // Asegúrate de que estás accediendo correctamente al string base64
        const base64String = req.body.data;

        if (!base64String || typeof base64String !== 'string') {
            return res.status(400).send("Se requiere un string base64 válido");
        }

        const csvString = Buffer.from(base64String, 'base64').toString('utf-8');
        const jsonResult = csvToJson(csvString);

        console.log(jsonResult);
        res.status(200).json(jsonResult);
    } catch (error) {
        res.status(500).send('Error al procesar la solicitud: ' + error.message);
    }
};

