Content-Type: multipart/mixed; boundary="===============7387280358452490261=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] iio: accel: kxcjk-1013: kx0231025_regs can be static
Date: Tue, 11 May 2021 21:14:22 +0800
Message-ID: <20210511131422.GA31783@86ca4a2db576>
In-Reply-To: <20210511095409.9290-4-stephan@gerhold.net>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7387280358452490261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

drivers/iio/accel/kxcjk-1013.c:224:30: warning: symbol 'kx0231025_regs' was=
 not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 kxcjk-1013.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/accel/kxcjk-1013.c b/drivers/iio/accel/kxcjk-1013.c
index 5aa2a1cb2309d..1e5e241f2bcdf 100644
--- a/drivers/iio/accel/kxcjk-1013.c
+++ b/drivers/iio/accel/kxcjk-1013.c
@@ -221,7 +221,7 @@ const struct kx_chipset_regs kxtf9_regs =3D {
 };
 =

 /* The registers have totally different names but the bits are compatible =
*/
-const struct kx_chipset_regs kx0231025_regs =3D {
+static const struct kx_chipset_regs kx0231025_regs =3D {
 	.int_src1	=3D KX023_REG_INS2,
 	.int_src2	=3D KX023_REG_INS3,
 	.int_rel	=3D KX023_REG_INT_REL,
--===============7387280358452490261==--

