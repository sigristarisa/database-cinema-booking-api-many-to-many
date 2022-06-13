const prisma = require("../utils/prisma");

const createTicket = async (req, res) => {
  const { screeningId, customerId, seatings } = req.body;
  const ticketsWithSeats = await prisma.ticket.create({
    data: {
      screeningId,
      customerId,
      seatings: {
        create: seatings.map((seating) => {
          return { seatNum: seating.seatNum };
        }),
      },
    },
  });
  res.json({ data: ticketsWithSeats });
};

module.exports = {
  createTicket,
};
