Content-Type: multipart/mixed; boundary="===============0293115821265567561=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH mac80211-next] net: ethtool: ethnl_act_cable_test_tdr_cfg() can be static
Date: Thu, 28 May 2020 00:37:13 +0800
Message-ID: <20200527163713.GA37306@c08b96c6f6ed>
In-Reply-To: <202005280023.WcZcdZML%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0293115821265567561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: f2bc8ad31a7f ("net: ethtool: Allow PHY cable test TDR data to config=
ured")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 cabletest.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/ethtool/cabletest.c b/net/ethtool/cabletest.c
index 9991688d7d1d5..7b7a0456c15ce 100644
--- a/net/ethtool/cabletest.c
+++ b/net/ethtool/cabletest.c
@@ -227,9 +227,9 @@ cable_test_tdr_act_policy[ETHTOOL_A_CABLE_TEST_TDR_MAX =
+ 1] =3D {
 };
 =

 /* CABLE_TEST_TDR_ACT */
-int ethnl_act_cable_test_tdr_cfg(const struct nlattr *nest,
-				 struct genl_info *info,
-				 struct phy_tdr_config *cfg)
+static int ethnl_act_cable_test_tdr_cfg(const struct nlattr *nest,
+					struct genl_info *info,
+					struct phy_tdr_config *cfg)
 {
 	struct nlattr *tb[ETHTOOL_A_CABLE_TEST_TDR_CFG_MAX + 1];
 	int ret;
--===============0293115821265567561==--

