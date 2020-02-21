Content-Type: multipart/mixed; boundary="===============5863065371760117842=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH weiny2] fs/xfs: xfs_inode_enable_dax can be static
Date: Fri, 21 Feb 2020 15:00:54 +0800
Message-ID: <20200221070053.GA44977@e50d7db646c3>
In-Reply-To: <202002211443.zlpClUbx%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5863065371760117842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: ad101fe0aaae ("fs/xfs: Remove xfs_diflags_to_linux()")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 xfs_iops.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index c74a48f810f38..c63cf0b73b752 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1259,7 +1259,7 @@ xfs_inode_supports_dax(
 	return xfs_inode_buftarg(ip)->bt_daxdev !=3D NULL;
 }
 =

-bool
+static bool
 xfs_inode_enable_dax(
 	struct xfs_inode *ip)
 {
--===============5863065371760117842==--

