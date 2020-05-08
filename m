Content-Type: multipart/mixed; boundary="===============5855927215881844622=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH V3 15/15] kmap: Consolidate kmap_prot definitions
Date: Fri, 08 May 2020 23:35:22 +0800
Message-ID: <202005082311.qj5KIdrm%lkp@intel.com>
In-Reply-To: <20200507150004.1423069-16-ira.weiny@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5855927215881844622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on sparc/master linus/master v5.7-rc4]
[cannot apply to next-20200508]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/ira-weiny-intel-com/Remove=
-duplicated-kmap-code/20200508-044226
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git n=
ext
config: sparc-randconfig-r001-20200508 (attached as .config)
compiler: sparc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Dsparc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/highmem.h:37,
                    from include/linux/pagemap.h:11,
                    from drivers/char/virtio_console.c:15:
   include/linux/highmem.h: In function 'clear_user_highpage':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:222:15: note: in expansion of macro 'kmap_atomic'
     222 |  void *addr =3D kmap_atomic(page);
         |               ^~~~~~~~~~~
   include/linux/highmem.h: In function 'clear_highpage':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:275:16: note: in expansion of macro 'kmap_atomic'
     275 |  void *kaddr =3D kmap_atomic(page);
         |                ^~~~~~~~~~~
   include/linux/highmem.h: In function 'zero_user_segments':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:284:16: note: in expansion of macro 'kmap_atomic'
     284 |  void *kaddr =3D kmap_atomic(page);
         |                ^~~~~~~~~~~
   include/linux/highmem.h: In function 'copy_user_highpage':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:317:10: note: in expansion of macro 'kmap_atomic'
     317 |  vfrom =3D kmap_atomic(from);
         |          ^~~~~~~~~~~
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:318:8: note: in expansion of macro 'kmap_atomic'
     318 |  vto =3D kmap_atomic(to);
         |        ^~~~~~~~~~~
   include/linux/highmem.h: In function 'copy_highpage':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:332:10: note: in expansion of macro 'kmap_atomic'
     332 |  vfrom =3D kmap_atomic(from);
         |          ^~~~~~~~~~~
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:333:8: note: in expansion of macro 'kmap_atomic'
     333 |  vto =3D kmap_atomic(to);
         |        ^~~~~~~~~~~
   drivers/char/virtio_console.c: In function 'pipe_to_sg':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
>> drivers/char/virtio_console.c:895:9: note: in expansion of macro 'kmap_a=
tomic'
     895 |   src =3D kmap_atomic(buf->page);
         |         ^~~~~~~~~~~
--
   In file included from include/linux/highmem.h:37,
                    from include/linux/pagemap.h:11,
                    from include/linux/blkdev.h:16,
                    from include/linux/dm-bufio.h:12,
                    from drivers/md/dm-verity.h:14,
                    from drivers/md/dm-verity-target.c:16:
   include/linux/highmem.h: In function 'clear_user_highpage':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:222:15: note: in expansion of macro 'kmap_atomic'
     222 |  void *addr =3D kmap_atomic(page);
         |               ^~~~~~~~~~~
   include/linux/highmem.h: In function 'clear_highpage':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:275:16: note: in expansion of macro 'kmap_atomic'
     275 |  void *kaddr =3D kmap_atomic(page);
         |                ^~~~~~~~~~~
   include/linux/highmem.h: In function 'zero_user_segments':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:284:16: note: in expansion of macro 'kmap_atomic'
     284 |  void *kaddr =3D kmap_atomic(page);
         |                ^~~~~~~~~~~
   include/linux/highmem.h: In function 'copy_user_highpage':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:317:10: note: in expansion of macro 'kmap_atomic'
     317 |  vfrom =3D kmap_atomic(from);
         |          ^~~~~~~~~~~
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:318:8: note: in expansion of macro 'kmap_atomic'
     318 |  vto =3D kmap_atomic(to);
         |        ^~~~~~~~~~~
   include/linux/highmem.h: In function 'copy_highpage':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:332:10: note: in expansion of macro 'kmap_atomic'
     332 |  vfrom =3D kmap_atomic(from);
         |          ^~~~~~~~~~~
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:333:8: note: in expansion of macro 'kmap_atomic'
     333 |  vto =3D kmap_atomic(to);
         |        ^~~~~~~~~~~
   include/linux/bio.h: In function 'bvec_kmap_irq':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/bio.h:528:25: note: in expansion of macro 'kmap_atomic'
     528 |  addr =3D (unsigned long) kmap_atomic(bvec->bv_page);
         |                         ^~~~~~~~~~~
   drivers/md/dm-verity-target.c: In function 'verity_for_bv_block':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
