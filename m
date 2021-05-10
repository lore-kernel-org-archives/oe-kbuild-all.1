Content-Type: multipart/mixed; boundary="===============1653164490355760463=="
MIME-Version: 1.0
From: Michael Zaidman <michael.zaidman@gmail.com>
To: kbuild-all@lists.01.org
Subject: [PATCH v3] HID: ft260: fix format type warning in ft260_word_show()
Date: Mon, 10 May 2021 19:34:28 +0300
Message-ID: <20210510163428.2415-1-michael.zaidman@gmail.com>
In-Reply-To: <202105060637.LeEC6ztp-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1653164490355760463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")

Fix warning reported by static analysis when built with W=3D1 for arm64 by
clang version 13.0.0

>> drivers/hid/hid-ft260.c:794:44: warning: format specifies type 'short' b=
ut
   the argument has type 'int' [-Wformat]
           return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
                                             ~~~     ^~~~~~~~~~~~~~~~~~~
                                             %i
   include/linux/byteorder/generic.h:91:21: note: expanded from
                                            macro 'le16_to_cpu'
   #define le16_to_cpu __le16_to_cpu
                       ^
   include/uapi/linux/byteorder/big_endian.h:36:26: note: expanded from
                                                    macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/swab.h:105:2: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Any sprintf style use of %h or %hi for a sub-int sized value isn't useful
since integer promotion is done on the value anyway. So, use %d instead.

https://lore.kernel.org/lkml/CAHk-=3Dwgoxnmsj8GEVFJSvTwdnWm8wVJthefNk2n6+4T=
C=3D20e0Q(a)mail.gmail.com/

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
Suggested-by: Joe Perches <joe@perches.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/hid/hid-ft260.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 047aa85a7c83..ff2a49b5cac5 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -779,7 +779,7 @@ static int ft260_byte_show(struct hid_device *hdev, int=
 id, u8 *cfg, int len,
 	if (ret !=3D len && ret >=3D 0)
 		return -EIO;
 =

-	return scnprintf(buf, PAGE_SIZE, "%hi\n", *field);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", *field);
 }
 =

 static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int l=
en,
@@ -791,7 +791,7 @@ static int ft260_word_show(struct hid_device *hdev, int=
 id, u8 *cfg, int len,
 	if (ret !=3D len && ret >=3D 0)
 		return -EIO;
 =

-	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
+	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
 }
 =

 #define FT260_ATTR_SHOW(name, reptype, id, type, func)			       \
-- =

2.25.1

--===============1653164490355760463==--

