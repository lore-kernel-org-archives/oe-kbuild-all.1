Content-Type: multipart/mixed; boundary="===============8544334123921893674=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [xfs-linux:xfs-5.8-merge 57/94] WARNING: __func__ should be used instead of gcc specific __FUNCTION__
Date: Mon, 18 May 2020 12:06:47 +0800
Message-ID: <20200518040647.GD24805@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8544334123921893674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git xfs-5.8-merge
head:   dc6a7f69e533f64cae2d01d7acf82075e65f543d
commit: 3ec6efa703cf65887e681d1f97d38a63261d907e [57/94] xfs: refactor log =
recovery icreate item dispatch for pass2 commit functions

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

scripts/checkpatch.pl 0001-xfs-refactor-log-recovery-icreate-item-dispatch-=
for-.patch
# many are suggestions rather than must-fix

WARNING: __func__ should be used instead of gcc specific __FUNCTION__
#119: fs/xfs/xfs_icreate_item.c:204:
+			 "%s: unsupported chunk length", __FUNCTION__);

WARNING: __func__ should be used instead of gcc specific __FUNCTION__
#127: fs/xfs/xfs_icreate_item.c:212:
+			 __FUNCTION__);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8544334123921893674==--

