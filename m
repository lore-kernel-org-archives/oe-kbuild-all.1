Content-Type: multipart/mixed; boundary="===============1355538942783980233=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH freescale-fslc] net: dsa: dsa_link_touch() can be static
Date: Fri, 22 Jan 2021 13:50:18 +0800
Message-ID: <20210122055018.GA105187@2ecc8ffbc80c>
In-Reply-To: <202101221355.yoGRJO0f-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1355538942783980233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 27f0edf01bae ("net: dsa: list DSA links in the fabric")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 dsa2.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/dsa/dsa2.c b/net/dsa/dsa2.c
index 2cee876ce2f316f..e35142c142ea5f2 100644
--- a/net/dsa/dsa2.c
+++ b/net/dsa/dsa2.c
@@ -124,7 +124,7 @@ static struct dsa_port *dsa_tree_find_port_by_node(stru=
ct dsa_switch_tree *dst,
 	return NULL;
 }
 =

-struct dsa_link *dsa_link_touch(struct dsa_port *dp, struct dsa_port *link=
_dp)
+static struct dsa_link *dsa_link_touch(struct dsa_port *dp, struct dsa_por=
t *link_dp)
 {
 	struct dsa_switch *ds =3D dp->ds;
 	struct dsa_switch_tree *dst;
--===============1355538942783980233==--

