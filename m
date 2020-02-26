Content-Type: multipart/mixed; boundary="===============7142774504473078639=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [lkp] [+571 bytes kernel size regression] [i386-tinyconfig] [f60e5c1fcb] fs/dcache: Reclaim excessive negative dentries in directories
Date: Thu, 27 Feb 2020 04:16:31 +0800
Message-ID: <20200226201631.GA55248@e50d7db646c3>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7142774504473078639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


FYI, we noticed a +571 bytes kernel size regression due to commit:

commit: f60e5c1fcb0d73a43c84defd6f9034ab3d0790dd (fs/dcache: Reclaim excess=
ive negative dentries in directories)
url: https://github.com/0day-ci/linux/commits/Waiman-Long/fs-dcache-Limit-o=
f-negative-dentries/20200227-033600

Details as below (size data is obtained by `nm --size-sort vmlinux`):

f8103bf8: fs/dcache: Add sysctl parameter dentry-dir-max
f60e5c1f: fs/dcache: Reclaim excessive negative dentries in directories

+------------------------------+----------+----------+-------+
|            symbol            | f8103bf8 | f60e5c1f | delta |
+------------------------------+----------+----------+-------+
| nm.t.negative_reclaim_workfn | 0        | 390      | 390   |
| bzImage                      | 440368   | 440720   | 352   |
| nm.T.dput                    | 63       | 224      | 161   |
| nm.d.negative_reclaim_work   | 0        | 16       | 16    |
| nm.b.negative_reclaim_list   | 0        | 4        | 4     |
+------------------------------+----------+----------+-------+



Thanks,
Kbuild test robot


--===============7142774504473078639==--

