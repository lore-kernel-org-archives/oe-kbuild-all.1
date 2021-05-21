Content-Type: multipart/mixed; boundary="===============0003252052224852740=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [wagi-linux-stable-rt:v4.19-rt 43/48] include/linux/blk-cgroup.h: linux/kthread.h is included more than once.
Date: Fri, 21 May 2021 15:29:32 +0800
Message-ID: <20210521072932.GZ2687475@shao2-debian>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0003252052224852740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wagi/linux-stable-r=
t.git v4.19-rt
head:   bd81dbe40b89ec503144c58b7ea8cf8d5ff67f83
commit: 827b6f6962daf2e13170c0185c0f7b51cf74a0ed [43/48] workqueue: rework
:::::: branch date: 1 year, 7 months ago
:::::: commit date: 1 year, 8 months ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> include/linux/blk-cgroup.h: linux/kthread.h is included more than once.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0003252052224852740==--

