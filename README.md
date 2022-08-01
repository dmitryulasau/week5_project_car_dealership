# CAR DEALERSHIP

## Tables

- Salesperson
- Car
- Customer
- Invoice
- Service
- Service_ticket
- Mechanic
- Parts

## ERD Cardinality

- ----------|- &nbsp;&nbsp;One
- ----------<- &nbsp;Many
- ---------||- &nbsp;&nbsp;&nbsp;One (and only one)
- --------O|- &nbsp;&nbsp;Zero or one
- ---------|<- &nbsp;&nbsp;One or many
- ---------O<- &nbsp;Zero or many

## RELATIONS

### Buying a car

[Salesperson] -||------O<- [Car] &nbsp;/&nbsp;&nbsp;[1 : many] &nbsp; (A salesperson may sell 0 or MANY cars, but each car is sold by only 1 salesperson)

[Customer] -||------O<- [Car] &nbsp;/&nbsp;&nbsp;[1 : many] &nbsp; (A customer may buy 0 or MANY cars, but each car is purchased by only 1 customer.)

[Salesperson] -||------O<- [Invoice] &nbsp;/&nbsp;&nbsp;[1 : many] &nbsp; (A salesperson can write 0 or MANY invoices, but each invoice wrote by only 1 salesperson)

[Customer] -||------O<- [Invoice] &nbsp;/&nbsp;&nbsp;[1 : many] &nbsp; (A customer can have 0 or MANY invoices, but each invoice belongs to only 1 customer)

[Car] -||-----O-|- [Invoice] &nbsp;/&nbsp;&nbsp;[1 : 1] (A car can have 0 or 1 invoice, but invoice can have only 1 car (A salesperson writes a single invoice for each car he or she sells.)

We can establish connection between [Salesperson] and [Customer] trough [Invoice].

### Servicing a car

[Customer] -||------O<- [Service_ticket] &nbsp;/&nbsp;&nbsp;[1 : many] &nbsp; (A customer can have 0 or MANY service tickets, but each service ticket belongs to only 1 customer)

[Car] -||------O<- [Service_ticket] &nbsp;/&nbsp;&nbsp;[1 : many] &nbsp; (A car can have 0 or MANY service tickets, but each service ticket belongs to only 1 car)

A car that is serviced may or may not need parts:
We can establish connection between [Service_ticket] and [Part] trough [Service_part].

[Part] -||------|<- [Service_part] &nbsp;/&nbsp;&nbsp;[1 : many] &nbsp; (If we need parts for service 'service_part' can have 1 or MANY parts, but each part can be used in 1 'service_part' request)

[Service_ticket] -||------O<- [Service_part] &nbsp;/&nbsp;&nbsp;[1 : many] &nbsp; (Service ticket can have 0 or MANY 'Service part' requests, but 'service_part' can have ONLY 1 Service_ticket)

"A car brought in for service can be worked on by many mechanics, and each mechanic may work on many cars."
We can establish connection between [Mechanic] and [Service] trough [Labor].

Every 'Labor' should have 'Service_ticket', 'Service' and 'Mechanic':

[Labor] -||------|<- [Service_ticket] &nbsp;/&nbsp;&nbsp;[1 : many] &nbsp; (Labor can have 1 or MANY service tickets, but service ticket can have 1 labor)

[Labor] -||------O<- [Service] &nbsp;/&nbsp;&nbsp;[1 : many] &nbsp; (Labor can have 0 or MANY services, but service can have 1 labor)

[Labor] -||------|<- [Mechanic] &nbsp;/&nbsp;&nbsp;[1 : many] &nbsp; (A labor can have 1 or MANY mechanics, but mechanic can do 1 labor at time)

## Questions?

[Dmitry Ulasau](mailto:dmitrushok@gmail.com)
