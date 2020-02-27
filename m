Content-Type: multipart/mixed; boundary="===============3773770333487164801=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH drm-drm-misc] drm/panfrost: default_supplies[] can be static
Date: Thu, 27 Feb 2020 09:41:46 +0800
Message-ID: <20200227014100.GA61938@e50d7db646c3>
In-Reply-To: <202002270919.HDU1EgMa%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3773770333487164801==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 3e1399bccf51 ("drm/panfrost: Add support for multiple regulators")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 panfrost_drv.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panf=
rost/panfrost_drv.c
index 4d08507526239..3e521627b5fbb 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -659,7 +659,7 @@ static int panfrost_remove(struct platform_device *pdev)
 	return 0;
 }
 =

-const char * const default_supplies[] =3D { "mali" };
+static const char * const default_supplies[] =3D { "mali" };
 static const struct panfrost_compatible default_data =3D {
 	.num_supplies =3D ARRAY_SIZE(default_supplies),
 	.supply_names =3D default_supplies,
--===============3773770333487164801==--

