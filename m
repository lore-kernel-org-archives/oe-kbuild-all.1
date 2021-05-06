Content-Type: multipart/mixed; boundary="===============1971829678284343594=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] xfs: xfs_dialloc_ag can be static
Date: Thu, 06 May 2021 19:26:42 +0800
Message-ID: <20210506112642.GA60902@79c811f72acc>
In-Reply-To: <20210506072054.271157-20-david@fromorbit.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1971829678284343594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

fs/xfs/libxfs/xfs_ialloc.c:1432:1: warning: symbol 'xfs_dialloc_ag' was not=
 declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 xfs_ialloc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/libxfs/xfs_ialloc.c b/fs/xfs/libxfs/xfs_ialloc.c
index 2c0ef2dd46d91..1c3fb08186743 100644
--- a/fs/xfs/libxfs/xfs_ialloc.c
+++ b/fs/xfs/libxfs/xfs_ialloc.c
@@ -1428,7 +1428,7 @@ xfs_dialloc_ag_update_inobt(
  * The caller selected an AG for us, and made sure that free inodes are
  * available.
  */
-int
+static int
 xfs_dialloc_ag(
 	struct xfs_trans	*tp,
 	struct xfs_buf		*agbp,
--===============1971829678284343594==--

