Content-Type: multipart/mixed; boundary="===============4775268618902013521=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: kbuild-all@lists.01.org
Subject: Re: arch/arm64/kernel/topology.c:367:22: sparse: sparse: dereference of noderef expression
Date: Wed, 06 Jan 2021 20:46:59 +0000
Message-ID: <20210106204659.GE3579531@ZenIV.linux.org.uk>
In-Reply-To: <20210106201226.GA25625@arm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4775268618902013521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2021 at 08:12:27PM +0000, Ionela Voinescu wrote:

> Initially I though it always only makes sense to have a __iomem pointer.
> That is, it only makes sense to have a pointer with a cookie attached
> specifying that it addresses a device memory space that should only be
> accessed using special functions.
> =

> But then you've got something like this in drivers/input/serio/apbps2.c:
> struct apbps2_regs {
> 	u32 __iomem data;	/* 0x00 */
> 	u32 __iomem status;	/* 0x04 */
> 	u32 __iomem ctrl;	/* 0x08 */
> 	u32 __iomem reload;	/* 0x0c */
> };
> struct apbps2_priv {
> 	struct serio		*io;
> 	struct apbps2_regs	*regs;
> };
> [..] (followed by)
> ioread32be(&priv->regs->status)
> =

> which I think is correct despite contradicting my assumption, but it's
> the only example I've found in the kernel.

Frankly, I would rather turn that into
	struct apbps2_regs	__iomem *regs;
and striped the individual field qualifiers...
--===============4775268618902013521==--

