# CMPSC 200: Circuit Scramble

| Date              |          |
|:------------------|:---------|
| 5 October 2023 | Assigned  |
| 13 October 2023| Due, end of lab       |
| Status           | [![GatorGrader](../../actions/workflows/main.yml/badge.svg)](../../actions/workflows/main.yml) |


## Learning objectives

* develop truth tables as tests of digital circuitry
* evaluate basic boolean logic as expressions of digital circuits
* implement boolean logic in ARMv6 assembly to describe digital circuits
* read and/or revise circuit diagrams to reflect changes in functionality

## Introduction

### This isn't a democracy

#### Equality circuit

Complete this work in [equality/program.S](equality/program.S).

We've retrieved some rocks with a special principle: if any two rocks from the sample sit next
to each other long enough, they have a 50% chance of leeching their core element to their neighbors. This only happens in pairs, and we've isolated a sample of eight (8) rocks (4 pairs) to examine if any pair of two (2) contains _falsite_ (`0`) or _truthite_ (`1`). 

This circuit should report a `1` whenever the pairs match.

### Lab: Majority circuit

Complete this work in the following files:

* Circuit diagram: [majority/majority.cddx](majority/majority.cddx)
  * You should upload this file to [https://www.circuit-diagram.org/](https://www.circuit-diagram.org/) to complete; overwrite when done
  * Also, you should export a `PNG` as majority.png; save to `majority` folder
* Code: [majority/program.S](majority/program.S)

The Mining Council, as you might expect, is run by robots. (They're really nice, tho.) However,
they make all of their decisions via a process which captures the majority of votes either _against_ (`0`) or _for_ (`1`) a proposition. They've largely been doing this via punch cards.
But, in space, (as the saying commonly goes) there's no one to repair even punch card machines.

Our robot overlords _need a circuit_ to do this quickly and efficiently. Hence, they turn to
the only folks who are known for neither of these traits: humans. But, we certainly have
_ingenuity_ on our sides. Can you design such a circuit?

Here're some specifications:

* there are `3` robots on the council
* they can vote either `0` or `1`
* the circuit needs to cover all combinations

You'll need to provide a full truth table in our [report](docks/report.md).

### Assignment "Hacks"

See the `Suggestion` below to challenge yourself to implement a Hack. As always, you are allowed to develop
your own Hack to satisfy this stretch goal. Place the code for the Hack inline with the code in the corresponding
file.

In order to recieve credit for the Hack, you must fill out the [hack.md](docs/hack.md) file located in the
`docs` folder.

> Note: for both hacks, you'll definitely need to add gates to the circuit designs.

#### `equality`

We're currently testing numbers in _pairs_. What happens if you try to evaluate numbers in triple? Replace the `signals` declaration in 
`.data` with the following:

```assembly
signals:    .byte   0, 0, 1
            .byte   0, 1, 1
            .byte   1, 1, 1
            .byte   0, 0, 0
            .byte   1, 1, 0
            .byte   0, 1, 0
            .byte   1, 0, 1
            .byte   1, 0, 0
```

In addition, provide a `truth table` for the outcomes in [hack.md](docks/hack.md). This will help you guarantee that your outcomes are correct.

#### `majority`

##### `unanimity`

The people have spoken. They're not happy with only `3` robot overlords. They want _more of them_: `5` to be exact.

_But_ there's a catch: "majority" this context does not mean `50% + 1` (i.e. `3`). It means _unanimity_. That's right: there's no majority like a unanimous one, especially with automated decisions made by robots. Here's some data to use as a test. Replace `votes` with:

```assembly
votes:  .bytes  0,0,0,0,0
        .bytes  0,0,0,0,1
        .bytes  0,0,0,1,0
        .bytes  0,0,0,1,1
        .bytes  0,0,1,0,0
        .bytes  0,0,1,0,1
        .bytes  0,0,1,1,0
        .bytes  0,0,1,1,1
        .bytes  0,1,0,0,0
        .bytes  0,1,0,0,1
        .bytes  0,1,0,1,0
        .bytes  0,1,0,1,1
        .bytes  0,1,1,0,0
        .bytes  0,1,1,0,1
        .bytes  0,1,1,1,0
        .bytes  0,1,1,1,1
        .bytes  1,0,0,0,0
        .bytes  1,0,0,0,1
        .bytes  1,0,0,1,0
        .bytes  1,0,0,1,1
        .bytes  1,0,1,0,0
        .bytes  1,0,1,0,1
        .bytes  1,0,1,1,0
        .bytes  1,0,1,1,1
        .bytes  1,1,0,0,0
        .bytes  1,1,0,0,1
        .bytes  1,1,0,1,0
        .bytes  1,1,0,1,1
        .bytes  1,1,1,0,0
        .bytes  1,1,1,0,1
        .bytes  1,1,1,1,0
        .bytes  1,1,1,1,1
```

In addition, provide a `truth table` for the outcomes in [hack.md](docks/hack.md). This will help you guarantee that your outcomes are correct.

##### `dissent`

_But_ there's another catch: robots _love_ shame. In fact, they don't like dissenters at all. In the event where there is a an 80% majority (i.e. `4` votes one way), the circuit should report a `1` when there's _only one dissenter_. Use the same alteration to `votes` as above and write your truth table in [hack.md](docks/hack.md).

##### `stack attack`

Given the high number of inputs, there's some juggling involved. If you can implement use of the `stack pointer` (i.e. `PUSH`, `POP` instructions), that'd be a welcome improvement to this circuit -- especially if you attempt the `dissent` or `unanimity` hacks. In fact, I think it's almost _required_ if you do so.

Implement use of the stack to `PUSH` and `POP` values so that we don't need to interface with raw, uncooked memory.

If you attempt only this implemention with the `3`-value `majority` circuit, you do not need to provide _another_ truth table (that's already done in [report.md](docks/report.md)). However, there's an additional question in hack documentation labeled for you.

### Changes to files in `.vscode`

Based on your system setup (refer to your `hello-blinky` assignment), you will need switch out the `.vscode` folder in each exercise with the _last working copy_.

See our [wiki's entry  on "Configuring Assignments"](https://github.com/allegheny-college-cmpsc-200-fall-2023/course-materials/wiki/03-Configuring-Assignments)
for more inforamtion.
