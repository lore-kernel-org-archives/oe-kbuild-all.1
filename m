Content-Type: multipart/mixed; boundary="===============3159364544423587973=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH djwong-xfs] xfs: xfs_fsmap_from_internal can be static
Date: Fri, 02 Oct 2020 17:12:49 +0800
Message-ID: <20201002091249.GA8719@02a89601a444>
In-Reply-To: <202010021713.AA889qRH-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3159364544423587973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kernel test robot <lkp@intel.com>
---
 xfs_fsmap.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_fsmap.c b/fs/xfs/xfs_fsmap.c
index 3f2666c62a605d..f9c06aa9c7760b 100644
--- a/fs/xfs/xfs_fsmap.c
+++ b/fs/xfs/xfs_fsmap.c
@@ -26,7 +26,7 @@
 #include "xfs_rtalloc.h"
 =

 /* Convert an xfs_fsmap to an fsmap. */
-void
+static void
 xfs_fsmap_from_internal(
 	struct fsmap		*dest,
 	struct xfs_fsmap	*src)
--===============3159364544423587973==--

