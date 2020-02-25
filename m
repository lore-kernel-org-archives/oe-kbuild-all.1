Content-Type: multipart/mixed; boundary="===============2713709075531692702=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] drm/vc4: hdmi: bcm2711_hdmi0_variant can be static
Date: Tue, 25 Feb 2020 12:31:04 +0800
Message-ID: <20200225043102.GA89093@e50d7db646c3>
In-Reply-To: <35ec1082e5597a1c6d48d2ebfa0964a7ae1e335c.1582533919.git-series.maxime@cerno.tech>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2713709075531692702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: bbc6d68b4e40 ("drm/vc4: hdmi: Support the BCM2711 HDMI controllers")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 vc4_hdmi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 86ecc7e894207c..b3b706143dd897 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1682,7 +1682,7 @@ struct vc4_hdmi_variant bcm2835_variant =3D {
 	.phy_rng_disable	=3D vc4_hdmi_phy_rng_disable,
 };
 =

-struct vc4_hdmi_variant bcm2711_hdmi0_variant =3D {
+static struct vc4_hdmi_variant bcm2711_hdmi0_variant =3D {
 	.id			=3D 0,
 	.max_pixel_clock	=3D 297000000,
 	.registers		=3D vc5_hdmi_hdmi0_fields,
@@ -1703,7 +1703,7 @@ struct vc4_hdmi_variant bcm2711_hdmi0_variant =3D {
 	.phy_rng_disable	=3D vc5_hdmi_phy_rng_disable,
 };
 =

-struct vc4_hdmi_variant bcm2711_hdmi1_variant =3D {
+static struct vc4_hdmi_variant bcm2711_hdmi1_variant =3D {
 	.id			=3D 1,
 	.max_pixel_clock	=3D 297000000,
 	.registers		=3D vc5_hdmi_hdmi1_fields,
--===============2713709075531692702==--

