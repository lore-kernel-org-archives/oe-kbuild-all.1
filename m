Content-Type: multipart/mixed; boundary="===============1515900364618860949=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [weiny2:dax-file-state-change-v4 13/14] fs/xfs/xfs_iops.c:1263:1: sparse: sparse: symbol 'xfs_inode_enable_dax' was not declared. Should it be static?
Date: Fri, 21 Feb 2020 15:00:53 +0800
Message-ID: <202002211443.zlpClUbx%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1515900364618860949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/weiny2/linux-kernel.git dax-file-state-change-v4
head:   0ec62c38a0bb1660a270f7e17e41010b88659a4b
commit: ad101fe0aaae6dc3995039dd94a5dbe6aa80702a [13/14] fs/xfs: Remove xfs=
_diflags_to_linux()
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        git checkout ad101fe0aaae6dc3995039dd94a5dbe6aa80702a
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> fs/xfs/xfs_iops.c:1263:1: sparse: sparse: symbol 'xfs_inode_enable_dax' =
was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1515900364618860949==--

