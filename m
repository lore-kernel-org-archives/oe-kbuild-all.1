Content-Type: multipart/mixed; boundary="===============4211850153063202091=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: kbuild-all@lists.01.org
Subject: Re: arch/arm64/kernel/topology.c:367:22: sparse: sparse: dereference of noderef expression
Date: Wed, 06 Jan 2021 16:13:53 +0000
Message-ID: <20210106161353.GC3579531@ZenIV.linux.org.uk>
In-Reply-To: <20210106155214.GA30892@arm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4211850153063202091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2021 at 03:52:14PM +0000, Ionela Voinescu wrote:
> > > > > vim +367 arch/arm64/kernel/topology.c
> > > > > =

> > > > >    362	=

> > > > >    363	int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
> > > > >    364	{
> > > > >    365		int ret =3D -EOPNOTSUPP;
> > > > >    366	=

> > > > >  > 367		switch ((u64)reg->address) {
> > > > =

> > > > That's not a dereference but I guess sparse complains of dropping t=
he
> > > > __iomem. We could change the cast to (__force u64) to silence spars=
e.
> > > > =

> > > > Thanks for the report.
> > > > =

> > > =

> > > Nothing I've tried seemed to silence sparse here, including casting to
> > > (__force u64).
> > =

> > Would it work if we changed the case lines to (u64 __iomem)0x0?
> > =

> =

> No, it does not. We still get the same warning on the switch line even
> if there is no cast. Same if we directly check for:
> =

> if (reg->address =3D=3D (u64 __iomem)0x0)

Folks, could you stop with the voodoo?  This u64 __iomem address thing is c=
ompletely
wrong.  What it says is "address of that field shall be an iomem pointer",
which makes no sense whatsoever.

Just what had been intended?  __iomem is a qualifier of the same sort
as const or volatile - this mess makes as much sense as
struct cpc_reg {
        u8 descriptor;
        u16 length;
        u8 space_id;   =

        u8 bit_width;   =

        u8 bit_offset;
        u8 access_width;
        u64 const address;
} __packed;

Which would *NOT* be read as "reg->address is a numeric representation of
address of something unmodifiable" - it would be "the value stored in
reg->address can not be modified".

This annotation says "reg->address (somehow) lives in iomem", resulting in
"so why the hell are you trying to read it by plain dereferencing of
reg + field offset?" from sparse.

Get rid of this misannotation and don't breed force-cast to confuse
everything hard enough to STFU.
--===============4211850153063202091==--

