# Allah enlarge my knowledge as I can enlight your creation

express = require "express"
path = require "path"
favicon = require "serve-favicon"
logger = require "morgan"
cookieParser = require "cookie-parser"
bodyParser = require "body-parser"

routes = require "./routes/index"

app = express() 




app.set "views", path.join(__dirname, "views")
app.set "view engine" , "jade"

app.use logger('dev')
app.use bodyParser.json()
app.use bodyParser.urlencoded( 
	extended : false
)

app.use cookieParser()
app.use express.static( path.join( __dirname, "public"))


app.use require("compression")()

app.use require("connect-assets")
	helperContext: app.locals
	build: true

app.use "/" , routes
# routes(app)

# catch 404 and forward to error handler

app.use (req, res, next)->
	err = new Error "Not Found"
	err.status = 404
	next err


# error handlers

if app.get("env") == 'development'
	app.use (err, req, res , next)->
		res.status err.status || 500
		res.render "error",
			message: err.message
			error : err



app.set 'port' , process.env.PORT || 8000

debug = require('debug')('sample')


server = app.listen app.get('port') , ()->


module.exports = app