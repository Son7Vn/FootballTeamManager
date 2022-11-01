const Teamate = require("../Models/Teamate")

const teamateControllers = {
    findAllTeamate: async (req,res) => {
        try {
            const dataTeamate = await Teamate.find()
            res.status(200).json({dataTeamate})
        } catch (error) {
            res.status(500).json(error)
        }
    },
    addTeamate: async (req,res) => {
        try {
            const newTeamate = new Teamate({
                ten: req.body.ten,
                soao: req.body.soao,
                phone: req.body.phone,
                sizeao: req.body.sizeao,
                namsinh: req.body.namsinh,
                vitri: req.body.vitri,
                bqt: req.body.bqt
            })

            await newTeamate.save()

            res.status(200).json(newTeamate)
        } catch (error) {
            res.status(500).json(error)
        }
    },
    updateTeamate: async (req,res) => {
        try {
            if (req.body.id) {
                const dataFind = await Teamate.findById(req.body.id)

                dataFind.ten = req.body.ten;
                dataFind.soao = req.body.soao;
                dataFind.phone = req.body.phone;
                dataFind.sizeao = req.body.sizeao;
                dataFind.namsinh = req.body.namsinh;
                dataFind.vitri = req.body.vitri;
                dataFind.bqt = req.body.bqt;

                await dataFind.save()

                res.status(200).json({message: "Update is ok!", data: dataFind})
            } else {
                res.status(404).json({message: "validate id first!"})
            }
            
        } catch (error) {
            console.log(error)
            res.status(500).json(error)
        }
    },
    deleteTeamate: async (req,res) => {
            if (req.body.id) {
                Teamate.findById(req.body.id, (err, data) => {
                    if(err) {
                        res.status(404).json(err)
                    } else {
                        if (data) {
                            Teamate.findByIdAndDelete(req.body.id, (err) => {
                                if(err) {
                                    res.status(404).json(err)
                                } else {
                                    res.status(200).json({message: "Delete is ok!"})
                                }
                            })
                        } else {
                            res.status(404).json({message: "Could not be find id"})
                        }
                    }
                })
            } else {
                res.status(404).json({message: "Please provide the id"})
            }
    }

}

module.exports = teamateControllers;