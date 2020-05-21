Content-Type: multipart/mixed; boundary="===============9021234691498095278=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH linux-next] drm/msm/a6xx: a6xx_hfi_send_start() can be static
Date: Thu, 21 May 2020 16:30:19 +0800
Message-ID: <20200521083019.GA66267@f61f8b3f25ca>
In-Reply-To: <202005211627.xf4dxc5b%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9021234691498095278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 8167e6fa76c8 ("drm/msm/a6xx: HFI v2 for A640 and A650")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 a6xx_hfi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/ad=
reno/a6xx_hfi.c
index f9db69e771214..9921e632f1ca2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -342,7 +342,7 @@ static int a6xx_hfi_send_test(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 =

-int a6xx_hfi_send_start(struct a6xx_gmu *gmu)
+static int a6xx_hfi_send_start(struct a6xx_gmu *gmu)
 {
 	struct a6xx_hfi_msg_start msg =3D { 0 };
 =

@@ -350,7 +350,7 @@ int a6xx_hfi_send_start(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 =

-int a6xx_hfi_send_core_fw_start(struct a6xx_gmu *gmu)
+static int a6xx_hfi_send_core_fw_start(struct a6xx_gmu *gmu)
 {
 	struct a6xx_hfi_msg_core_fw_start msg =3D { 0 };
=20
--===============9021234691498095278==--

