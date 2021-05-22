Content-Type: multipart/mixed; boundary="===============8067590757305615022=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [hch-block:bvec-kmap 2/46] include/linux/bvec.h:189:9: error: implicit declaration of function 'kmap_local_page'; did you mean 'drain_local_pages'?
Date: Sun, 23 May 2021 03:27:02 +0800
Message-ID: <202105230355.1qaCH7eL-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8067590757305615022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/users/hch/block.git bvec-kmap
head:   dcf9fd7b54aa00cdd89251aebaa3cc713f035e26
commit: 6c6ba14b40bddff8b03d07039769120a6cf32036 [2/46] bvec: add a bvec_km=
ap_local helper
config: mips-rb532_defconfig (attached as .config)
compiler: mipsel-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hch-block git://git.infradead.org/users/hch/block.git
        git fetch --no-tags hch-block bvec-kmap
        git checkout 6c6ba14b40bddff8b03d07039769120a6cf32036
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/blk_types.h:10,
                    from include/linux/genhd.h:19,
                    from arch/mips/include/asm/mach-rc32434/rb.h:10,
                    from arch/mips/include/asm/mach-rc32434/irq.h:8,
                    from arch/mips/include/asm/irq.h:18,
                    from include/linux/irq.h:23,
                    from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:10,
                    from mm/mempool.c:15:
   include/linux/bvec.h: In function 'bvec_kmap_local':
>> include/linux/bvec.h:189:9: error: implicit declaration of function 'kma=
p_local_page'; did you mean 'drain_local_pages'? [-Werror=3Dimplicit-functi=
on-declaration]
     189 |  return kmap_local_page(bvec->bv_page) + bvec->bv_offset;
         |         ^~~~~~~~~~~~~~~
         |         drain_local_pages
>> include/linux/bvec.h:189:40: warning: returning 'unsigned int' from a fu=
nction with return type 'void *' makes pointer from integer without a cast =
[-Wint-conversion]
     189 |  return kmap_local_page(bvec->bv_page) + bvec->bv_offset;
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   In file included from include/linux/highmem.h:14,
                    from mm/mempool.c:15:
   include/linux/highmem-internal.h: At top level:
>> include/linux/highmem-internal.h:158:21: error: conflicting types for 'k=
map_local_page'
     158 | static inline void *kmap_local_page(struct page *page)
         |                     ^~~~~~~~~~~~~~~
   In file included from include/linux/blk_types.h:10,
                    from include/linux/genhd.h:19,
                    from arch/mips/include/asm/mach-rc32434/rb.h:10,
                    from arch/mips/include/asm/mach-rc32434/irq.h:8,
                    from arch/mips/include/asm/irq.h:18,
                    from include/linux/irq.h:23,
                    from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:10,
                    from mm/mempool.c:15:
   include/linux/bvec.h:189:9: note: previous implicit declaration of 'kmap=
_local_page' was here
     189 |  return kmap_local_page(bvec->bv_page) + bvec->bv_offset;
         |         ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/mips/include/asm/mach-rc32434/rb.h:10,
                    from arch/mips/include/asm/mach-rc32434/irq.h:8,
                    from arch/mips/include/asm/irq.h:18,
                    from include/linux/irq.h:23,
                    from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:10,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/writeback.h:13,
                    from mm/vmstat.c:26:
   include/linux/genhd.h: In function 'get_disk_ro':
>> include/linux/genhd.h:227:20: error: dereferencing pointer to incomplete=
 type 'struct block_device'
     227 |  return disk->part0->bd_read_only ||
         |                    ^~
--
   In file included from include/linux/blk_types.h:10,
                    from include/linux/genhd.h:19,
                    from arch/mips/include/asm/mach-rc32434/rb.h:10,
                    from arch/mips/include/asm/mach-rc32434/irq.h:8,
                    from arch/mips/include/asm/irq.h:18,
                    from include/linux/irq.h:23,
                    from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:10,
                    from mm/vmalloc.c:14:
   include/linux/bvec.h: In function 'bvec_kmap_local':
>> include/linux/bvec.h:189:9: error: implicit declaration of function 'kma=
p_local_page'; did you mean 'drain_local_pages'? [-Werror=3Dimplicit-functi=
on-declaration]
     189 |  return kmap_local_page(bvec->bv_page) + bvec->bv_offset;
         |         ^~~~~~~~~~~~~~~
         |         drain_local_pages
>> include/linux/bvec.h:189:40: warning: returning 'unsigned int' from a fu=
nction with return type 'void *' makes pointer from integer without a cast =
[-Wint-conversion]
     189 |  return kmap_local_page(bvec->bv_page) + bvec->bv_offset;
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   In file included from include/linux/highmem.h:14,
                    from mm/vmalloc.c:14:
   include/linux/highmem-internal.h: At top level:
