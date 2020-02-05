Content-Type: multipart/mixed; boundary="===============2002705372973539527=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [dax:xarray-pagecache 38/41] mm/readahead.c:419:20: error: 'PMD_SHIFT' undeclared; did you mean 'PUD_SHIFT'?
Date: Thu, 06 Feb 2020 07:36:25 +0800
Message-ID: <202002060716.rOeQ1tuR%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2002705372973539527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/users/willy/linux-dax.git xarray-pagecache
head:   e596140ee1c83600d0daf4ea9cce1d6ad7791378
commit: d6b5def8fda4d982694adb91547f0ee80754ac2b [38/41] mm: Add large page=
 readahead
config: arm-allnoconfig (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout d6b5def8fda4d982694adb91547f0ee80754ac2b
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Darm =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   mm/readahead.c: In function 'page_cache_readahead_order':
>> mm/readahead.c:419:20: error: 'PMD_SHIFT' undeclared (first use in this =
function); did you mean 'PUD_SHIFT'?
    #define PMD_ORDER (PMD_SHIFT - PAGE_SHIFT)
                       ^
   mm/readahead.c:435:14: note: in expansion of macro 'PMD_ORDER'
     if (order < PMD_ORDER) {
                 ^~~~~~~~~
   mm/readahead.c:419:20: note: each undeclared identifier is reported only=
 once for each function it appears in
    #define PMD_ORDER (PMD_SHIFT - PAGE_SHIFT)
                       ^
   mm/readahead.c:435:14: note: in expansion of macro 'PMD_ORDER'
     if (order < PMD_ORDER) {
                 ^~~~~~~~~

vim +419 mm/readahead.c

   418	=

 > 419	#define PMD_ORDER	(PMD_SHIFT - PAGE_SHIFT)
   420	=


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============2002705372973539527==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
itt1JB00TmdBY9w7TU72S4LGP4s7Uv8AWAAA
--===============2002705372973539527==--

