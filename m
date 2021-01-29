Content-Type: multipart/mixed; boundary="===============3055725971775351070=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH skeggsb] drm/nouveau/mc/tu102: tu102_mc_intr_unarm can be static
Date: Fri, 29 Jan 2021 16:44:44 +0800
Message-ID: <20210129084444.GA44008@24bf76ccec0e>
In-Reply-To: <202101291627.uhDyQDaa-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3055725971775351070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 tu102.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/mc/tu102.c
index cda924d56a2a7..0d715f265b077 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
@@ -46,7 +46,7 @@ tu102_mc_intr_update(struct tu102_mc *mc)
 		nvkm_wr32(device, 0xb81610, 0x6);
 }
 =

-void
+static void
 tu102_mc_intr_unarm(struct nvkm_mc *base)
 {
 	struct tu102_mc *mc =3D tu102_mc(base);
@@ -58,7 +58,7 @@ tu102_mc_intr_unarm(struct nvkm_mc *base)
 	spin_unlock_irqrestore(&mc->lock, flags);
 }
 =

-void
+static void
 tu102_mc_intr_rearm(struct nvkm_mc *base)
 {
 	struct tu102_mc *mc =3D tu102_mc(base);
@@ -70,7 +70,7 @@ tu102_mc_intr_rearm(struct nvkm_mc *base)
 	spin_unlock_irqrestore(&mc->lock, flags);
 }
 =

-void
+static void
 tu102_mc_intr_mask(struct nvkm_mc *base, u32 mask, u32 intr)
 {
 	struct tu102_mc *mc =3D tu102_mc(base);
@@ -128,7 +128,7 @@ tu102_mc =3D {
 	.reset =3D gk104_mc_reset,
 };
 =

-int
+static int
 tu102_mc_new_(const struct nvkm_mc_func *func, struct nvkm_device *device,
 	      int index, struct nvkm_mc **pmc)
 {
--===============3055725971775351070==--

