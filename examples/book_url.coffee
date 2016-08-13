Client = require('../src/client').Client
client = new Client()

for type in ['html', 'txt', 'card']
 console.log client.book_url 300, type
