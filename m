Content-Type: multipart/mixed; boundary="===============3472917300557605117=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH linux-next] drm/msm/dpu: dpu_setup_dspp_pcc() can be static
Date: Thu, 21 May 2020 15:11:13 +0800
Message-ID: <20200521071112.GA92825@f61f8b3f25ca>
In-Reply-To: <202005211507.nm5LmztD%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3472917300557605117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu d=
river")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 dpu_hw_dspp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/=
msm/disp/dpu1/dpu_hw_dspp.c
index b5189cece3c66..a7a24539921f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -22,7 +22,7 @@
 #define PCC_BLUE_G_OFF 0x24
 #define PCC_BLUE_B_OFF 0x30
 =

-void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
+static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 		struct dpu_hw_pcc_cfg *cfg)
 {
=20
--===============3472917300557605117==--

