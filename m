Content-Type: multipart/mixed; boundary="===============8213711144108366652=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] iova: __init_iova_domain can be static
Date: Tue, 11 May 2021 01:50:26 +0800
Message-ID: <20210510175026.GA46391@b09f4beb6d7e>
In-Reply-To: <1620656249-68890-10-git-send-email-john.garry@huawei.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8213711144108366652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

drivers/iommu/iova.c:50:1: warning: symbol '__init_iova_domain' was not dec=
lared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 iova.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 273a689006c36..ae4901073a98a 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -46,7 +46,7 @@ static struct iova *to_iova(struct rb_node *node)
 	return rb_entry(node, struct iova, node);
 }
 =

-void
+static void
 __init_iova_domain(struct iova_domain *iovad, unsigned long granule,
 	unsigned long start_pfn, unsigned long iova_len)
 {
--===============8213711144108366652==--

