Content-Type: multipart/mixed; boundary="===============1321130059084678198=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [lkp] [+2050 bytes kernel size regression] [i386-tinyconfig] [04b63697eb] vfs: introduce new file extent swap ioctl
Date: Thu, 21 May 2020 20:32:59 +0800
Message-ID: <5ec674fb.RBP1IbyYPtfvXNpG%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1321130059084678198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


FYI, we noticed a +2050 bytes kernel size regression due to commit:

commit: 04b63697eb47c544e55c73d906148160ebff2042 (vfs: introduce new file e=
xtent swap ioctl)
https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git repair=
-metadata-atomically

Details as below (size data is obtained by `nm --size-sort vmlinux`):

650947bb: xfs: fix xfs_reflink_remap_prep calling conventions
04b63697: vfs: introduce new file extent swap ioctl

+------------------------------------------+----------+----------+-------+
|                  symbol                  | 650947bb | 04b63697 | delta |
+------------------------------------------+----------+----------+-------+
| bzImage                                  | 439648   | 440736   | 1088  |
| nm.T.generic_swap_file_range_checks      | 0        | 739      | 739   |
| nm.T.generic_swap_file_range_prep        | 0        | 572      | 572   |
| nm.T.do_swap_file_range                  | 0        | 190      | 190   |
| nm.T.generic_swap_file_range_check_fresh | 0        | 156      | 156   |
| nm.t.ioctl_file_swap_range               | 0        | 139      | 139   |
| nm.t.swap_range_verify_area              | 0        | 93       | 93    |
| nm.T.vfs_swap_file_range                 | 0        | 44       | 44    |
| nm.T.ksys_ioctl                          | 1427     | 1457     | 30    |
| nm.r.bad_file_ops                        | 128      | 132      | 4     |
| nm.R.def_blk_fops                        | 128      | 132      | 4     |
| nm.R.def_chr_fops                        | 128      | 132      | 4     |
| nm.r.empty_dir_operations                | 128      | 132      | 4     |
| nm.r.empty_fops                          | 128      | 132      | 4     |
| nm.R.fscontext_fops                      | 128      | 132      | 4     |
| nm.r.full_fops                           | 128      | 132      | 4     |
| nm.R.generic_ro_fops                     | 128      | 132      | 4     |
| nm.r.memory_fops                         | 128      | 132      | 4     |
| nm.r.misc_fops                           | 128      | 132      | 4     |
| nm.r.no_open_fops                        | 128      | 132      | 4     |
| nm.r.ns_file_operations                  | 128      | 132      | 4     |
| nm.r.null_fops                           | 128      | 132      | 4     |
| nm.r.perf_fops                           | 128      | 132      | 4     |
| nm.R.pidfd_fops                          | 128      | 132      | 4     |
| nm.R.pipefifo_fops                       | 128      | 132      | 4     |
| nm.R.ramfs_file_operations               | 128      | 132      | 4     |
| nm.R.random_fops                         | 128      | 132      | 4     |
| nm.R.simple_dir_operations               | 128      | 132      | 4     |
| nm.R.urandom_fops                        | 128      | 132      | 4     |
| nm.r.zero_fops                           | 128      | 132      | 4     |
| nm.T.vfs_fadvise                         | 48       | 51       | 3     |
+------------------------------------------+----------+----------+-------+



Thanks,
Kbuild test robot

--===============1321130059084678198==--

