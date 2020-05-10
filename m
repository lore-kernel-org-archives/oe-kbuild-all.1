Content-Type: multipart/mixed; boundary="===============1078646473720645444=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH omap] gnss: motmdm: motmdm_gnss_send_command() can be static
Date: Sun, 10 May 2020 23:36:58 +0800
Message-ID: <20200510153658.GA87187@7c31f038ab56>
In-Reply-To: <202005102338.fOZzLJuj%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1078646473720645444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: ae348e86a0ab ("gnss: motmdm: Add support for Motorola Mapphone MDM66=
00 modem")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 motmdm.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gnss/motmdm.c b/drivers/gnss/motmdm.c
index da1d44bed899d..49d4580ae3eae 100644
--- a/drivers/gnss/motmdm.c
+++ b/drivers/gnss/motmdm.c
@@ -68,8 +68,8 @@ MODULE_PARM_DESC(rate_ms, "GNSS refresh rate between 1000=
 and 16000 ms (default
  * sort out the ID conflicts with the modem's unsolicited message ID
  * numbering.
  */
-int motmdm_gnss_send_command(struct motmdm_gnss_data *ddata,
-			     const u8 *buf, int len)
+static int motmdm_gnss_send_command(struct motmdm_gnss_data *ddata,
+				    const u8 *buf, int len)
 {
 	struct gnss_device *gdev =3D ddata->gdev;
 	const int timeout_ms =3D 1000;
--===============1078646473720645444==--

