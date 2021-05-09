Content-Type: multipart/mixed; boundary="===============4971696420461489192=="
MIME-Version: 1.0
From: Michael Zaidman <michael.zaidman@gmail.com>
To: kbuild-all@lists.01.org
Subject: [PATCH] HID: ft260: fix format type warning in ft260_word_show()
Date: Sun, 09 May 2021 22:32:13 +0300
Message-ID: <20210509193213.5974-1-michael.zaidman@gmail.com>
In-Reply-To: <202105060637.LeEC6ztp-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4971696420461489192==
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

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/hid/hid-ft260.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 047aa85a7c83..38794a29599c 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
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

--===============4971696420461489192==--

