import serverlessExpress from '@vendia/serverless-express'
import app from './index.js'

const binaryMimeTypes = [
	'application/javascript',
	'application/json',
	'application/octet-stream',
	'application/xml',
	'font/eot',
	'font/opentype',
	'font/otf',
	'image/jpeg',
	'image/png',
	'image/svg+xml',
	'text/comma-separated-values',
	'text/css',
	'text/html',
	'text/javascript',
	'text/plain',
	'text/text',
	'text/xml'
]

const server = serverlessExpress.createServer(app, null, binaryMimeTypes);

export const handler = (event, context) => {
	console.log('Initialized handler')
	return serverlessExpress.proxy(server, event, context)
}