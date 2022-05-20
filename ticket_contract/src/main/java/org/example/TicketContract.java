/*
 * SPDX-License-Identifier: Apache-2.0
 */
package org.example;

import java.util.ArrayList;
import java.util.List;
import org.hyperledger.fabric.contract.Context;
import org.hyperledger.fabric.contract.ContractInterface;
import org.hyperledger.fabric.contract.annotation.Contract;
import org.hyperledger.fabric.contract.annotation.Default;
import org.hyperledger.fabric.contract.annotation.Transaction;
import org.hyperledger.fabric.contract.annotation.Contact;
import org.hyperledger.fabric.contract.annotation.Info;
import org.hyperledger.fabric.contract.annotation.License;
import org.hyperledger.fabric.shim.ChaincodeException;
import org.hyperledger.fabric.shim.ChaincodeStub;
import org.hyperledger.fabric.shim.ledger.KeyValue;
import org.hyperledger.fabric.shim.ledger.QueryResultsIterator;
import com.owlike.genson.Genson;
//import static java.nio.charset.StandardCharsets.UTF_8;

@Contract(name = "TicketContract",
    info = @Info(title = "Ticket contract",
                description = "My Smart Contract",
                version = "0.0.1",
                license =
                        @License(name = "Apache-2.0",
                                url = ""),
                                contact =  @Contact(email = "ticket-contract@example.com",
                                                name = "ticket-contract",
                                                url = "http://ticket-contract.me")))
@Default
public class TicketContract implements ContractInterface {
    private final Genson genson = new Genson();

    private enum TicketErrors {
        Ticket_NOT_FOUND,
        Ticket_ALREADY_EXISTS
    }

    /**
     * Retrieves a car with the specified key from the ledger.
     *
     * @param ctx the transaction context
     * @param key the key
     * @return the Car found on the ledger if there was one
     */
    @Transaction()
    public String queryTicket(final Context ctx, final String key) {
        ChaincodeStub stub = ctx.getStub();
        String ticketState = stub.getStringState(key);

        if (ticketState.isEmpty()) {
            String errorMessage = String.format("Ticket %s does not exist", key);
            System.out.println(errorMessage);
            throw new ChaincodeException(errorMessage, TicketErrors.Ticket_NOT_FOUND.toString());
        }

        //Ticket ticket = genson.deserialize(ticketState, Ticket.class);

        //return ticket;
        return ticketState;
    }


    /**
     * Creates a new ticket on the ledger.
     *
     * @param ctx the transaction context
     * @param key the key for the new ticket
     * @param ID the ID for the new ticket
     * @param name the name of the new ticket
     * @param time the time of the new ticket
     * @param position the position of the new ticket
     * @param price the price for the new ticket
     * @param owner the owner of the new ticket
     * @return the created ticket
     */
    @Transaction()
    public Ticket createTicket(final Context ctx, final String key, final String ID, final String name,
            final String time, final String position,final String price,final String owner) {
        ChaincodeStub stub = ctx.getStub();

        String ticketState = stub.getStringState(key);
        if (!ticketState.isEmpty()) {
            String errorMessage = String.format("Ticket %s already exists", key);
            System.out.println(errorMessage);
            throw new ChaincodeException(errorMessage, TicketErrors.Ticket_ALREADY_EXISTS.toString());
        }

        Ticket ticket = new Ticket(ID, name, time,position,price, owner);
        ticketState = genson.serialize(ticket);
        stub.putStringState(key, ticketState);

        return ticket;
    }

   
    /**
     * Changes the owner of the ticket on the ledger.
     *
     * @param ctx the transaction context
     * @param key the key
     * @param newOwner the new owner
     * @return the updated Car
     */
    @Transaction()
    public Ticket changeTicketOwner(final Context ctx, final String key, final String newOwner,final String ID) {
        ChaincodeStub stub = ctx.getStub();

        String ticketState = stub.getStringState(key);

        if (ticketState.isEmpty()) {
            String errorMessage = String.format("Ticket %s does not exist", key);
            System.out.println(errorMessage);
            throw new ChaincodeException(errorMessage, TicketErrors.Ticket_NOT_FOUND.toString());
        }

        Ticket ticket = genson.deserialize(ticketState, Ticket.class);

        Ticket newTicket = new Ticket(ID,ticket.getName(),ticket.getTime(), ticket.getPosition(), ticket.getPrice(), newOwner);
        String newTicketState = genson.serialize(newTicket);
        stub.putStringState(key, newTicketState);

        return newTicket;
    }

    @Transaction()
    public boolean ticketExists(Context ctx, String ticketId) {
        byte[] buffer = ctx.getStub().getState(ticketId);
        return (buffer != null && buffer.length > 0);
    }

    
    @Transaction()
    public void deleteTicket(Context ctx, String ticketId) {
        boolean exists = ticketExists(ctx,ticketId);
        if (!exists) {
            throw new RuntimeException("The asset "+ticketId+" does not exist");
        }
        ctx.getStub().delState(ticketId);
    }

}
    /*public  TicketContract() {

    }
    @Transaction()
    public boolean ticketExists(Context ctx, String ticketId) {
        byte[] buffer = ctx.getStub().getState(ticketId);
        return (buffer != null && buffer.length > 0);
    }

    @Transaction()
    public void createTicket(Context ctx, String ticketId, String value) {
        boolean exists = ticketExists(ctx,ticketId);
        if (exists) {
            throw new RuntimeException("The asset "+ticketId+" already exists");
        }
        Ticket asset = new Ticket();
        asset.setValue(value);
        ctx.getStub().putState(ticketId, asset.toJSONString().getBytes(UTF_8));
    }

    @Transaction()
    public Ticket readTicket(Context ctx, String ticketId) {
        boolean exists = ticketExists(ctx,ticketId);
        if (!exists) {
            throw new RuntimeException("The asset "+ticketId+" does not exist");
        }

        Ticket newAsset = Ticket.fromJSONString(new String(ctx.getStub().getState(ticketId),UTF_8));
        return newAsset;
    }

    @Transaction()
    public void updateTicket(Context ctx, String ticketId, String newValue) {
        boolean exists = ticketExists(ctx,ticketId);
        if (!exists) {
            throw new RuntimeException("The asset "+ticketId+" does not exist");
        }
        Ticket asset = new Ticket();
        asset.setValue(newValue);

        ctx.getStub().putState(ticketId, asset.toJSONString().getBytes(UTF_8));
    }

    @Transaction()
    public void deleteTicket(Context ctx, String ticketId) {
        boolean exists = ticketExists(ctx,ticketId);
        if (!exists) {
            throw new RuntimeException("The asset "+ticketId+" does not exist");
        }
        ctx.getStub().delState(ticketId);
    }

}*/
