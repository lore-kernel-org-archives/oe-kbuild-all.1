Content-Type: multipart/mixed; boundary="===============2599260117436865720=="
MIME-Version: 1.0
From: Michael Zaidman <michael.zaidman@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] HID: ft260: fix format type warning in ft260_word_show()
Date: Mon, 10 May 2021 12:17:30 +0300
Message-ID: <20210510091730.GA2276@michael-VirtualBox>
In-Reply-To: <26e1929386babea33d4a320b506c5247caacde77.camel@perches.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2599260117436865720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 09, 2021 at 01:39:29PM -0700, Joe Perches wrote:
> On Sun, 2021-05-09 at 22:32 +0300, Michael Zaidman wrote:
> > Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver=
")
> > =

> > Fix warning reported by static analysis when built with W=3D1 for arm64=
 by
> > clang version 13.0.0
> > =

> > > > drivers/hid/hid-ft260.c:794:44: warning: format specifies type 'sho=
rt' but
> > =C2=A0=C2=A0=C2=A0the argument has type 'int' [-Wformat]
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0retur=
n scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0~~~     ^~~~~~~~~~~~~~~~=
~~~
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0%i
> > =C2=A0=C2=A0=C2=A0include/linux/byteorder/generic.h:91:21: note: expand=
ed from
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0macro 'le16_to_cpu'
> > =C2=A0=C2=A0=C2=A0#define le16_to_cpu __le16_to_cpu
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^
> > =C2=A0=C2=A0=C2=A0include/uapi/linux/byteorder/big_endian.h:36:26: note=
: expanded from
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0macro '__le16_to_cpu'
> > =C2=A0=C2=A0=C2=A0#define __le16_to_cpu(x) __swab16((__force __u16)(__l=
e16)(x))
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > =C2=A0=C2=A0=C2=A0include/uapi/linux/swab.h:105:2: note: expanded from =
macro '__swab16'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(__bu=
iltin_constant_p((__u16)(x)) ?     \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > =

> > Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > ---
> > =C2=A0drivers/hid/hid-ft260.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> > index 047aa85a7c83..38794a29599c 100644
> > --- a/drivers/hid/hid-ft260.c
> > +++ b/drivers/hid/hid-ft260.c
> > @@ -791,7 +791,7 @@ static int ft260_word_show(struct hid_device *hdev,=
 int id, u8 *cfg, int len,
> > =C2=A0	if (ret !=3D len && ret >=3D 0)
> > =C2=A0		return -EIO;
> > =C2=A0
> > =

> > -	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
> > +	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
> > =C2=A0}
> =

> There are 2 of these so I wonder about the static analysis.

There is nothing wrong with the static analysis. The first scnprintf format
type is perfectly valid as far as its size is greater than the size of the
data pointed by the *field pointer, which is a one byte size in our case.
The static analysis warned about the second scnprintf case, where the format
type was shorter than the integer returned by the __builtin_constant_p.
This warning can be considered as a false positive since the le16_to_cpu is
all about the 16 bits numbers, but to silence it, I submitted the above fix.

> It's probably better to use sysfs_emit as well.

The sysfs_emit was introduced in the 5.10 kernel:
2efc459d06f16 (Joe Perches 2020-09-16 13:40:38 -0700 335) int sysfs_emit(..=
.)

But, the hid-ft260 driver will be used mostly with older kernels, at least,
for the next couple of years. Since older kernel versions do not have this =
API,
it will require patching the driver or kernel that I would like to avoid.
Nevertheless, we can reconsider the sysfs_emit usage in this driver in the
future, upon wider 5.10+ kernels' adoption.

> ---
>  drivers/hid/hid-ft260.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> index 7a9ba984a75a..475641682fff 100644
> --- a/drivers/hid/hid-ft260.c
> +++ b/drivers/hid/hid-ft260.c
> @@ -783,7 +783,7 @@ static int ft260_byte_show(struct hid_device *hdev, i=
nt id, u8 *cfg, int len,
>  	if (ret !=3D len && ret >=3D 0)
>  		return -EIO;
>  =

> -	return scnprintf(buf, PAGE_SIZE, "%hi\n", *field);
> +	return sysfs_emit(buf, "%d\n", *field);
>  }
>  =

>  static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int=
 len,
> @@ -795,7 +795,7 @@ static int ft260_word_show(struct hid_device *hdev, i=
nt id, u8 *cfg, int len,
>  	if (ret !=3D len && ret >=3D 0)
>  		return -EIO;
>  =

> -	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
> +	return sysfs_emit(buf, "%d\n", le16_to_cpu(*field));
>  }
>  =

>  #define FT260_ATTR_SHOW(name, reptype, id, type, func)			       \
>=20
--===============2599260117436865720==--

