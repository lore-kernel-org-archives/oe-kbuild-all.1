Content-Type: multipart/mixed; boundary="===============6223431858193213006=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v5 4/6] arch/x86/kvm: Refactor L1D flushing
Date: Tue, 05 May 2020 21:29:04 +0800
Message-ID: <202005052105.LDHP5Zeq%lkp@intel.com>
In-Reply-To: <20200504041343.9651-5-sblbir@amazon.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6223431858193213006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Balbir,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tip/auto-latest]
[also build test WARNING on linus/master v5.7-rc4 next-20200505]
[cannot apply to kvm/linux-next tip/x86/core]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Balbir-Singh/Optionally-fl=
ush-L1D-on-context-switch/20200505-044116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 9a31ac1=
743a00b816d5393acf61ce16713d319a1

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> arch/x86/kernel/l1d_flush.c:7:8: warning: Local variable 'l1d_flush_page=
s' shadows outer variable [shadowVariable]
    void *l1d_flush_pages =3D NULL;
          ^
   arch/x86/kernel/l1d_flush.c:83:14: note: Shadowed declaration
   static void *l1d_flush_pages;
                ^
   arch/x86/kernel/l1d_flush.c:7:8: note: Shadow variable
    void *l1d_flush_pages =3D NULL;
          ^

vim +/l1d_flush_pages +7 arch/x86/kernel/l1d_flush.c

5228007f200e15 Balbir Singh 2020-05-04   3  =

604f3d173bf63d Balbir Singh 2020-05-04   4  static void *l1d_flush_alloc_pa=
ges(void)
5228007f200e15 Balbir Singh 2020-05-04   5  {
5228007f200e15 Balbir Singh 2020-05-04   6  	struct page *page;
5228007f200e15 Balbir Singh 2020-05-04  @7  	void *l1d_flush_pages =3D NULL;
5228007f200e15 Balbir Singh 2020-05-04   8  	int i;
5228007f200e15 Balbir Singh 2020-05-04   9  =

5228007f200e15 Balbir Singh 2020-05-04  10  	/*
5228007f200e15 Balbir Singh 2020-05-04  11  	 * This allocation for l1d_flu=
sh_pages is not tied to a VM/task's
5228007f200e15 Balbir Singh 2020-05-04  12  	 * lifetime and so should not =
be charged to a memcg.
5228007f200e15 Balbir Singh 2020-05-04  13  	 */
5228007f200e15 Balbir Singh 2020-05-04  14  	page =3D alloc_pages(GFP_KERNE=
L, L1D_CACHE_ORDER);
5228007f200e15 Balbir Singh 2020-05-04  15  	if (!page)
5228007f200e15 Balbir Singh 2020-05-04  16  		return NULL;
5228007f200e15 Balbir Singh 2020-05-04  17  	l1d_flush_pages =3D page_addre=
ss(page);
5228007f200e15 Balbir Singh 2020-05-04  18  =

5228007f200e15 Balbir Singh 2020-05-04  19  	/*
5228007f200e15 Balbir Singh 2020-05-04  20  	 * Initialize each page with a=
 different pattern in
5228007f200e15 Balbir Singh 2020-05-04  21  	 * order to protect against KS=
M in the nested
5228007f200e15 Balbir Singh 2020-05-04  22  	 * virtualization case.
5228007f200e15 Balbir Singh 2020-05-04  23  	 */
5228007f200e15 Balbir Singh 2020-05-04  24  	for (i =3D 0; i < 1u << L1D_CA=
CHE_ORDER; ++i) {
5228007f200e15 Balbir Singh 2020-05-04  25  		memset(l1d_flush_pages + i * =
PAGE_SIZE, i + 1,
5228007f200e15 Balbir Singh 2020-05-04  26  				PAGE_SIZE);
5228007f200e15 Balbir Singh 2020-05-04  27  	}
5228007f200e15 Balbir Singh 2020-05-04  28  	return l1d_flush_pages;
5228007f200e15 Balbir Singh 2020-05-04  29  }
5228007f200e15 Balbir Singh 2020-05-04  30  =


:::::: The code@line 7 was first introduced by commit
:::::: 5228007f200e157bfc7a4add32def7c7f32c0550 arch/x86/kvm: Refactor l1d =
flush lifecycle management

:::::: TO: Balbir Singh <sblbir@amazon.com>
:::::: CC: 0day robot <lkp@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6223431858193213006==--

