Content-Type: multipart/mixed; boundary="===============7825248889007645097=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] drm/vc4: hdmi: bcm2835_variant can be static
Date: Tue, 25 Feb 2020 08:33:58 +0800
Message-ID: <20200225003357.GA56220@e50d7db646c3>
In-Reply-To: <f63515dab753317d7416ccc7acab9c8a7af1ac9e.1582533919.git-series.maxime@cerno.tech>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7825248889007645097==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 9ee5cdb1c45e ("drm/vc4: hdmi: Introduce resource init and variant")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 vc4_hdmi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a982ce8b901db..321b531a87402 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1398,7 +1398,7 @@ static int vc4_hdmi_dev_remove(struct platform_device=
 *pdev)
 	return 0;
 }
 =

-struct vc4_hdmi_variant bcm2835_variant =3D {
+static struct vc4_hdmi_variant bcm2835_variant =3D {
 	.init_resources		=3D vc4_hdmi_init_resources,
 };
=20
--===============7825248889007645097==--

