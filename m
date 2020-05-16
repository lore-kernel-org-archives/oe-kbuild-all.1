Content-Type: multipart/mixed; boundary="===============5603370793216572166=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH lkundrak-linux-mmp] mfd: ene-kb3930: global_kb3930 can be static
Date: Sat, 16 May 2020 21:25:07 +0800
Message-ID: <20200516132507.GA83062@2e0f235bde3a>
In-Reply-To: <202005162131.A7k8dY81%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5603370793216572166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 84f417afc0f8 ("mfd: ene-kb3930: Add driver for ENE KB3930 Embedded C=
ontroller")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 ene-kb3930.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/ene-kb3930.c b/drivers/mfd/ene-kb3930.c
index 1123f3a1c816a..af1e5ff72e395 100644
--- a/drivers/mfd/ene-kb3930.c
+++ b/drivers/mfd/ene-kb3930.c
@@ -31,7 +31,7 @@ struct kb3930 {
 	struct gpio_descs *off_gpios;
 };
 =

-struct kb3930 *global_kb3930;
+static struct kb3930 *global_kb3930;
 =

 static void kb3930_off(struct kb3930 *priv, int poweroff)
 {
--===============5603370793216572166==--

