Content-Type: multipart/mixed; boundary="===============2955928561803421644=="
MIME-Version: 1.0
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: kbuild-all@lists.01.org
Subject: Re: arch/arm64/kernel/topology.c:367:22: sparse: sparse: dereference of noderef expression
Date: Wed, 06 Jan 2021 20:12:27 +0000
Message-ID: <20210106201226.GA25625@arm.com>
In-Reply-To: <20210106174758.GD3579531@ZenIV.linux.org.uk>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2955928561803421644==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wednesday 06 Jan 2021 at 17:47:58 (+0000), Al Viro wrote:
> On Wed, Jan 06, 2021 at 03:07:24PM +0000, Ionela Voinescu wrote:
> =

> > > >  > 367		switch ((u64)reg->address) {
> > > =

> > > That's not a dereference but I guess sparse complains of dropping the
> > > __iomem. We could change the cast to (__force u64) to silence sparse.
> =

> Oh, yes, it is - that of &reg->address, to fetch the value you are
> casting to u64.  And nonsense in declaration of struct cpc_reg says
> that its 'address' field somehow manages to be located in iomem,
> regardless of where the entire structure is stored.
> =

> Qualifiers apply to lvalues - it's "how can that object be accessed".
> They don't say anything with the values _stored_ in that object.
> It is possible to have them applied to individual fields of a structure;
> for some qualifiers that might be legitimate - e.g. you could do
> struct foo {
> 	char *s;
> 	volatile int x;
> } *p;
> telling the compiler that p->x is to be treated as volatile (make no
> assumptions about the value not being changed behind your back, etc.),
> while p->s is not.
> =

> However, for __iomem (or __user, etc.) that makes no sense whatsoever;
> you are saying "this field lives in iomem, no matter where the entire
> structure is located".
> =

> To quote C99 6.3.2.1[2]:
> 	Except when it is the operand of the sizeof operator, the unary & operat=
or, the ++
> operator, the -- operator, or the left operand of the . operator or an as=
signment operator,
> an lvalue that does not have array type is converted to the value stored =
in the designated
> object (and is no longer an lvalue). If the lvalue has qualified type, th=
e value has the
> unqualified version of the type of the lvalue; otherwise, the value has t=
he type of the
> lvalue. If the lvalue has an incomplete type and does not have array type=
, the behavior is
> undefined.
> =

> 	IOW, in the example above, as lvalue p->x will have "volatile int"
> for type; using it as argument of cast operator will convert it (_before_
> doing the cast) to whatever integer that had been found stored
> in that field and the type of that will be "int", not "volatile int".
> As soon as you fetch the value stored in object, qualifiers are gone.
> =

> 	The syntax is somewhat unfortunate - it's easy to confuse
> qualified pointer to type with pointer to qualified type.
> 	const int *r
> means "r is an unqualified pointer to const int"; the value stored in r m=
ay
> be modified, but the value stored in *r may not.
> 	int * const r
> means "r is a const pointer to int"; the value stored in r may not be mod=
ified,
> but the value stored in *r may.
> =

> 	You often run into something like
> struct foo {
> 	...
> 	u64 __iomem *some_reg;
> 	...
> } *p;
> and, unlike the mess in struct cpc_reg declaration, here p->some_reg is *=
NOT*
> __iomem-qualified.  It's a perfectly normal field of a structure somewhere
> in kernel memory, it can be fetched from, stored into, etc.  The contents
> of that field is a pointer to __iomem u64.  It can be passed to e.g.
> readq(), but trying to directly fetch *(p->some_reg) will barf.
> 	In such cases the limitations apply not to how we can access the
> field itself, but to what we can do with the value we find in that
> field.
> =

> 	At a guess, the intent of that (mis)annotation had been
> "this field contains a 64bit unsigned integer that happens to contain
> an address of something in iomem".  But qualifiers are useless for
> that - once you've fetched that value, all you have is plain u64.
> Nor would they be carried through the arithmetics, etc.
>

This could have been the intention, as that value is used as an offset
in the PCC virtual space (although it does not make complete sense even
in this case). Otherwise it's used as a pysical address offset for
system memory, and given as pysical address argument to ioremap :).

In any case, thank you for the detailed explanation. After your first
email I was thinking that it does not make sense to have the __iomem
annotation for address in cpc_reg, especially given its uses in
cppc_acpi.c and for the code that implements the ffh functions, but I
think only after this email it really  sunk in how wrong that
annotation really was.

Initially I though it always only makes sense to have a __iomem pointer.
That is, it only makes sense to have a pointer with a cookie attached
specifying that it addresses a device memory space that should only be
accessed using special functions.

But then you've got something like this in drivers/input/serio/apbps2.c:
struct apbps2_regs {
	u32 __iomem data;	/* 0x00 */
	u32 __iomem status;	/* 0x04 */
	u32 __iomem ctrl;	/* 0x08 */
	u32 __iomem reload;	/* 0x0c */
};
struct apbps2_priv {
	struct serio		*io;
	struct apbps2_regs	*regs;
};
[..] (followed by)
ioread32be(&priv->regs->status)

which I think is correct despite contradicting my assumption, but it's
the only example I've found in the kernel.

Many thanks,
Ionela.

> 	It might be possible to cook something more useful by a bit
> of creative misuse of __bitwise, but I hadn't looked through the
> places where that field is used.
--===============2955928561803421644==--

