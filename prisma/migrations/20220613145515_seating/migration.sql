-- CreateTable
CREATE TABLE "Seating" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "seatNum" TEXT NOT NULL,

    CONSTRAINT "Seating_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_SeatingToTicket" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Seating_seatNum_key" ON "Seating"("seatNum");

-- CreateIndex
CREATE UNIQUE INDEX "_SeatingToTicket_AB_unique" ON "_SeatingToTicket"("A", "B");

-- CreateIndex
CREATE INDEX "_SeatingToTicket_B_index" ON "_SeatingToTicket"("B");

-- AddForeignKey
ALTER TABLE "_SeatingToTicket" ADD CONSTRAINT "_SeatingToTicket_A_fkey" FOREIGN KEY ("A") REFERENCES "Seating"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SeatingToTicket" ADD CONSTRAINT "_SeatingToTicket_B_fkey" FOREIGN KEY ("B") REFERENCES "Ticket"("id") ON DELETE CASCADE ON UPDATE CASCADE;
