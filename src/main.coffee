PORT = process.env.PORT ? 8000

express = require('express')
app = express()

browserify = require('browserify-middleware')
browserify.settings('transform', [require('cjsxify')])
browserify.settings('extensions', ['.coffee', '.cjsx'])
browserify.settings('grep', /\.coffee$|\.js$|\.cjsx$/)

app.use('/js', browserify(__dirname + '/../client/'))

app.engine('hamlc', require('haml-coffee').__express)
app.set('views', './views')
app.use(express.static(__dirname + '/../static/'))
app.use(require('connect-assets')())

app.get '/', (req, res) ->
  res.render('index.hamlc')

app.listen(PORT)

