express = require "express"
router = express.Router()

router.get "/", (req,res)->
	res.render "index" , title : "Monami Impex"


module.exports = router
