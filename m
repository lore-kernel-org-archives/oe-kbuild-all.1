Content-Type: multipart/mixed; boundary="===============7765110086517575062=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [djwong-xfs:repair-quota 41/42] fs/xfs/scrub/dir_repair.c:448:1: sparse: sparse: symbol 'xrep_dir_reset_fork' was not declared. Should it be static?
Date: Sat, 29 Feb 2020 18:11:41 +0800
Message-ID: <202002291805.WYRNSaTJ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7765110086517575062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t repair-quota
head:   7c012203cb168efe69d992ce8f58574c6aceeb3d
commit: 8f3baae88a748903f3b767a8ed3e3ae1b37b8b21 [41/42] xfs: online repair=
 of directories
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        git checkout 8f3baae88a748903f3b767a8ed3e3ae1b37b8b21
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> fs/xfs/scrub/dir_repair.c:448:1: sparse: sparse: symbol 'xrep_dir_reset_=
fork' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7765110086517575062==--

