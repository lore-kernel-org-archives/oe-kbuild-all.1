Content-Type: multipart/mixed; boundary="===============2054077714474416693=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH linus] clk: sprd: lpll_gate can be static
Date: Tue, 19 May 2020 10:33:32 +0800
Message-ID: <20200519023332.GA61191@e6e5adba6cbc>
In-Reply-To: <202005191007.Gr8sypTM%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2054077714474416693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 0e4b8a2349f3 ("clk: sprd: add clocks support for SC9863A")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 sc9863a-clk.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sprd/sc9863a-clk.c b/drivers/clk/sprd/sc9863a-clk.c
index 2e2dfb2d48fff..446a44d8744ab 100644
--- a/drivers/clk/sprd/sc9863a-clk.c
+++ b/drivers/clk/sprd/sc9863a-clk.c
@@ -27,7 +27,7 @@ SPRD_PLL_SC_GATE_CLK_FW_NAME(mpll0_gate, "mpll0-gate", "e=
xt-26m", 0x94,
 			     0x1000, BIT(0), CLK_IGNORE_UNUSED, 0, 240);
 SPRD_PLL_SC_GATE_CLK_FW_NAME(dpll0_gate, "dpll0-gate", "ext-26m", 0x98,
 			     0x1000, BIT(0), 0, 0, 240);
-SPRD_PLL_SC_GATE_CLK_FW_NAME(lpll_gate, "lpll-gate", "ext-26m", 0x9c,
+static SPRD_PLL_SC_GATE_CLK_FW_NAME(lpll_gate, "lpll-gate", "ext-26m", 0x9=
c,
 			     0x1000, BIT(0), 0, 0, 240);
 SPRD_PLL_SC_GATE_CLK_FW_NAME(gpll_gate, "gpll-gate", "ext-26m", 0xa8,
 			     0x1000, BIT(0), 0, 0, 240);
@@ -35,9 +35,9 @@ SPRD_PLL_SC_GATE_CLK_FW_NAME(dpll1_gate, "dpll1-gate", "e=
xt-26m", 0x1dc,
 			     0x1000, BIT(0), 0, 0, 240);
 SPRD_PLL_SC_GATE_CLK_FW_NAME(mpll1_gate, "mpll1-gate", "ext-26m", 0x1e0,
 			     0x1000, BIT(0), CLK_IGNORE_UNUSED, 0, 240);
-SPRD_PLL_SC_GATE_CLK_FW_NAME(mpll2_gate, "mpll2-gate", "ext-26m", 0x1e4,
+static SPRD_PLL_SC_GATE_CLK_FW_NAME(mpll2_gate, "mpll2-gate", "ext-26m", 0=
x1e4,
 			     0x1000, BIT(0), CLK_IGNORE_UNUSED, 0, 240);
-SPRD_PLL_SC_GATE_CLK_FW_NAME(isppll_gate, "isppll-gate", "ext-26m", 0x1e8,
+static SPRD_PLL_SC_GATE_CLK_FW_NAME(isppll_gate, "isppll-gate", "ext-26m",=
 0x1e8,
 			     0x1000, BIT(0), 0, 0, 240);
 =

 static struct sprd_clk_common *sc9863a_pmu_gate_clks[] =3D {
--===============2054077714474416693==--

