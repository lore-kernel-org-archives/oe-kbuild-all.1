Content-Type: multipart/mixed; boundary="===============2768082234782858086=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH linux-next] Revert "net: bcmgenet: bcmgenet_hfb_add_filter() can be static
Date: Sat, 30 May 2020 01:54:05 +0800
Message-ID: <20200529175405.GA69129@d90f8b999b53>
In-Reply-To: <202005300154.63FdkmJb%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2768082234782858086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 14da1510fedc ("Revert "net: bcmgenet: remove unused function in bcmg=
enet.c"")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 bcmgenet.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/e=
thernet/broadcom/genet/bcmgenet.c
index b37ef05c5083a..98e492e066dcb 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -2855,8 +2855,8 @@ static int bcmgenet_hfb_find_unused_filter(struct bcm=
genet_priv *priv)
  * bcmgenet_hfb_add_filter(priv, hfb_filter_ipv4_udp,
  *                         ARRAY_SIZE(hfb_filter_ipv4_udp), 0);
  */
-int bcmgenet_hfb_add_filter(struct bcmgenet_priv *priv, u32 *f_data,
-			    u32 f_length, u32 rx_queue)
+static int bcmgenet_hfb_add_filter(struct bcmgenet_priv *priv, u32 *f_data,
+				   u32 f_length, u32 rx_queue)
 {
 	int f_index;
 	u32 i;
--===============2768082234782858086==--

