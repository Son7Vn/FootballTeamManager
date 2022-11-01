// const { db } = require("../Models/TeamFund");
const TeamFund = require("../Models/TeamFund")

const teamFundControllers = {
    addTeamFund: async (req,res) => {
        try {
            if (req.body.ten && req.body.thang && req.body.nam) {
                const newTeamFund = TeamFund({
                    ten: req.body.ten,
                    tien: req.body.tien,
                    thang: req.body.thang,
                    nam: req.body.nam,
                    idTeamate: req.body.idTeamate,
                    note: req.body.note
                })
                const dataNewTeamFund = await newTeamFund.save()
    
                res.status(200).json(dataNewTeamFund)
            } else {
                res.status(404).json({message: "Please valid ten or thang or nam"})
            }

            

        } catch (error) {
            res.status(500).json({AddFailed: error})
        }
    },
    addManyTeamFund: async(req, res) => {
        try {
            let reqData = JSON.parse(req.body.arrayTFM)
            if (reqData.count == 0) {
                res.status(404).json({message: "Empty array!"})
            } else {
                console.log(reqData)
            const dataHaha = await TeamFund.insertMany(reqData)
            console.log(dataHaha)
            res.status(200).json({dataHaha})
            }
            
        } catch (error) {
            console.log(error)
            res.status(500).json({error})
        }
    }
    ,
    findAllTeamFund: async (req,res) => {
        try {
            const dataFindAll = await TeamFund.find()
            if(dataFindAll.length === 0) {
                res.status(404).json({message: "No data"})
            } else {
                console.log(dataFindAll)
                res.status(200).json(dataFindAll)
            }
            
        } catch (error) {
            res.status(500).json({ErrorFindAllTeamFund: error})
        }
    },
    findAllTeamFundMonth: async (req,res) => {
        try {
            const dataMonth = await TeamFund.find(
                {thang: req.body.thang, nam: req.body.nam}
            )
            res.status(200).json({dataMonth})
        } catch (error) {
            res.status(500).json({ErrorFindAllMonth: error})
        }
    },
    updateMoneyTeamFund: async (req,res) => {
        try {
            const findTeamFund = await TeamFund.findById(req.body.id)
            findTeamFund.tien = req.body.newtien
            findTeamFund.note = req.body.newnote
            await findTeamFund.save()
            res.status(200).json(findTeamFund)

        } catch (error) {
            res.status(500).json({ErrorUpdateTeamFund: error})
        }
    },
    deleteTFM: async (req,res) => {
        try {
            if (req.body.id) {
                TeamFund.findById(req.body.id, (err, data) => {
                    if(err) {
                        res.status(404).json(err)
                    } else {
                        if (data) {
                            TeamFund.findByIdAndDelete(req.body.id, (err) => {
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
        } catch (error) {
            res.status(500).json({ErrorDeleteTeamFund: error})
        }
    }
};

module.exports = teamFundControllers;