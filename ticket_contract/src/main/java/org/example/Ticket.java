/*
 * SPDX-License-Identifier: Apache-2.0
 */

package org.example;//记得这个package要改！！！！！！！！！！！！！！！！！！！！！！！
import java.util.Objects;

import org.hyperledger.fabric.contract.annotation.DataType;
import org.hyperledger.fabric.contract.annotation.Property;

import com.owlike.genson.annotation.JsonProperty;

@DataType()
public final class Ticket {
    @Property()
    private final String ID;

    @Property()
    private final String name;

    @Property()
    private final String time;
    @Property()
    private final String position;
    @Property()
    private final String price;

    @Property()
    private final String owner;

    public String getID() {
        return ID;
    }

    public String getName() {
        return name;
    }

    public String getTime() {
        return time;
    }
    public String getPosition() {
        return position;
    }
    public String getPrice() {
        return price;
    }
    public String getOwner() {
        return owner;
    }

    public Ticket(@JsonProperty("ID") final String ID, @JsonProperty("name") final String name,
            @JsonProperty("time") final String time, @JsonProperty("position") final String position,
            @JsonProperty("price") final String price,@JsonProperty("owner") final String owner) {
        this.ID = ID;
        this.name = name;
        this.time = time;
        this.position = position;
        this.price = price;
        this.owner = owner;
    }

    @Override
    public boolean equals(final Object obj) {
        if (this == obj) {
            return true;
        }

        if ((obj == null) || (getClass() != obj.getClass())) {
            return false;
        }

        Ticket other = (Ticket) obj;

        return Objects.deepEquals(new String[] {getID(), getName(), getTime(), getPosition(),getPrice(),getOwner()},
                new String[] {other.getID(), other.getName(), other.getTime(), other.getPosition(),other.getPrice(),other.getOwner()});
    }

    @Override
    public int hashCode() {
        return Objects.hash(getID(), getName(), getTime(), getPosition(),getPrice(),getOwner());
    }

    @Override
    public String toString() {
        return this.getClass().getSimpleName() + "@" + Integer.toHexString(hashCode()) + " [ID:" + ID + ", name:"
                + name + ", time:" + time + ", position:" + position+", price:"+price+ ", owner:"+owner + "]";
    }

    //private final static Genson genson = new Genson();

    /*@Property()
    private final String ;

    /*public Ticket(){
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String toJSONString() {
        return genson.serialize(this).toString();
    }

    public static Ticket fromJSONString(String json) {
        Ticket asset = genson.deserialize(json, Ticket.class);
        return asset;
    }*/
}