>> include/linux/highmem-internal.h:158:21: error: conflicting types for 'k=
map_local_page'
     158 | static inline void *kmap_local_page(struct page *page)
         |                     ^~~~~~~~~~~~~~~
   In file included from include/linux/blk_types.h:10,
                    from include/linux/genhd.h:19,
                    from arch/mips/include/asm/mach-rc32434/rb.h:10,
                    from arch/mips/include/asm/mach-rc32434/irq.h:8,
                    from arch/mips/include/asm/irq.h:18,
                    from include/linux/irq.h:23,
                    from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:10,
                    from mm/vmalloc.c:14:
   include/linux/bvec.h:189:9: note: previous implicit declaration of 'kmap=
_local_page' was here
     189 |  return kmap_local_page(bvec->bv_page) + bvec->bv_offset;
         |         ^~~~~~~~~~~~~~~
   mm/vmalloc.c:1599:6: warning: no previous prototype for 'set_iounmap_non=
lazy' [-Wmissing-prototypes]
    1599 | void set_iounmap_nonlazy(void)
         |      ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/blk_types.h:10,
                    from include/linux/genhd.h:19,
                    from arch/mips/include/asm/mach-rc32434/rb.h:10,
                    from arch/mips/include/asm/mach-rc32434/irq.h:8,
                    from arch/mips/include/asm/irq.h:18,
                    from include/linux/irq.h:23,
                    from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:10,
                    from mm/page_alloc.c:20:
   include/linux/bvec.h: In function 'bvec_kmap_local':
>> include/linux/bvec.h:189:9: error: implicit declaration of function 'kma=
p_local_page'; did you mean 'drain_local_pages'? [-Werror=3Dimplicit-functi=
on-declaration]
     189 |  return kmap_local_page(bvec->bv_page) + bvec->bv_offset;
         |         ^~~~~~~~~~~~~~~
         |         drain_local_pages
>> include/linux/bvec.h:189:40: warning: returning 'unsigned int' from a fu=
nction with return type 'void *' makes pointer from integer without a cast =
[-Wint-conversion]
     189 |  return kmap_local_page(bvec->bv_page) + bvec->bv_offset;
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   In file included from include/linux/highmem.h:14,
                    from mm/page_alloc.c:20:
   include/linux/highmem-internal.h: At top level:
>> include/linux/highmem-internal.h:158:21: error: conflicting types for 'k=
map_local_page'
     158 | static inline void *kmap_local_page(struct page *page)
         |                     ^~~~~~~~~~~~~~~
   In file included from include/linux/blk_types.h:10,
                    from include/linux/genhd.h:19,
                    from arch/mips/include/asm/mach-rc32434/rb.h:10,
                    from arch/mips/include/asm/mach-rc32434/irq.h:8,
                    from arch/mips/include/asm/irq.h:18,
                    from include/linux/irq.h:23,
                    from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:10,
                    from mm/page_alloc.c:20:
   include/linux/bvec.h:189:9: note: previous implicit declaration of 'kmap=
_local_page' was here
     189 |  return kmap_local_page(bvec->bv_page) + bvec->bv_offset;
         |         ^~~~~~~~~~~~~~~
   mm/page_alloc.c:3651:15: warning: no previous prototype for 'should_fail=
_alloc_page' [-Wmissing-prototypes]
    3651 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned in=
t order)
         |               ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/blk_types.h:10,
                    from include/linux/genhd.h:19,
                    from arch/mips/include/asm/mach-rc32434/rb.h:10,
                    from arch/mips/include/asm/mach-rc32434/irq.h:8,
                    from arch/mips/include/asm/irq.h:18,
                    from include/linux/irq.h:23,
                    from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:10,
                    from include/linux/pagemap.h:11,
                    from include/linux/mempolicy.h:16,
                    from include/linux/migrate.h:6,
                    from mm/migrate.c:16:
   include/linux/bvec.h: In function 'bvec_kmap_local':
   include/linux/bvec.h:189:9: error: implicit declaration of function 'kma=
p_local_page'; did you mean 'dax_lock_page'? [-Werror=3Dimplicit-function-d=
eclaration]
     189 |  return kmap_local_page(bvec->bv_page) + bvec->bv_offset;
         |         ^~~~~~~~~~~~~~~
         |         dax_lock_page
>> include/linux/bvec.h:189:40: warning: returning 'unsigned int' from a fu=
nction with return type 'void *' makes pointer from integer without a cast =
[-Wint-conversion]
     189 |  return kmap_local_page(bvec->bv_page) + bvec->bv_offset;
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   In file included from include/linux/highmem.h:14,
                    from include/linux/pagemap.h:11,
                    from include/linux/mempolicy.h:16,
                    from include/linux/migrate.h:6,
                    from mm/migrate.c:16:
   include/linux/highmem-internal.h: At top level:
>> include/linux/highmem-internal.h:158:21: error: conflicting types for 'k=
map_local_page'
     158 | static inline void *kmap_local_page(struct page *page)
         |                     ^~~~~~~~~~~~~~~
   In file included from include/linux/blk_types.h:10,
                    from include/linux/genhd.h:19,
                    from arch/mips/include/asm/mach-rc32434/rb.h:10,
                    from arch/mips/include/asm/mach-rc32434/irq.h:8,
                    from arch/mips/include/asm/irq.h:18,
                    from include/linux/irq.h:23,
                    from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:10,
                    from include/linux/pagemap.h:11,
                    from include/linux/mempolicy.h:16,
                    from include/linux/migrate.h:6,
                    from mm/migrate.c:16:
   include/linux/bvec.h:189:9: note: previous implicit declaration of 'kmap=
