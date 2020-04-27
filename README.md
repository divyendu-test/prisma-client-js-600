# To Reproduce

1. Run `yarn` to install dependencies
1. `yarn prisma migrate up --experimental` (and import data.sql)
1. `node index.js`

The index.js file has both `deleteMany` and `delete`. Both fail silently. With `DEBUG=*`, I can see the following error:

```
  engine stdout {
  timestamp: 'Apr 27 15:39:21.971',
  level: 'INFO',
  target: 'query_engine::server',
  fields: { message: 'Started http server on 127.0.0.1:56561' }
} +6ms
  engine {
  engine   error: PrismaClientKnownRequestError: The change you are trying to make would violate the required relation 'PersonToStudent' between the `Person` and `Student` models.
  engine       at NodeEngine.graphQLToJSError (/Users/divyendusingh/Documents/prisma/p2-cascade/node_modules/@prisma/client/runtime/index.js:1:77409)
  engine       at /Users/divyendusingh/Documents/prisma/p2-cascade/node_modules/@prisma/client/runtime/index.js:1:75032
  engine       at processTicksAndRejections (internal/process/task_queues.js:97:5)
  engine       at async PrismaClientFetcher.request (/Users/divyendusingh/Documents/prisma/p2-cascade/node_modules/@prisma/client/runtime/index.js:1:85097)
  engine       at async main (/Users/divyendusingh/Documents/prisma/p2-cascade/index.js:6:14) {
  engine     code: 'P2014',
  engine     meta: {
  engine       relation_name: 'PersonToStudent',
  engine       model_a_name: 'Person',
  engine       model_b_name: 'Student'
  engine     }
  engine   }
  engine } +32ms
  printStack callsite Error
    at Object.s [as Person] (/Users/divyendusingh/Documents/prisma/p2-cascade/node_modules/@prisma/client/runtime/index.js:1:82264)
    at Object.n.<computed> [as deleteMany] (/Users/divyendusingh/Documents/prisma/p2-cascade/node_modules/@prisma/client/runtime/index.js:1:83753)
    at main (/Users/divyendusingh/Documents/prisma/p2-cascade/index.js:6:34)
    at Object.<anonymous> (/Users/divyendusingh/Documents/prisma/p2-cascade/index.js:21:1)
    at Module._compile (internal/modules/cjs/loader.js:1156:30)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:1176:10)
    at Module.load (internal/modules/cjs/loader.js:1000:32)
    at Function.Module._load (internal/modules/cjs/loader.js:899:14)
    at Function.executeUserEntryPoint [as runMain] (internal/modules/run_main.js:74:12)
    at internal/main/run_main_module.js:18:47 +0ms
  engine Stopping Prisma engine +6ms
  getos { platform: 'darwin', libssl: undefined } +64ms
```
