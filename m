Content-Type: multipart/mixed; boundary="===============7375715615310962477=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] clk: qcom: apss_pll_offsets[] can be static
Date: Fri, 28 Feb 2020 01:40:04 +0800
Message-ID: <20200227174004.GA29216@f6f0d943a460>
In-Reply-To: <1582797318-26288-3-git-send-email-sivaprak@codeaurora.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7375715615310962477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: bfce07143090 ("clk: qcom: Add ipq6018 apss clock controller")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 apss-ipq6018.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/apss-ipq6018.c b/drivers/clk/qcom/apss-ipq601=
8.c
index 04b8962dbc8e0..663f0949ab109 100644
--- a/drivers/clk/qcom/apss-ipq6018.c
+++ b/drivers/clk/qcom/apss-ipq6018.c
@@ -36,7 +36,7 @@ enum {
 	P_APSS_PLL
 };
 =

-const u8 apss_pll_offsets[] =3D {
+static const u8 apss_pll_offsets[] =3D {
 	[PLL_OFF_L_VAL] =3D 0x08,
 	[PLL_OFF_ALPHA_VAL] =3D 0x10,
 	[PLL_OFF_USER_CTL] =3D 0x18,
--===============7375715615310962477==--

