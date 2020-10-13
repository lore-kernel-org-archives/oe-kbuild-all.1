Content-Type: multipart/mixed; boundary="===============6752408787797288789=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] IPv6: sr: seg6_strict_lookup_nexthop() can be static
Date: Wed, 14 Oct 2020 00:11:53 +0800
Message-ID: <20201013161153.GA54884@b456307fa776>
In-Reply-To: <20201013120151.9777-1-rejithomas@juniper.net>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6752408787797288789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kernel test robot <lkp@intel.com>
---
 seg6_local.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index 1a669f12d56c9d..e949d24036c2cd 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -219,8 +219,8 @@ int seg6_lookup_nexthop(struct sk_buff *skb,
 	return seg6_lookup_any_nexthop(skb, nhaddr, 0, tbl_id, false);
 }
 =

-int seg6_strict_lookup_nexthop(struct sk_buff *skb,
-			       struct in6_addr *nhaddr, int oif, u32 tbl_id)
+static int seg6_strict_lookup_nexthop(struct sk_buff *skb,
+				      struct in6_addr *nhaddr, int oif, u32 tbl_id)
 {
 	return seg6_lookup_any_nexthop(skb, nhaddr, oif, tbl_id, false);
 }
--===============6752408787797288789==--

