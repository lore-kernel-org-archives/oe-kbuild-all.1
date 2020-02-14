Content-Type: multipart/mixed; boundary="===============5312270904293053505=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] vfs: keep inodes with page cache off the inode shrinker LRU
Date: Sat, 15 Feb 2020 05:30:41 +0800
Message-ID: <202002150553.KwcmFhJ9%lkp@intel.com>
In-Reply-To: <20200211175507.178100-1-hannes@cmpxchg.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5312270904293053505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Johannes,

I love your patch! Perhaps something to improve:

[auto build test WARNING on vfs/for-next]
[also build test WARNING on linux/master linus/master v5.6-rc1 next-2020021=
4]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Johannes-Weiner/vfs-keep-i=
nodes-with-page-cache-off-the-inode-shrinker-LRU/20200214-083756
base:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git for-ne=
xt

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


coccinelle warnings: (new ones prefixed by >>)

>> mm/truncate.c:41:9-10: WARNING: return of 0/1 in function '__clear_shado=
w_entry' with return type bool

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5312270904293053505==--

