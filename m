Content-Type: multipart/mixed; boundary="===============4343187660787450546=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: drivers/scsi/ncr53c8xx.c:5306:9: sparse: sparse: cast truncates bits from constant value (58f becomes 8f)
Date: Mon, 18 May 2020 08:34:17 +0800
Message-ID: <20200518003417.GA4344@intel.com>
In-Reply-To: <20200515190026.GI16070@bombadil.infradead.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4343187660787450546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 12:00:26PM -0700, Matthew Wilcox wrote:
> On Sat, May 16, 2020 at 02:20:38AM +0800, kbuild test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   051e6b7e34b9bd24f46725f74994a4d3a653966e
> > commit: 06e85c7e9a1c1356038936566fc23f7c0d363b96 asm-generic: fix unist=
d_32.h generation format
> > date:   5 weeks ago
> =

> I don't see how that commit in any way reflects this error message.
> =

> > reproduce:
> >         # apt-get install sparse
> >         # sparse version: v0.6.1-193-gb8fad4bc-dirty
> >         git checkout 06e85c7e9a1c1356038936566fc23f7c0d363b96
> >         make ARCH=3Dx86_64 allmodconfig
> =

> I can't even see a way to build the ncr53c8xx module with this config.
> Unless somebody reenabled EISA on x86, the only way I can see to
> still build this driver is on PA-RISC with the ZALON code.
sorry, the reproduce steps here is wrong, it is not for x86_64. We will
fix this.

> =

> >         make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> > =

> > =

> > sparse warnings: (new ones prefixed by >>)
> > =

> > >> drivers/scsi/ncr53c8xx.c:5306:9: sparse: sparse: cast truncates bits=
 from constant value (58f becomes 8f)
> > =

> > ^1da177e4c3f41 Linus Torvalds 2005-04-16 @5306  	OUTW (nc_sien , STO|HT=
H|MA|SGE|UDC|RST|PAR);
> =

> This seems entirely intentional.
> =

> Something like this should do the job (whitespace damaged):
> =

> +++ b/drivers/scsi/ncr53c8xx.h
> @@ -407,7 +407,7 @@
>  =

>  #ifdef CONFIG_SCSI_NCR53C8XX_NO_WORD_TRANSFERS
>  /* Only 8 or 32 bit transfers allowed */
> -#define OUTW_OFF(o, val)       do { writeb((char)((val) >> 8), (char __i=
omem *)np->reg + ncr_offw(o)); writeb((char)(val), (char __iomem *)np->reg =
+ ncr_offw(o) + 1); } while (0)
> +#define OUTW_OFF(o, val)       do { writeb((char)((val) >> 8), (char __i=
omem *)np->reg + ncr_offw(o)); writeb((char)((val) & 0xff), (char __iomem *=
)np->reg + ncr_offw(o) + 1); } while (0)
>  #else
>  #define OUTW_OFF(o, val)       writew_raw((val), (char __iomem *)np->reg=
 + ncr_offw(o))
>  #endif
> =

> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org
--===============4343187660787450546==--

