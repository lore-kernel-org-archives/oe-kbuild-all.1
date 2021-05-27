Content-Type: multipart/mixed; boundary="===============9006136019725311219=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] xfs: xfs_allocfree_extent_res can be static
Date: Thu, 27 May 2021 15:03:23 +0800
Message-ID: <20210527070323.GA117376@de03bec1b31d>
In-Reply-To: <20210527045202.1155628-5-david@fromorbit.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9006136019725311219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

fs/xfs/libxfs/xfs_trans_resv.c:91:1: warning: symbol 'xfs_allocfree_extent_=
res' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 xfs_trans_resv.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/libxfs/xfs_trans_resv.c b/fs/xfs/libxfs/xfs_trans_resv.c
index 6363cacb790fe..1a5ee1da34a67 100644
--- a/fs/xfs/libxfs/xfs_trans_resv.c
+++ b/fs/xfs/libxfs/xfs_trans_resv.c
@@ -87,7 +87,7 @@ xfs_allocfree_log_count(
  * the agfl header: 1 sector
  * the allocation btrees: 2 trees * (max depth - 1) * block size
  */
-uint
+static uint
 xfs_allocfree_extent_res(
 	struct xfs_mount *mp)
 {
--===============9006136019725311219==--

