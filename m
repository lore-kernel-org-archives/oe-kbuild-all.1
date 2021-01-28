Content-Type: multipart/mixed; boundary="===============4345267090350714140=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH freescale-fslc] staging: dpaa2-evb: evb_port_get_stats() can be static
Date: Thu, 28 Jan 2021 17:01:02 +0800
Message-ID: <20210128090102.GA48214@be2581ec6a45>
In-Reply-To: <202101281723.XmHxyCyO-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4345267090350714140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 evb.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fsl-dpaa2/evb/evb.c b/drivers/staging/fsl-dpaa=
2/evb/evb.c
index cc98d060d7e1b..f87c4d7cb288b 100644
--- a/drivers/staging/fsl-dpaa2/evb/evb.c
+++ b/drivers/staging/fsl-dpaa2/evb/evb.c
@@ -761,8 +761,8 @@ static int evb_dellink(struct net_device *netdev,
 	return 0;
 }
 =

-void evb_port_get_stats(struct net_device *netdev,
-			struct rtnl_link_stats64 *storage)
+static void evb_port_get_stats(struct net_device *netdev,
+			       struct rtnl_link_stats64 *storage)
 {
 	struct evb_port_priv	*port_priv =3D netdev_priv(netdev);
 	u64			tmp;
--===============4345267090350714140==--

