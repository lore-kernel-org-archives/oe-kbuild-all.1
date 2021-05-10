Content-Type: multipart/mixed; boundary="===============8458037021396491419=="
MIME-Version: 1.0
From: Michael Zaidman <michael.zaidman@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] HID: ft260: fix format type warning in ft260_word_show()
Date: Mon, 10 May 2021 15:51:58 +0300
Message-ID: <20210510125158.GB2276@michael-VirtualBox>
In-Reply-To: <7c0f57c1208b09742c839b1c1e54e2b79c83b8af.camel@perches.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8458037021396491419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 02:52:14AM -0700, Joe Perches wrote:
> On Mon, 2021-05-10 at 12:17 +0300, Michael Zaidman wrote:
> > On Sun, May 09, 2021 at 01:39:29PM -0700, Joe Perches wrote:
> > > On Sun, 2021-05-09 at 22:32 +0300, Michael Zaidman wrote:
> > > > Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge dr=
iver")
> > > > =

> > > > Fix warning reported by static analysis when built with W=3D1 for a=
rm64 by
> > > > clang version 13.0.0
> > > > =

> > > > > > drivers/hid/hid-ft260.c:794:44: warning: format specifies type =
'short' but
> > > > =C2=A0=C2=A0=C2=A0the argument has type 'int' [-Wformat]
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r=
eturn scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0~~~     ^~~~~~~~~~~~~=
~~~~~~
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0%i
> > > > =C2=A0=C2=A0=C2=A0include/linux/byteorder/generic.h:91:21: note: ex=
panded from
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0macro 'le16_to_cpu'
> > > > =C2=A0=C2=A0=C2=A0#define le16_to_cpu __le16_to_cpu
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^
> > > > =C2=A0=C2=A0=C2=A0include/uapi/linux/byteorder/big_endian.h:36:26: =
note: expanded from
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0macro '__le16_to_cpu'
> > > > =C2=A0=C2=A0=C2=A0#define __le16_to_cpu(x) __swab16((__force __u16)=
(__le16)(x))
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > =C2=A0=C2=A0=C2=A0include/uapi/linux/swab.h:105:2: note: expanded f=
rom macro '__swab16'
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(=
__builtin_constant_p((__u16)(x)) ?     \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > =

> > > > Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > ---
> > > > =C2=A0drivers/hid/hid-ft260.c | 2 +-
> > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > > =

> > > > diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> > > > index 047aa85a7c83..38794a29599c 100644
> > > > --- a/drivers/hid/hid-ft260.c
> > > > +++ b/drivers/hid/hid-ft260.c
> > > > @@ -791,7 +791,7 @@ static int ft260_word_show(struct hid_device *h=
dev, int id, u8 *cfg, int len,
> > > > =C2=A0	if (ret !=3D len && ret >=3D 0)
> > > > =C2=A0		return -EIO;
> > > > =C2=A0
> > > > =

> > > > -	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
> > > > +	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
> > > > =C2=A0}
> > > =

> > > There are 2 of these so I wonder about the static analysis.
> > =

> > There is nothing wrong with the static analysis. The first scnprintf fo=
rmat
> > type is perfectly valid as far as its size is greater than the size of =
the
> > data pointed by the *field pointer, which is a one byte size in our cas=
e.
> > The static analysis warned about the second scnprintf case, where the f=
ormat
> > type was shorter than the integer returned by the __builtin_constant_p.
> > This warning can be considered as a false positive since the le16_to_cp=
u is
> > all about the 16 bits numbers, but to silence it, I submitted the above=
 fix.
> =

> $ git grep __arch_swab16 arch/arm*/
> arch/arm/include/asm/swab.h:#define __arch_swab16(x) ((__u16)__arch_swahb=
32(x))
> =

> otherwise:
> =

> static inline __attribute_const__ __u16 __fswab16(__u16 val)
> {
> #if defined (__arch_swab16)
> 	return __arch_swab16(val);
> #else
> 	return ___constant_swab16(val);
> #endif
> }
> =

> #define ___constant_swab16(x) ((__u16)(				\
> 	(((__u16)(x) & (__u16)0x00ffU) << 8) |			\
> 	(((__u16)(x) & (__u16)0xff00U) >> 8)))
> =

> /**
>  * __swab16 - return a byteswapped 16-bit value
>  * @x: value to byteswap
>  */
> #ifdef __HAVE_BUILTIN_BSWAP16__
> #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
> #else
> #define __swab16(x)				\
> 	(__builtin_constant_p((__u16)(x)) ?	\
> 	___constant_swab16(x) :			\
> 	__fswab16(x))
> #endif
> =

> Under what condition does the ?: return an int sized value
> rather than a u16 sized value?  I fail to see a path where
> the compiler should promote the returned value to int _before_
> the promotion done for the varargs use.

Oh, I see your point. Might it be that the static analysis misinterpreted
the __builtin_constant_p function which has a `int __builtin_constant_p (ex=
p)`
prototype according to the GCC and clang built-in functions description?

> =

> If it's for the varargs use, then both instances are promoted.
> =

> > > It's probably better to use sysfs_emit as well.
> > =

> > The sysfs_emit was introduced in the 5.10 kernel:
> > 2efc459d06f16 (Joe Perches 2020-09-16 13:40:38 -0700 335) int sysfs_emi=
t(...)
> > =

> > But, the hid-ft260 driver will be used mostly with older kernels, at le=
ast,
> > for the next couple of years. Since older kernel versions do not have t=
his API,
> > it will require patching the driver or kernel that I would like to avoi=
d.
> > Nevertheless, we can reconsider the sysfs_emit usage in this driver in =
the
> > future, upon wider 5.10+ kernels' adoption.
> =

> If this is only for older kernels, then it's not really useful
> upstream IMO.

Under "mostly", I meant that the majority of the kernels used in the existi=
ng and
currently developing electronic appliances (not necessarily computers) are =
older
than the 5.10 version at the moment, and this driver should be usable also =
by them.

The scnprintf enables the hid-ft260 driver reuse by virtually any kernel ve=
rsion.

$ git grep scnprintf | wc -l
6121

> =

> any sprintf style use of %h or %hh for a sub int sized value isn't
> particularly useful as integer promotion is done on the value so it
> should use %d (or %i, but %i is atypical) anyway.
> =

> https://lore.kernel.org/lkml/CAHk-=3Dwgoxnmsj8GEVFJSvTwdnWm8wVJthefNk2n6+=
4TC=3D20e0Q(a)mail.gmail.com/

Thanks for sharing this info. I will replace the %hi with %d as you
suggested.
> =

> $ git grep '%d\b' | wc -l
> 109922
> $ git grep '%i\b' | wc -l
> 3508
> =

>=20
--===============8458037021396491419==--