_local_page' was here
     189 |  return kmap_local_page(bvec->bv_page) + bvec->bv_offset;
         |         ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/genhd.h:19,
                    from arch/mips/include/asm/mach-rc32434/rb.h:10,
                    from arch/mips/include/asm/mach-rc32434/irq.h:8,
                    from arch/mips/include/asm/irq.h:18,
                    from include/linux/irq.h:23,
                    from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:10,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/linux/if_ether.h:19,
                    from include/linux/etherdevice.h:20,
                    from net/devres.c:7:
>> include/linux/blk_types.h:236:19: error: field 'bi_iter' has incomplete =
type
     236 |  struct bvec_iter bi_iter;
         |                   ^~~~~~~
>> include/linux/blk_types.h:284:18: error: array type has incomplete eleme=
nt type 'struct bio_vec'
     284 |  struct bio_vec  bi_inline_vecs[];
         |                  ^~~~~~~~~~~~~~
--
   In file included from include/linux/genhd.h:19,
                    from arch/mips/include/asm/mach-rc32434/rb.h:10,
                    from arch/mips/include/asm/mach-rc32434/irq.h:8,
                    from arch/mips/include/asm/irq.h:18,
                    from include/linux/irq.h:23,
                    from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:10,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/linux/if_ether.h:19,
                    from include/uapi/linux/ethtool.h:19,
                    from include/linux/ethtool.h:18,
                    from net/socket.c:55:
>> include/linux/blk_types.h:236:19: error: field 'bi_iter' has incomplete =
type
     236 |  struct bvec_iter bi_iter;
         |                   ^~~~~~~
>> include/linux/blk_types.h:284:18: error: array type has incomplete eleme=
nt type 'struct bio_vec'
     284 |  struct bio_vec  bi_inline_vecs[];
         |                  ^~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:15,
                    from include/linux/list.h:9,
                    from include/linux/smp.h:12,
                    from arch/mips/include/asm/cpu-type.h:12,
                    from arch/mips/include/asm/timex.h:19,
                    from include/linux/timex.h:65,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from include/linux/ethtool.h:17,
                    from net/socket.c:55:
   include/linux/bio.h: In function 'bio_cur_bytes':
>> include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:18:21: note: in definition of macro '__typecheck'
      18 |  (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
         |                     ^
   include/linux/minmax.h:42:24: note: in expansion of macro '__safe_cmp'
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |                        ^~~~~~~~~~
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
      51 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   include/linux/bvec.h:66:2: note: in expansion of macro 'min'
      66 |  min((iter).bi_size,     \
         |  ^~~
   include/linux/bvec.h:87:18: note: in expansion of macro 'mp_bvec_iter_le=
n'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |                  ^~~~~~~~~~~~~~~~
   include/linux/bvec.h:97:13: note: in expansion of macro 'bvec_iter_len'
      97 |  .bv_len  =3D bvec_iter_len((bvec), (iter)), \
         |             ^~~~~~~~~~~~~
   include/linux/bio.h:34:2: note: in expansion of macro 'bvec_iter_bvec'
      34 |  bvec_iter_bvec((bio)->bi_io_vec, (iter))
         |  ^~~~~~~~~~~~~~
   include/linux/bio.h:45:25: note: in expansion of macro 'bio_iter_iovec'
      45 | #define bio_iovec(bio)  bio_iter_iovec((bio), (bio)->bi_iter)
         |                         ^~~~~~~~~~~~~~
   include/linux/bio.h:96:10: note: in expansion of macro 'bio_iovec'
      96 |   return bio_iovec(bio).bv_len;
         |          ^~~~~~~~~
>> include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:48: note: in definition of macro '__is_constex=
pr'
      26 |  (sizeof(int) =3D=3D sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (=
int *)8)))
         |                                                ^
   include/linux/minmax.h:32:25: note: in expansion of macro '__no_side_eff=
