express = require "express"
router = express.Router()

router.get "/", (req,res)->
	res.render "index" , title : "Monami Impex"
router.get "/companyprofile" , (req , res) ->
	res.render "companyprofile" , title : "Company Profile - Monami Impex"
router.get "/contactus" , (req,res)->
	res.render "contactus", title : "Contact us - Monami Impex"

module.exports = router