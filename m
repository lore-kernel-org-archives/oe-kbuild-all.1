Content-Type: multipart/mixed; boundary="===============2876864260119765811=="
MIME-Version: 1.0
From: Joe Perches <joe@perches.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] HID: ft260: fix format type warning in ft260_word_show()
Date: Sun, 09 May 2021 13:39:29 -0700
Message-ID: <26e1929386babea33d4a320b506c5247caacde77.camel@perches.com>
In-Reply-To: <20210509193213.5974-1-michael.zaidman@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2876864260119765811==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 2021-05-09 at 22:32 +0300, Michael Zaidman wrote:
> Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
> =

> Fix warning reported by static analysis when built with W=3D1 for arm64 by
> clang version 13.0.0
> =

> > > drivers/hid/hid-ft260.c:794:44: warning: format specifies type 'short=
' but
> =C2=A0=C2=A0=C2=A0the argument has type 'int' [-Wformat]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return =
scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0~~~     ^~~~~~~~~~~~~~~~~~~
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0%i
> =C2=A0=C2=A0=C2=A0include/linux/byteorder/generic.h:91:21: note: expanded=
 from
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0macro 'le16_to_cpu'
> =C2=A0=C2=A0=C2=A0#define le16_to_cpu __le16_to_cpu
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^
> =C2=A0=C2=A0=C2=A0include/uapi/linux/byteorder/big_endian.h:36:26: note: =
expanded from
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0macro '__le16_to_cpu'
> =C2=A0=C2=A0=C2=A0#define __le16_to_cpu(x) __swab16((__force __u16)(__le1=
6)(x))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> =C2=A0=C2=A0=C2=A0include/uapi/linux/swab.h:105:2: note: expanded from ma=
cro '__swab16'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(__buil=
tin_constant_p((__u16)(x)) ?     \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> =

> Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
> =C2=A0drivers/hid/hid-ft260.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> index 047aa85a7c83..38794a29599c 100644
> --- a/drivers/hid/hid-ft260.c
> +++ b/drivers/hid/hid-ft260.c
> @@ -791,7 +791,7 @@ static int ft260_word_show(struct hid_device *hdev, i=
nt id, u8 *cfg, int len,
> =C2=A0	if (ret !=3D len && ret >=3D 0)
> =C2=A0		return -EIO;
> =C2=A0
> =

> -	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
> =C2=A0}

There are 2 of these so I wonder about the static analysis.
It's probably better to use sysfs_emit as well.
---
 drivers/hid/hid-ft260.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 7a9ba984a75a..475641682fff 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -783,7 +783,7 @@ static int ft260_byte_show(struct hid_device *hdev, int=
 id, u8 *cfg, int len,
 	if (ret !=3D len && ret >=3D 0)
 		return -EIO;
 =

-	return scnprintf(buf, PAGE_SIZE, "%hi\n", *field);
+	return sysfs_emit(buf, "%d\n", *field);
 }
 =

 static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int l=
en,
@@ -795,7 +795,7 @@ static int ft260_word_show(struct hid_device *hdev, int=
 id, u8 *cfg, int len,
 	if (ret !=3D len && ret >=3D 0)
 		return -EIO;
 =

-	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
+	return sysfs_emit(buf, "%d\n", le16_to_cpu(*field));
 }
 =

 #define FT260_ATTR_SHOW(name, reptype, id, type, func)			       \

--===============2876864260119765811==--

