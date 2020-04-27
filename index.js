const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()

async function main() {
  const r1 = await prisma.person.deleteMany({
    where: {
      id: 1,
    },
  })
  console.log({ r1 })

  const r2 = await prisma.person.delete({
    where: {
      id: 1,
    },
  })
  console.log({ r2 })
}

main()
  .then((_) => prisma.disconnect())
  .catch((_) => prisma.disconnect())
