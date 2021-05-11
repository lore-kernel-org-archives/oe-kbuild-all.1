Content-Type: multipart/mixed; boundary="===============1571694176645444688=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] iio: accel: kxcjk-1013: kxcjk1013_regs can be static
Date: Tue, 11 May 2021 20:37:58 +0800
Message-ID: <20210511123758.GA70037@86ca4a2db576>
In-Reply-To: <20210511095409.9290-3-stephan@gerhold.net>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1571694176645444688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

drivers/iio/accel/kxcjk-1013.c:150:30: warning: symbol 'kxcjk1013_regs' was=
 not declared. Should it be static?
drivers/iio/accel/kxcjk-1013.c:162:30: warning: symbol 'kxtf9_regs' was not=
 declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 kxcjk-1013.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/accel/kxcjk-1013.c b/drivers/iio/accel/kxcjk-1013.c
index 8800ebf47b5a7..492f576f97348 100644
--- a/drivers/iio/accel/kxcjk-1013.c
+++ b/drivers/iio/accel/kxcjk-1013.c
@@ -147,7 +147,7 @@ struct kx_chipset_regs {
 	u8 wake_thres;
 };
 =

-const struct kx_chipset_regs kxcjk1013_regs =3D {
+static const struct kx_chipset_regs kxcjk1013_regs =3D {
 	.int_src1	=3D KXCJK1013_REG_INT_SRC1,
 	.int_src2	=3D KXCJK1013_REG_INT_SRC2,
 	.int_rel	=3D KXCJK1013_REG_INT_REL,
@@ -159,7 +159,7 @@ const struct kx_chipset_regs kxcjk1013_regs =3D {
 	.wake_thres	=3D KXCJK1013_REG_WAKE_THRES,
 };
 =

-const struct kx_chipset_regs kxtf9_regs =3D {
+static const struct kx_chipset_regs kxtf9_regs =3D {
 	/* .int_src1 was moved to INT_SRC2 on KXTF9 */
 	.int_src1	=3D KXTF9_REG_INT_SRC2,
 	/* .int_src2 is not available */
--===============1571694176645444688==--