>> drivers/md/dm-verity-target.c:426:10: note: in expansion of macro 'kmap_=
atomic'
     426 |   page =3D kmap_atomic(bv.bv_page);
         |          ^~~~~~~~~~~
--
   In file included from include/linux/highmem.h:37,
                    from include/linux/bio.h:8,
                    from drivers/md/dm-crypt.c:16:
   include/linux/highmem.h: In function 'clear_user_highpage':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:222:15: note: in expansion of macro 'kmap_atomic'
     222 |  void *addr =3D kmap_atomic(page);
         |               ^~~~~~~~~~~
   include/linux/highmem.h: In function 'clear_highpage':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:275:16: note: in expansion of macro 'kmap_atomic'
     275 |  void *kaddr =3D kmap_atomic(page);
         |                ^~~~~~~~~~~
   include/linux/highmem.h: In function 'zero_user_segments':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:284:16: note: in expansion of macro 'kmap_atomic'
     284 |  void *kaddr =3D kmap_atomic(page);
         |                ^~~~~~~~~~~
   include/linux/highmem.h: In function 'copy_user_highpage':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:317:10: note: in expansion of macro 'kmap_atomic'
     317 |  vfrom =3D kmap_atomic(from);
         |          ^~~~~~~~~~~
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:318:8: note: in expansion of macro 'kmap_atomic'
     318 |  vto =3D kmap_atomic(to);
         |        ^~~~~~~~~~~
   include/linux/highmem.h: In function 'copy_highpage':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:332:10: note: in expansion of macro 'kmap_atomic'
     332 |  vfrom =3D kmap_atomic(from);
         |          ^~~~~~~~~~~
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/highmem.h:333:8: note: in expansion of macro 'kmap_atomic'
     333 |  vto =3D kmap_atomic(to);
         |        ^~~~~~~~~~~
   include/linux/bio.h: In function 'bvec_kmap_irq':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   include/linux/bio.h:528:25: note: in expansion of macro 'kmap_atomic'
     528 |  addr =3D (unsigned long) kmap_atomic(bvec->bv_page);
         |                         ^~~~~~~~~~~
   drivers/md/dm-crypt.c: In function 'crypt_iv_lmk_gen':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
>> drivers/md/dm-crypt.c:524:9: note: in expansion of macro 'kmap_atomic'
     524 |   src =3D kmap_atomic(sg_page(sg));
         |         ^~~~~~~~~~~
   drivers/md/dm-crypt.c: In function 'crypt_iv_lmk_post':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   drivers/md/dm-crypt.c:544:8: note: in expansion of macro 'kmap_atomic'
     544 |  dst =3D kmap_atomic(sg_page(sg));
         |        ^~~~~~~~~~~
   drivers/md/dm-crypt.c: In function 'crypt_iv_tcw_gen':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   drivers/md/dm-crypt.c:673:9: note: in expansion of macro 'kmap_atomic'
     673 |   src =3D kmap_atomic(sg_page(sg));
         |         ^~~~~~~~~~~
   drivers/md/dm-crypt.c: In function 'crypt_iv_tcw_post':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   drivers/md/dm-crypt.c:699:8: note: in expansion of macro 'kmap_atomic'
     699 |  dst =3D kmap_atomic(sg_page(sg));
         |        ^~~~~~~~~~~
   drivers/md/dm-crypt.c: In function 'crypt_iv_elephant':
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   drivers/md/dm-crypt.c:965:9: note: in expansion of macro 'kmap_atomic'
     965 |  data =3D kmap_atomic(sg_page(sg));
         |         ^~~~~~~~~~~
   arch/sparc/include/asm/highmem.h:33:68: error: expected ')' before ';' t=
oken
      33 | #define kmap_prot __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CAC=
