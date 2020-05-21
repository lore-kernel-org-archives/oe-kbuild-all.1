Content-Type: multipart/mixed; boundary="===============6325327517032191431=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH shawnguo] clk: imx: imx8m_clk_composite_mux_ops can be static
Date: Thu, 21 May 2020 19:04:39 +0800
Message-ID: <20200521110439.GA55876@f61f8b3f25ca>
In-Reply-To: <202005211954.Rc03oK6u%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6325327517032191431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 3f0365dafe32 ("clk: imx: add mux ops for i.MX8M composite clk")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 clk-composite-8m.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-composite-8m.c b/drivers/clk/imx/clk-compo=
site-8m.c
index 8fa60f22d377f..2d9562ebddc3f 100644
--- a/drivers/clk/imx/clk-composite-8m.c
+++ b/drivers/clk/imx/clk-composite-8m.c
@@ -164,7 +164,7 @@ imx8m_clk_composite_mux_determine_rate(struct clk_hw *h=
w,
 }
 =

 =

-const struct clk_ops imx8m_clk_composite_mux_ops =3D {
+static const struct clk_ops imx8m_clk_composite_mux_ops =3D {
 	.get_parent =3D imx8m_clk_composite_mux_get_parent,
 	.set_parent =3D imx8m_clk_composite_mux_set_parent,
 	.determine_rate =3D imx8m_clk_composite_mux_determine_rate,
--===============6325327517032191431==--

