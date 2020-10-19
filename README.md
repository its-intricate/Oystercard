# OysterCard Challenge


## First user story

```
In order to use public transport
As a customer
I want money on my card
```

|Object |  x  | Message |
|:----:|:----:|:----:|
|Card   | x   | has_money|
|Money  | x   | exists |



```
In order to keep using public transport
As a customer
I want to add money to my card
```

|Object |  x  | Message |
|:----:|:----:|:----:|
|Card   | x   | top up|

- new card -> balance 0
- card top up - > balance ++

```
In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card
```
|Object |  x  | Message |
|:----:|:----:|:----:|
|Card   | x   | maximum_balance|

- MAX_BALANCE = 90
- card -> balance 90
- card top up - > fail

```
In order to pay for my journey
As a customer
I need my fare deducted from my card
```
|Object |  x  | Message |
|:----:|:----:|:----:|
|Card   | x   | deduct |

- card -> balance
- card deduct - > balance --
