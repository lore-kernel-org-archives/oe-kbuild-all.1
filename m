Content-Type: multipart/mixed; boundary="===============8815023257080164001=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH freescale-fslc] MLK-23251-01: net: stmac: tsn: stmmactc_setup_mqprio() can be static
Date: Tue, 19 Jan 2021 15:07:38 +0800
Message-ID: <20210119070738.GA49408@38ce28ae95f1>
In-Reply-To: <202101191550.31dZbeta-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8815023257080164001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 44980ad6bb89 ("MLK-23251-01: net: stmac: tsn: add tc mqprio support")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 stmmac_main.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/ne=
t/ethernet/stmicro/stmmac/stmmac_main.c
index edd1e07c050abc6..14457cfab54c44a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4109,7 +4109,7 @@ static int stmmac_setup_tc_block_cb(enum tc_setup_typ=
e type, void *type_data,
 =

 static LIST_HEAD(stmmac_block_cb_list);
 =

-int stmmactc_setup_mqprio(struct net_device *ndev, void *type_data)
+static int stmmactc_setup_mqprio(struct net_device *ndev, void *type_data)
 {
 	struct tc_mqprio_qopt *mqprio =3D type_data;
 	u8 num_tc;
--===============8815023257080164001==--

