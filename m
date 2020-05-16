Content-Type: multipart/mixed; boundary="===============8028667785295219734=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] drivers: nvmem: addr_in_qfprom_range() can be static
Date: Sat, 16 May 2020 22:22:02 +0800
Message-ID: <20200516142202.GA80737@920d5ee5547d>
In-Reply-To: <1589307480-27508-3-git-send-email-rbokka@codeaurora.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8028667785295219734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 qfprom-efuse.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/qfprom-efuse.c b/drivers/nvmem/qfprom-efuse.c
index 2e3c275e963f9..577257d61d22d 100644
--- a/drivers/nvmem/qfprom-efuse.c
+++ b/drivers/nvmem/qfprom-efuse.c
@@ -206,8 +206,8 @@ static int qfprom_enable_fuse_blowing(const struct qfpr=
om_efuse_priv *priv)
  * verifying to make sure address being written or read is from qfprom
  * raw address range
  */
-bool addr_in_qfprom_range(const struct qfprom_efuse_priv *priv, u32 reg,
-			  size_t bytes)
+static bool addr_in_qfprom_range(const struct qfprom_efuse_priv *priv, u32=
 reg,
+				 size_t bytes)
 {
 	if (((reg + bytes) > reg) && (reg >=3D priv->qfpraw_start) &&
 	    ((reg + bytes) <=3D priv->qfpraw_end)) {
--===============8028667785295219734==--

