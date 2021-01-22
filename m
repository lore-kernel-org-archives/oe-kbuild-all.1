Content-Type: multipart/mixed; boundary="===============8302614863277763481=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH freescale-fslc] MLK-21957-3: ASoC: fsl_sai: fsl_sai_get_reg() can be static
Date: Fri, 22 Jan 2021 12:16:21 +0800
Message-ID: <20210122041621.GA68571@5c54a147a90d>
In-Reply-To: <202101221213.n4h4ydtQ-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8302614863277763481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: e605cf31e835 ("MLK-21957-3: ASoC: fsl_sai: add bitcount and timestam=
p controls")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 fsl_sai.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index f0d35c6a0a67e36..f63c1d27460fec0 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1003,8 +1003,8 @@ SOC_ENUM_SINGLE(FSL_SAI_TTCTL, 1, ARRAY_SIZE(inc_sl),=
 inc_sl),
 SOC_ENUM_SINGLE(FSL_SAI_RTCTL, 1, ARRAY_SIZE(inc_sl), inc_sl),
 };
 =

-int fsl_sai_get_reg(struct snd_kcontrol *kcontrol,
-		    struct snd_ctl_elem_value *ucontrol)
+static int fsl_sai_get_reg(struct snd_kcontrol *kcontrol,
+			   struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
 	struct soc_mreg_control *mc =3D
--===============8302614863277763481==--

