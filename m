Content-Type: multipart/mixed; boundary="===============1785960580858610566=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] HID: ft260: fix format type warning in ft260_word_show()
Date: Mon, 10 May 2021 13:22:46 +0300
Message-ID: <20210510102246.GR1922@kadam>
In-Reply-To: <20210510101551.GQ1922@kadam>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1785960580858610566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 01:15:51PM +0300, Dan Carpenter wrote:
> On Mon, May 10, 2021 at 02:52:14AM -0700, Joe Perches wrote:
> > On Mon, 2021-05-10 at 12:17 +0300, Michael Zaidman wrote:
> > > On Sun, May 09, 2021 at 01:39:29PM -0700, Joe Perches wrote:
> > > > On Sun, 2021-05-09 at 22:32 +0300, Michael Zaidman wrote:
> > > > > Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge =
driver")
> > > > > =

> > > > > Fix warning reported by static analysis when built with W=3D1 for=
 arm64 by
> > > > > clang version 13.0.0
> > > > > =

> > > > > > > drivers/hid/hid-ft260.c:794:44: warning: format specifies typ=
e 'short' but
> > > > > =C2=A0=C2=A0=C2=A0the argument has type 'int' [-Wformat]
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0~~~     ^~~~~~~~~~=
~~~~~~~~~
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0%i
> > > > > =C2=A0=C2=A0=C2=A0include/linux/byteorder/generic.h:91:21: note: =
expanded from
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0macro 'le16_to_cpu'
> > > > > =C2=A0=C2=A0=C2=A0#define le16_to_cpu __le16_to_cpu
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^
> > > > > =C2=A0=C2=A0=C2=A0include/uapi/linux/byteorder/big_endian.h:36:26=
: note: expanded from
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0macro '__le16_to_cpu'
> > > > > =C2=A0=C2=A0=C2=A0#define __le16_to_cpu(x) __swab16((__force __u1=
6)(__le16)(x))
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > =C2=A0=C2=A0=C2=A0include/uapi/linux/swab.h:105:2: note: expanded=
 from macro '__swab16'
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0(__builtin_constant_p((__u16)(x)) ?     \
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > =

> > > > > Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
> > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > ---
> > > > > =C2=A0drivers/hid/hid-ft260.c | 2 +-
> > > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > > > =

> > > > > diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> > > > > index 047aa85a7c83..38794a29599c 100644
> > > > > --- a/drivers/hid/hid-ft260.c
> > > > > +++ b/drivers/hid/hid-ft260.c
> > > > > @@ -791,7 +791,7 @@ static int ft260_word_show(struct hid_device =
*hdev, int id, u8 *cfg, int len,
> > > > > =C2=A0	if (ret !=3D len && ret >=3D 0)
> > > > > =C2=A0		return -EIO;
> > > > > =C2=A0
> > > > > =

> > > > > -	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
> > > > > +	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
> > > > > =C2=A0}
> > > > =

> > > > There are 2 of these so I wonder about the static analysis.
> > > =

> > > There is nothing wrong with the static analysis. The first scnprintf =
format
> > > type is perfectly valid as far as its size is greater than the size o=
f the
> > > data pointed by the *field pointer, which is a one byte size in our c=
ase.
> > > The static analysis warned about the second scnprintf case, where the=
 format
> > > type was shorter than the integer returned by the __builtin_constant_=
p.
> > > This warning can be considered as a false positive since the le16_to_=
cpu is
> > > all about the 16 bits numbers, but to silence it, I submitted the abo=
ve fix.
> > =

> > $ git grep __arch_swab16 arch/arm*/
> > arch/arm/include/asm/swab.h:#define __arch_swab16(x) ((__u16)__arch_swa=
hb32(x))
> > =

> > otherwise:
> > =

> > static inline __attribute_const__ __u16 __fswab16(__u16 val)
> > {
> > #if defined (__arch_swab16)
> > 	return __arch_swab16(val);
> > #else
> > 	return ___constant_swab16(val);
> > #endif
> > }
> > =

> > #define ___constant_swab16(x) ((__u16)(				\
> > 	(((__u16)(x) & (__u16)0x00ffU) << 8) |			\
> > 	(((__u16)(x) & (__u16)0xff00U) >> 8)))
> > =

> > /**
> >  * __swab16 - return a byteswapped 16-bit value
> >  * @x: value to byteswap
> >  */
> > #ifdef __HAVE_BUILTIN_BSWAP16__
> > #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
> > #else
> > #define __swab16(x)				\
> > 	(__builtin_constant_p((__u16)(x)) ?	\
> > 	___constant_swab16(x) :			\
> > 	__fswab16(x))
> > #endif
> > =

> > Under what condition does the ?: return an int sized value
> > rather than a u16 sized value?  I fail to see a path where
> > the compiler should promote the returned value to int _before_
> > the promotion done for the varargs use.
> > =

> > If it's for the varargs use, then both instances are promoted.
> > =

> =

> Ternary type promotion is a horrible thing.
> =

> 	foo =3D a ? b : c;
> =

> Everything is type promoted which ever of a, b or c has the most
> positive bits.  Or if none of them have 31 positive bits it's
> type promoted to int.

Oops.  Sorry, I'm not thinking straight.  "a" doesn't affect the type
promotion, but it would if you had:

	foo =3D a ?: c;

regards,
dan carpenter

--===============1785960580858610566==--