ects'
      32 |   (__typecheck(x, y) && __no_side_effects(x, y))
         |                         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:42:24: note: in expansion of macro '__safe_cmp'
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |                        ^~~~~~~~~~
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
      51 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   include/linux/bvec.h:66:2: note: in expansion of macro 'min'
      66 |  min((iter).bi_size,     \
         |  ^~~
   include/linux/bvec.h:87:18: note: in expansion of macro 'mp_bvec_iter_le=
n'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |                  ^~~~~~~~~~~~~~~~
   include/linux/bvec.h:97:13: note: in expansion of macro 'bvec_iter_len'
      97 |  .bv_len  =3D bvec_iter_len((bvec), (iter)), \
         |             ^~~~~~~~~~~~~
   include/linux/bio.h:34:2: note: in expansion of macro 'bvec_iter_bvec'
      34 |  bvec_iter_bvec((bio)->bi_io_vec, (iter))
         |  ^~~~~~~~~~~~~~
   include/linux/bio.h:45:25: note: in expansion of macro 'bio_iter_iovec'
      45 | #define bio_iovec(bio)  bio_iter_iovec((bio), (bio)->bi_iter)
         |                         ^~~~~~~~~~~~~~
   include/linux/bio.h:96:10: note: in expansion of macro 'bio_iovec'
      96 |   return bio_iovec(bio).bv_len;
         |          ^~~~~~~~~
>> include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:27: note: in definition of macro '__cmp'
      34 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                           ^
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
      51 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   include/linux/bvec.h:66:2: note: in expansion of macro 'min'
      66 |  min((iter).bi_size,     \
         |  ^~~
   include/linux/bvec.h:87:18: note: in expansion of macro 'mp_bvec_iter_le=
n'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |                  ^~~~~~~~~~~~~~~~
   include/linux/bvec.h:97:13: note: in expansion of macro 'bvec_iter_len'
      97 |  .bv_len  =3D bvec_iter_len((bvec), (iter)), \
         |             ^~~~~~~~~~~~~
   include/linux/bio.h:34:2: note: in expansion of macro 'bvec_iter_bvec'
      34 |  bvec_iter_bvec((bio)->bi_io_vec, (iter))
         |  ^~~~~~~~~~~~~~
   include/linux/bio.h:45:25: note: in expansion of macro 'bio_iter_iovec'
      45 | #define bio_iovec(bio)  bio_iter_iovec((bio), (bio)->bi_iter)
         |                         ^~~~~~~~~~~~~~
   include/linux/bio.h:96:10: note: in expansion of macro 'bio_iovec'
      96 |   return bio_iovec(bio).bv_len;
         |          ^~~~~~~~~
>> include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:40: note: in definition of macro '__cmp'
      34 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                                        ^
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
      51 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   include/linux/bvec.h:66:2: note: in expansion of macro 'min'
      66 |  min((iter).bi_size,     \
         |  ^~~
   include/linux/bvec.h:87:18: note: in expansion of macro 'mp_bvec_iter_le=
n'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |                  ^~~~~~~~~~~~~~~~
   include/linux/bvec.h:97:13: note: in expansion of macro 'bvec_iter_len'
      97 |  .bv_len  =3D bvec_iter_len((bvec), (iter)), \
         |             ^~~~~~~~~~~~~
   include/linux/bio.h:34:2: note: in expansion of macro 'bvec_iter_bvec'
      34 |  bvec_iter_bvec((bio)->bi_io_vec, (iter))
         |  ^~~~~~~~~~~~~~
   include/linux/bio.h:45:25: note: in expansion of macro 'bio_iter_iovec'
      45 | #define bio_iovec(bio)  bio_iter_iovec((bio), (bio)->bi_iter)
         |                         ^~~~~~~~~~~~~~
   include/linux/bio.h:96:10: note: in expansion of macro 'bio_iovec'
      96 |   return bio_iovec(bio).bv_len;
         |          ^~~~~~~~~
>> include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:37:10: note: in definition of macro '__cmp_once'
      37 |   typeof(x) unique_x =3D (x);  \
         |          ^
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
      51 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   include/linux/bvec.h:66:2: note: in expansion of macro 'min'
      66 |  min((iter).bi_size,     \
         |  ^~~
   include/linux/bvec.h:87:18: note: in expansion of macro 'mp_bvec_iter_le=
n'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |                  ^~~~~~~~~~~~~~~~
   include/linux/bvec.h:97:13: note: in expansion of macro 'bvec_iter_len'
      97 |  .bv_len  =3D bvec_iter_len((bvec), (iter)), \
         |             ^~~~~~~~~~~~~
   include/linux/bio.h:34:2: note: in expansion of macro 'bvec_iter_bvec'
      34 |  bvec_iter_bvec((bio)->bi_io_vec, (iter))
         |  ^~~~~~~~~~~~~~
   include/linux/bio.h:45:25: note: in expansion of macro 'bio_iter_iovec'
      45 | #define bio_iovec(bio)  bio_iter_iovec((bio), (bio)->bi_iter)
         |                         ^~~~~~~~~~~~~~
   include/linux/bio.h:96:10: note: in expansion of macro 'bio_iovec'
      96 |   return bio_iovec(bio).bv_len;
         |          ^~~~~~~~~
>> include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:37:25: note: in definition of macro '__cmp_once'
      37 |   typeof(x) unique_x =3D (x);  \
         |                         ^
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
      51 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   include/linux/bvec.h:66:2: note: in expansion of macro 'min'
      66 |  min((iter).bi_size,     \
         |  ^~~
   include/linux/bvec.h:87:18: note: in expansion of macro 'mp_bvec_iter_le=
n'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |                  ^~~~~~~~~~~~~~~~
   include/linux/bvec.h:97:13: note: in expansion of macro 'bvec_iter_len'
      97 |  .bv_len  =3D bvec_iter_len((bvec), (iter)), \
         |             ^~~~~~~~~~~~~
   include/linux/bio.h:34:2: note: in expansion of macro 'bvec_iter_bvec'
      34 |  bvec_iter_bvec((bio)->bi_io_vec, (iter))
         |  ^~~~~~~~~~~~~~
   include/linux/bio.h:45:25: note: in expansion of macro 'bio_iter_iovec'
      45 | #define bio_iovec(bio)  bio_iter_iovec((bio), (bio)->bi_iter)
         |                         ^~~~~~~~~~~~~~
   include/linux/bio.h:96:10: note: in expansion of macro 'bio_iovec'
      96 |   return bio_iovec(bio).bv_len;
         |          ^~~~~~~~~
>> include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/bvec.h:97:13: note: in expansion of macro 'bvec_iter_len'
      97 |  .bv_len  =3D bvec_iter_len((bvec), (iter)), \
         |             ^~~~~~~~~~~~~
   include/linux/bio.h:34:2: note: in expansion of macro 'bvec_iter_bvec'
      34 |  bvec_iter_bvec((bio)->bi_io_vec, (iter))
         |  ^~~~~~~~~~~~~~
   include/linux/bio.h:45:25: note: in expansion of macro 'bio_iter_iovec'
      45 | #define bio_iovec(bio)  bio_iter_iovec((bio), (bio)->bi_iter)
         |                         ^~~~~~~~~~~~~~
   include/linux/bio.h:96:10: note: in expansion of macro 'bio_iovec'
      96 |   return bio_iovec(bio).bv_len;
         |          ^~~~~~~~~
   include/linux/bio.h: In function 'bio_get_first_bvec':
>> include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:18:21: note: in definition of macro '__typecheck'
      18 |  (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
         |                     ^
   include/linux/minmax.h:42:24: note: in expansion of macro '__safe_cmp'
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |                        ^~~~~~~~~~
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
      51 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   include/linux/bvec.h:66:2: note: in expansion of macro 'min'
      66 |  min((iter).bi_size,     \
         |  ^~~
   include/linux/bvec.h:87:18: note: in expansion of macro 'mp_bvec_iter_le=
n'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |                  ^~~~~~~~~~~~~~~~
   include/linux/bvec.h:97:13: note: in expansion of macro 'bvec_iter_len'
      97 |  .bv_len  =3D bvec_iter_len((bvec), (iter)), \
         |             ^~~~~~~~~~~~~
   include/linux/bio.h:34:2: note: in expansion of macro 'bvec_iter_bvec'
      34 |  bvec_iter_bvec((bio)->bi_io_vec, (iter))
         |  ^~~~~~~~~~~~~~
   include/linux/bio.h:45:25: note: in expansion of macro 'bio_iter_iovec'
      45 | #define bio_iovec(bio)  bio_iter_iovec((bio), (bio)->bi_iter)
         |                         ^~~~~~~~~~~~~~
   include/linux/bio.h:274:8: note: in expansion of macro 'bio_iovec'
     274 |  *bv =3D bio_iovec(bio);
         |        ^~~~~~~~~
>> include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:48: note: in definition of macro '__is_constex=
pr'
      26 |  (sizeof(int) =3D=3D sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (=
int *)8)))
         |                                                ^
   include/linux/minmax.h:32:25: note: in expansion of macro '__no_side_eff=
ects'
      32 |   (__typecheck(x, y) && __no_side_effects(x, y))
         |                         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:42:24: note: in expansion of macro '__safe_cmp'
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |                        ^~~~~~~~~~
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
      51 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   include/linux/bvec.h:66:2: note: in expansion of macro 'min'
      66 |  min((iter).bi_size,     \
         |  ^~~
   include/linux/bvec.h:87:18: note: in expansion of macro 'mp_bvec_iter_le=
n'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |                  ^~~~~~~~~~~~~~~~
   include/linux/bvec.h:97:13: note: in expansion of macro 'bvec_iter_len'
      97 |  .bv_len  =3D bvec_iter_len((bvec), (iter)), \
         |             ^~~~~~~~~~~~~
   include/linux/bio.h:34:2: note: in expansion of macro 'bvec_iter_bvec'
      34 |  bvec_iter_bvec((bio)->bi_io_vec, (iter))
         |  ^~~~~~~~~~~~~~
   include/linux/bio.h:45:25: note: in expansion of macro 'bio_iter_iovec'
      45 | #define bio_iovec(bio)  bio_iter_iovec((bio), (bio)->bi_iter)
         |                         ^~~~~~~~~~~~~~
   include/linux/bio.h:274:8: note: in expansion of macro 'bio_iovec'
     274 |  *bv =3D bio_iovec(bio);
         |        ^~~~~~~~~
>> include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:27: note: in definition of macro '__cmp'
      34 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                           ^
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
      51 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   include/linux/bvec.h:66:2: note: in expansion of macro 'min'
      66 |  min((iter).bi_size,     \
         |  ^~~
   include/linux/bvec.h:87:18: note: in expansion of macro 'mp_bvec_iter_le=
n'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |                  ^~~~~~~~~~~~~~~~
   include/linux/bvec.h:97:13: note: in expansion of macro 'bvec_iter_len'
      97 |  .bv_len  =3D bvec_iter_len((bvec), (iter)), \
         |             ^~~~~~~~~~~~~
   include/linux/bio.h:34:2: note: in expansion of macro 'bvec_iter_bvec'
      34 |  bvec_iter_bvec((bio)->bi_io_vec, (iter))
         |  ^~~~~~~~~~~~~~
   include/linux/bio.h:45:25: note: in expansion of macro 'bio_iter_iovec'
      45 | #define bio_iovec(bio)  bio_iter_iovec((bio), (bio)->bi_iter)
         |                         ^~~~~~~~~~~~~~
   include/linux/bio.h:274:8: note: in expansion of macro 'bio_iovec'
     274 |  *bv =3D bio_iovec(bio);
         |        ^~~~~~~~~
>> include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:40: note: in definition of macro '__cmp'
      34 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                                        ^
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
      51 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   include/linux/bvec.h:66:2: note: in expansion of macro 'min'
      66 |  min((iter).bi_size,     \
         |  ^~~
   include/linux/bvec.h:87:18: note: in expansion of macro 'mp_bvec_iter_le=
n'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |                  ^~~~~~~~~~~~~~~~
   include/linux/bvec.h:97:13: note: in expansion of macro 'bvec_iter_len'
      97 |  .bv_len  =3D bvec_iter_len((bvec), (iter)), \
         |             ^~~~~~~~~~~~~
   include/linux/bio.h:34:2: note: in expansion of macro 'bvec_iter_bvec'
      34 |  bvec_iter_bvec((bio)->bi_io_vec, (iter))
         |  ^~~~~~~~~~~~~~
   include/linux/bio.h:45:25: note: in expansion of macro 'bio_iter_iovec'
      45 | #define bio_iovec(bio)  bio_iter_iovec((bio), (bio)->bi_iter)
         |                         ^~~~~~~~~~~~~~
   include/linux/bio.h:274:8: note: in expansion of macro 'bio_iovec'
     274 |  *bv =3D bio_iovec(bio);
         |        ^~~~~~~~~
>> include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:37:10: note: in definition of macro '__cmp_once'
      37 |   typeof(x) unique_x =3D (x);  \
         |          ^
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
      51 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   include/linux/bvec.h:66:2: note: in expansion of macro 'min'
      66 |  min((iter).bi_size,     \
         |  ^~~
   include/linux/bvec.h:87:18: note: in expansion of macro 'mp_bvec_iter_le=
n'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |                  ^~~~~~~~~~~~~~~~
   include/linux/bvec.h:97:13: note: in expansion of macro 'bvec_iter_len'
      97 |  .bv_len  =3D bvec_iter_len((bvec), (iter)), \
         |             ^~~~~~~~~~~~~
   include/linux/bio.h:34:2: note: in expansion of macro 'bvec_iter_bvec'
      34 |  bvec_iter_bvec((bio)->bi_io_vec, (iter))
         |  ^~~~~~~~~~~~~~
   include/linux/bio.h:45:25: note: in expansion of macro 'bio_iter_iovec'
      45 | #define bio_iovec(bio)  bio_iter_iovec((bio), (bio)->bi_iter)
         |                         ^~~~~~~~~~~~~~
   include/linux/bio.h:274:8: note: in expansion of macro 'bio_iovec'
     274 |  *bv =3D bio_iovec(bio);
         |        ^~~~~~~~~
>> include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:37:25: note: in definition of macro '__cmp_once'
      37 |   typeof(x) unique_x =3D (x);  \
         |                         ^
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
      51 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   include/linux/bvec.h:66:2: note: in expansion of macro 'min'
      66 |  min((iter).bi_size,     \
         |  ^~~
   include/linux/bvec.h:87:18: note: in expansion of macro 'mp_bvec_iter_le=
n'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |                  ^~~~~~~~~~~~~~~~
   include/linux/bvec.h:97:13: note: in expansion of macro 'bvec_iter_len'
      97 |  .bv_len  =3D bvec_iter_len((bvec), (iter)), \
         |             ^~~~~~~~~~~~~
   include/linux/bio.h:34:2: note: in expansion of macro 'bvec_iter_bvec'
      34 |  bvec_iter_bvec((bio)->bi_io_vec, (iter))
         |  ^~~~~~~~~~~~~~
   include/linux/bio.h:45:25: note: in expansion of macro 'bio_iter_iovec'
      45 | #define bio_iovec(bio)  bio_iter_iovec((bio), (bio)->bi_iter)
         |                         ^~~~~~~~~~~~~~
   include/linux/bio.h:274:8: note: in expansion of macro 'bio_iovec'
     274 |  *bv =3D bio_iovec(bio);
         |        ^~~~~~~~~
>> include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/bvec.h:97:13: note: in expansion of macro 'bvec_iter_len'
      97 |  .bv_len  =3D bvec_iter_len((bvec), (iter)), \
         |             ^~~~~~~~~~~~~
   include/linux/bio.h:34:2: note: in expansion of macro 'bvec_iter_bvec'
      34 |  bvec_iter_bvec((bio)->bi_io_vec, (iter))
         |  ^~~~~~~~~~~~~~
   include/linux/bio.h:45:25: note: in expansion of macro 'bio_iter_iovec'
      45 | #define bio_iovec(bio)  bio_iter_iovec((bio), (bio)->bi_iter)
         |                         ^~~~~~~~~~~~~~
   include/linux/bio.h:274:8: note: in expansion of macro 'bio_iovec'
     274 |  *bv =3D bio_iovec(bio);
         |        ^~~~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:22,
                    from include/linux/bitops.h:6,
                    from include/linux/bitmap.h:8,
                    from include/linux/ethtool.h:16,
                    from net/socket.c:55:
   include/linux/bio.h: In function 'bio_get_last_bvec':
>> include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
      78 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   include/linux/minmax.h:32:4: note: in expansion of macro '__typecheck'
      32 |   (__typecheck(x, y) && __no_side_effects(x, y))
         |    ^~~~~~~~~~~
   include/linux/minmax.h:42:24: note: in expansion of macro '__safe_cmp'
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |                        ^~~~~~~~~~
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
      51 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   include/linux/bvec.h:66:2: note: in expansion of macro 'min'
      66 |  min((iter).bi_size,     \
         |  ^~~
   include/linux/bvec.h:87:18: note: in expansion of macro 'mp_bvec_iter_le=
n'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |                  ^~~~~~~~~~~~~~~~
   include/linux/bvec.h:97:13: note: in expansion of macro 'bvec_iter_len'
      97 |  .bv_len  =3D bvec_iter_len((bvec), (iter)), \
         |             ^~~~~~~~~~~~~
   include/linux/bio.h:34:2: note: in expansion of macro 'bvec_iter_bvec'
      34 |  bvec_iter_bvec((bio)->bi_io_vec, (iter))
         |  ^~~~~~~~~~~~~~
   include/linux/bio.h:45:25: note: in expansion of macro 'bio_iter_iovec'
      45 | #define bio_iovec(bio)  bio_iter_iovec((bio), (bio)->bi_iter)
         |                         ^~~~~~~~~~~~~~
   include/linux/bio.h:48:29: note: in expansion of macro 'bio_iovec'
      48 |  ((bio)->bi_iter.bi_size !=3D bio_iovec(bio).bv_len)
         |                             ^~~~~~~~~
   include/linux/bio.h:282:16: note: in expansion of macro 'bio_multiple_se=
gments'
     282 |  if (unlikely(!bio_multiple_segments(bio))) {
         |                ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
      78 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   include/linux/minmax.h:29:4: note: in expansion of macro '__is_constexpr'
      29 |   (__is_constexpr(x) && __is_constexpr(y))
         |    ^~~~~~~~~~~~~~
   include/linux/minmax.h:32:25: note: in expansion of macro '__no_side_eff=
ects'
      32 |   (__typecheck(x, y) && __no_side_effects(x, y))
         |                         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:42:24: note: in expansion of macro '__safe_cmp'
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |                        ^~~~~~~~~~
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
      51 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   include/linux/bvec.h:66:2: note: in expansion of macro 'min'
      66 |  min((iter).bi_size,     \
         |  ^~~
   include/linux/bvec.h:87:18: note: in expansion of macro 'mp_bvec_iter_le=
n'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |                  ^~~~~~~~~~~~~~~~
   include/linux/bvec.h:97:13: note: in expansion of macro 'bvec_iter_len'
      97 |  .bv_len  =3D bvec_iter_len((bvec), (iter)), \
         |             ^~~~~~~~~~~~~
   include/linux/bio.h:34:2: note: in expansion of macro 'bvec_iter_bvec'
      34 |  bvec_iter_bvec((bio)->bi_io_vec, (iter))
         |  ^~~~~~~~~~~~~~
   include/linux/bio.h:45:25: note: in expansion of macro 'bio_iter_iovec'
      45 | #define bio_iovec(bio)  bio_iter_iovec((bio), (bio)->bi_iter)
         |                         ^~~~~~~~~~~~~~
   include/linux/bio.h:48:29: note: in expansion of macro 'bio_iovec'
      48 |  ((bio)->bi_iter.bi_size !=3D bio_iovec(bio).bv_len)
         |                             ^~~~~~~~~
   include/linux/bio.h:282:16: note: in expansion of macro 'bio_multiple_se=
gments'
     282 |  if (unlikely(!bio_multiple_segments(bio))) {
         |                ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
      78 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   include/linux/minmax.h:43:3: note: in expansion of macro '__cmp'
      43 |   __cmp(x, y, op), \
         |   ^~~~~
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
      51 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   include/linux/bvec.h:66:2: note: in expansion of macro 'min'
      66 |  min((iter).bi_size,     \
         |  ^~~
   include/linux/bvec.h:87:18: note: in expansion of macro 'mp_bvec_iter_le=
n'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |                  ^~~~~~~~~~~~~~~~
   include/linux/bvec.h:97:13: note: in expansion of macro 'bvec_iter_len'
      97 |  .bv_len  =3D bvec_iter_len((bvec), (iter)), \
         |             ^~~~~~~~~~~~~
   include/linux/bio.h:34:2: note: in expansion of macro 'bvec_iter_bvec'
      34 |  bvec_iter_bvec((bio)->bi_io_vec, (iter))
         |  ^~~~~~~~~~~~~~
   include/linux/bio.h:45:25: note: in expansion of macro 'bio_iter_iovec'
      45 | #define bio_iovec(bio)  bio_iter_iovec((bio), (bio)->bi_iter)
         |                         ^~~~~~~~~~~~~~
   include/linux/bio.h:48:29: note: in expansion of macro 'bio_iovec'
      48 |  ((bio)->bi_iter.bi_size !=3D bio_iovec(bio).bv_len)
         |                             ^~~~~~~~~
   include/linux/bio.h:282:16: note: in expansion of macro 'bio_multiple_se=
gments'
     282 |  if (unlikely(!bio_multiple_segments(bio))) {
         |                ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
      78 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   include/linux/minmax.h:43:3: note: in expansion of macro '__cmp'
      43 |   __cmp(x, y, op), \
         |   ^~~~~
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
      51 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   include/linux/bvec.h:66:2: note: in expansion of macro 'min'
      66 |  min((iter).bi_size,     \
         |  ^~~
   include/linux/bvec.h:87:18: note: in expansion of macro 'mp_bvec_iter_le=
n'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |                  ^~~~~~~~~~~~~~~~
   include/linux/bvec.h:97:13: note: in expansion of macro 'bvec_iter_len'
      97 |  .bv_len  =3D bvec_iter_len((bvec), (iter)), \
         |             ^~~~~~~~~~~~~
   include/linux/bio.h:34:2: note: in expansion of macro 'bvec_iter_bvec'
      34 |  bvec_iter_bvec((bio)->bi_io_vec, (iter))
         |  ^~~~~~~~~~~~~~
   include/linux/bio.h:45:25: note: in expansion of macro 'bio_iter_iovec'
      45 | #define bio_iovec(bio)  bio_iter_iovec((bio), (bio)->bi_iter)
         |                         ^~~~~~~~~~~~~~
   include/linux/bio.h:48:29: note: in expansion of macro 'bio_iovec'
      48 |  ((bio)->bi_iter.bi_size !=3D bio_iovec(bio).bv_len)
         |                             ^~~~~~~~~
   include/linux/bio.h:282:16: note: in expansion of macro 'bio_multiple_se=
gments'
     282 |  if (unlikely(!bio_multiple_segments(bio))) {
         |                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
      78 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   include/linux/minmax.h:44:3: note: in expansion of macro '__cmp_once'
      44 |   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
         |   ^~~~~~~~~~
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
      51 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   include/linux/bvec.h:66:2: note: in expansion of macro 'min'
      66 |  min((iter).bi_size,     \
         |  ^~~
   include/linux/bvec.h:87:18: note: in expansion of macro 'mp_bvec_iter_le=
n'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |                  ^~~~~~~~~~~~~~~~
   include/linux/bvec.h:97:13: note: in expansion of macro 'bvec_iter_len'
      97 |  .bv_len  =3D bvec_iter_len((bvec), (iter)), \
         |             ^~~~~~~~~~~~~
   include/linux/bio.h:34:2: note: in expansion of macro 'bvec_iter_bvec'
      34 |  bvec_iter_bvec((bio)->bi_io_vec, (iter))
         |  ^~~~~~~~~~~~~~
   include/linux/bio.h:45:25: note: in expansion of macro 'bio_iter_iovec'
      45 | #define bio_iovec(bio)  bio_iter_iovec((bio), (bio)->bi_iter)
         |                         ^~~~~~~~~~~~~~
   include/linux/bio.h:48:29: note: in expansion of macro 'bio_iovec'
      48 |  ((bio)->bi_iter.bi_size !=3D bio_iovec(bio).bv_len)
         |                             ^~~~~~~~~
   include/linux/bio.h:282:16: note: in expansion of macro 'bio_multiple_se=
gments'
     282 |  if (unlikely(!bio_multiple_segments(bio))) {
         |                ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:42:2: error: first argument to '__builtin_choose_=
expr' not a constant
      42 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
      78 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   include/linux/minmax.h:44:3: note: in expansion of macro '__cmp_once'
      44 |   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
         |   ^~~~~~~~~~
   include/linux/minmax.h:110:27: note: in expansion of macro '__careful_cm=
p'
     110 | #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
         |                           ^~~~~~~~~~~~~
   include/linux/bvec.h:87:2: note: in expansion of macro 'min_t'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
         |  ^~~~~
   include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
      51 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   include/linux/bvec.h:66:2: note: in expansion of macro 'min'
      66 |  min((iter).bi_size,     \
         |  ^~~
   include/linux/bvec.h:87:18: note: in expansion of macro 'mp_bvec_iter_le=
n'
      87 |  min_t(unsigned, mp_bvec_iter_len((bvec), (iter)),  \
..


vim +189 include/linux/bvec.h

   186	=

   187	static inline void *bvec_kmap_local(struct bio_vec *bvec)
   188	{
 > 189		return kmap_local_page(bvec->bv_page) + bvec->bv_offset;
   190	}
   191	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8067590757305615022==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8067590757305615022==--

