Content-Type: multipart/mixed; boundary="===============6691267226483662483=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [dax:xarray-pagecache 38/43] mm/readahead.c:425:20: error: 'PMD_SHIFT' undeclared; did you mean 'PUD_SHIFT'?
Date: Thu, 13 Feb 2020 07:52:40 +0800
Message-ID: <202002130734.RrOy3HnQ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6691267226483662483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/users/willy/linux-dax.git xarray-pagecache
head:   06d67edf04da6b17ceb92617ecb74564646c62db
commit: ad82a97ba00288669b45695129dc986d18b05711 [38/43] mm: Add large page=
 readahead
config: h8300-h8300h-sim_defconfig (attached as .config)
compiler: h8300-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout ad82a97ba00288669b45695129dc986d18b05711
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Dh8300 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   mm/readahead.c: In function 'page_cache_readahead_order':
>> mm/readahead.c:425:20: error: 'PMD_SHIFT' undeclared (first use in this =
function); did you mean 'PUD_SHIFT'?
    #define PMD_ORDER (PMD_SHIFT - PAGE_SHIFT)
                       ^
   mm/readahead.c:446:14: note: in expansion of macro 'PMD_ORDER'
     if (order < PMD_ORDER) {
                 ^~~~~~~~~
   mm/readahead.c:425:20: note: each undeclared identifier is reported only=
 once for each function it appears in
    #define PMD_ORDER (PMD_SHIFT - PAGE_SHIFT)
                       ^
   mm/readahead.c:446:14: note: in expansion of macro 'PMD_ORDER'
     if (order < PMD_ORDER) {
                 ^~~~~~~~~

vim +425 mm/readahead.c

   424	=

 > 425	#define PMD_ORDER	(PMD_SHIFT - PAGE_SHIFT)
   426	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6691267226483662483==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6691267226483662483==--

