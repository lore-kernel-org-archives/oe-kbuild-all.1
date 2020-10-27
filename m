Content-Type: multipart/mixed; boundary="===============7368527961743274489=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] platform/chrome: cros_ec_typec: cros_typec_cmds_supported() can be static
Date: Tue, 27 Oct 2020 22:27:14 +0800
Message-ID: <20201027142714.GA59601@b3e12f4a23db>
In-Reply-To: <20201021205317.708008-6-pmalani@chromium.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7368527961743274489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kernel test robot <lkp@intel.com>
---
 cros_ec_typec.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chr=
ome/cros_ec_typec.c
index 98d22720b365fe..f578d0bfbe5a75 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -695,7 +695,7 @@ static int cros_typec_get_cmd_version(struct cros_typec=
_data *typec)
 }
 =

 /* Check the EC feature flags to see if TYPEC_* commands are supported. */
-int cros_typec_cmds_supported(struct cros_typec_data *typec)
+static int cros_typec_cmds_supported(struct cros_typec_data *typec)
 {
 	struct ec_response_get_features resp =3D {};
 	int ret;
--===============7368527961743274489==--

