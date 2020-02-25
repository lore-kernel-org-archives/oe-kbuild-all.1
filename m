Content-Type: multipart/mixed; boundary="===============2300196323471054799=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH plbossart-sound] soundwire: intel: intel_sdw_driver can be static
Date: Wed, 26 Feb 2020 05:41:55 +0800
Message-ID: <20200225214155.GA125296@e50d7db646c3>
In-Reply-To: <202002260556.YBOqNfNq%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2300196323471054799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: ecf498d45123 ("soundwire: intel: transition to sdw_master_device/dri=
ver support")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 intel.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 678a15d6d0a24..5a583382cec4a 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1218,7 +1218,7 @@ static int intel_master_remove(struct sdw_master_devi=
ce *md)
 }
 =

 =

-struct sdw_master_driver intel_sdw_driver =3D {
+static struct sdw_master_driver intel_sdw_driver =3D {
 	.driver =3D {
 		.name =3D "intel-master",
 		.owner =3D THIS_MODULE,
--===============2300196323471054799==--