HE);
         |                                                                 =
   ^
   include/linux/highmem.h:91:50: note: in expansion of macro 'kmap_prot'
      91 | #define kmap_atomic(page) kmap_atomic_prot(page, kmap_prot)
         |                                                  ^~~~~~~~~
   drivers/md/dm-crypt.c:971:11: note: in expansion of macro 'kmap_atomic'
     971 |   data2 =3D kmap_atomic(sg_page(sg2));
         |           ^~~~~~~~~~~
..

vim +/kmap_atomic +895 drivers/char/virtio_console.c

eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  863  =

eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  864  static int pipe_to_sg(stru=
ct pipe_inode_info *pipe, struct pipe_buffer *buf,
eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  865  			struct splice_desc *sd)
eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  866  {
eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  867  	struct sg_list *sgl =3D s=
d->u.data;
ec8fc870156b2b Masami Hiramatsu 2012-08-09  868  	unsigned int offset, len;
eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  869  =

8ca84a50e5b394 Masami Hiramatsu 2012-08-09  870  	if (sgl->n =3D=3D sgl->si=
ze)
eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  871  		return 0;
eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  872  =

eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  873  	/* Try lock this page */
ca76f5b6bdbdc5 Miklos Szeredi   2016-09-27  874  	if (pipe_buf_steal(pipe, =
buf) =3D=3D 0) {
eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  875  		/* Get reference and unl=
ock page for moving */
eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  876  		get_page(buf->page);
eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  877  		unlock_page(buf->page);
eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  878  =

eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  879  		len =3D min(buf->len, sd=
->len);
eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  880  		sg_set_page(&(sgl->sg[sg=
l->n]), buf->page, len, buf->offset);
ec8fc870156b2b Masami Hiramatsu 2012-08-09  881  	} else {
ec8fc870156b2b Masami Hiramatsu 2012-08-09  882  		/* Failback to copying a=
 page */
ec8fc870156b2b Masami Hiramatsu 2012-08-09  883  		struct page *page =3D al=
loc_page(GFP_KERNEL);
c9efe51165fa0a Al Viro          2014-02-02  884  		char *src;
ec8fc870156b2b Masami Hiramatsu 2012-08-09  885  =

ec8fc870156b2b Masami Hiramatsu 2012-08-09  886  		if (!page)
ec8fc870156b2b Masami Hiramatsu 2012-08-09  887  			return -ENOMEM;
ec8fc870156b2b Masami Hiramatsu 2012-08-09  888  =

ec8fc870156b2b Masami Hiramatsu 2012-08-09  889  		offset =3D sd->pos & ~PA=
GE_MASK;
ec8fc870156b2b Masami Hiramatsu 2012-08-09  890  =

ec8fc870156b2b Masami Hiramatsu 2012-08-09  891  		len =3D sd->len;
ec8fc870156b2b Masami Hiramatsu 2012-08-09  892  		if (len + offset > PAGE_=
SIZE)
ec8fc870156b2b Masami Hiramatsu 2012-08-09  893  			len =3D PAGE_SIZE - off=
set;
ec8fc870156b2b Masami Hiramatsu 2012-08-09  894  =

fbb32750a62df7 Al Viro          2014-02-02 @895  		src =3D kmap_atomic(buf-=
>page);
c9efe51165fa0a Al Viro          2014-02-02  896  		memcpy(page_address(page=
) + offset, src + buf->offset, len);
fbb32750a62df7 Al Viro          2014-02-02  897  		kunmap_atomic(src);
ec8fc870156b2b Masami Hiramatsu 2012-08-09  898  =

ec8fc870156b2b Masami Hiramatsu 2012-08-09  899  		sg_set_page(&(sgl->sg[sg=
l->n]), page, len, offset);
ec8fc870156b2b Masami Hiramatsu 2012-08-09  900  	}
eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  901  	sgl->n++;
eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  902  	sgl->len +=3D len;
eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  903  =

eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  904  	return len;
eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  905  }
eb5e89fc70bb3f Masami Hiramatsu 2012-08-09  906  =


:::::: The code at line 895 was first introduced by commit
:::::: fbb32750a62df75d1ffea547f3908b21c5496d9f pipe: kill ->map() and ->un=
map()

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5855927215881844622==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5855927215881844622==--

