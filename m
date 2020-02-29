Content-Type: multipart/mixed; boundary="===============2685286960488092092=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH djwong-xfs] xfs: xrep_dir_reset_fork can be static
Date: Sat, 29 Feb 2020 18:11:42 +0800
Message-ID: <20200229101142.GA5007@75eb7c303932>
In-Reply-To: <202002291805.WYRNSaTJ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2685286960488092092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 8f3baae88a74 ("xfs: online repair of directories")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 dir_repair.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/scrub/dir_repair.c b/fs/xfs/scrub/dir_repair.c
index 1fdc99fa6c812..348a356198100 100644
--- a/fs/xfs/scrub/dir_repair.c
+++ b/fs/xfs/scrub/dir_repair.c
@@ -444,7 +444,7 @@ xrep_dir_reset_nonlocal(
 }
 =

 /* Free all the directory blocks and delete the fork. */
-int
+static int
 xrep_dir_reset_fork(
 	struct xrep_dir		*rd)
 {
--===============2685286960488092092==--

