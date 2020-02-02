Content-Type: multipart/mixed; boundary="===============0045785051332025878=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [rppt:pg_table/v0.0 13/18] mm/init-mm.c:37:3: error: positional initialization of field in 'struct' declared with 'designated_init' attribute
Date: Sun, 02 Feb 2020 18:52:13 +0800
Message-ID: <202002021812.12V3IEEq%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0045785051332025878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git pg_t=
able/v0.0
head:   fd150c5a9ef6e3e43818825c69a46de2b427dedf
commit: da7c45f8a8af997141e829ae8a9b776b7cb50bf9 [13/18] mm: move cpu_bitma=
sk from mm_struct to pg_table
config: nds32-defconfig (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout da7c45f8a8af997141e829ae8a9b776b7cb50bf9
        # save the attached .config to linux build tree
        GCC_VERSION=3D9.2.0 make.cross ARCH=3Dnds32 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   mm/init-mm.c:37:3: error: implicit declaration of function 'INIT_PT_CONT=
EXT'; did you mean 'INIT_MM_CONTEXT'? [-Werror=3Dimplicit-function-declarat=
ion]
      37 |   INIT_PT_CONTEXT(init_mm.pgt)
         |   ^~~~~~~~~~~~~~~
         |   INIT_MM_CONTEXT
>> mm/init-mm.c:37:3: error: positional initialization of field in 'struct'=
 declared with 'designated_init' attribute [-Werror=3Ddesignated-init]
   mm/init-mm.c:37:3: note: (near initialization for 'init_mm.pgt.<anonymou=
s>')
   mm/init-mm.c:37:3: warning: excess elements in struct initializer
   mm/init-mm.c:37:3: note: (near initialization for 'init_mm.pgt.<anonymou=
s>.context')
   mm/init-mm.c:29:28: warning: missing braces around initializer [-Wmissin=
g-braces]
      29 | struct mm_struct init_mm =3D {
         |                            ^
      30 |  .mm_rb  =3D RB_ROOT,
         |                   }
      31 |  .mm_users =3D ATOMIC_INIT(2),
         |                            }
      32 |  .mm_count =3D ATOMIC_INIT(1),
         |                            }
      33 |  .mmap_sem =3D __RWSEM_INITIALIZER(init_mm.mmap_sem),
         |                                                   }
      34 |  .pgt   =3D {
      35 |   .page_table_lock =3D __SPIN_LOCK_UNLOCKED(init_mm.pgt.page_tab=
le_lock),
         |                                                                 =
      }
      36 |   .pgd  =3D swapper_pg_dir,
      37 |   INIT_PT_CONTEXT(init_mm.pgt)
         |   {
      38 |  },
         |  }}
   cc1: some warnings being treated as errors

vim +37 mm/init-mm.c

bb1f17b0372de9 Alexey Dobriyan 2009-06-16  18  =

c1a2f7f0c06454 Rik van Riel    2018-07-16  19  /*
c1a2f7f0c06454 Rik van Riel    2018-07-16  20   * For dynamically allocated=
 mm_structs, there is a dynamically sized cpumask
c1a2f7f0c06454 Rik van Riel    2018-07-16  21   * at the end of the structu=
re, the size of which depends on the maximum CPU
c1a2f7f0c06454 Rik van Riel    2018-07-16  22   * number the system can see=
. That way we allocate only as much memory for
c1a2f7f0c06454 Rik van Riel    2018-07-16  23   * mm_cpumask() as needed fo=
r the hundreds, or thousands of processes that
c1a2f7f0c06454 Rik van Riel    2018-07-16  24   * a system typically runs.
c1a2f7f0c06454 Rik van Riel    2018-07-16  25   *
c1a2f7f0c06454 Rik van Riel    2018-07-16  26   * Since there is only one i=
nit_mm in the entire system, keep it simple
c1a2f7f0c06454 Rik van Riel    2018-07-16  27   * and size this cpu_bitmask=
 to NR_CPUS.
c1a2f7f0c06454 Rik van Riel    2018-07-16  28   */
bb1f17b0372de9 Alexey Dobriyan 2009-06-16  29  struct mm_struct init_mm =3D=
 {
bb1f17b0372de9 Alexey Dobriyan 2009-06-16  30  	.mm_rb		=3D RB_ROOT,
bb1f17b0372de9 Alexey Dobriyan 2009-06-16  31  	.mm_users	=3D ATOMIC_INIT(2=
),
bb1f17b0372de9 Alexey Dobriyan 2009-06-16  32  	.mm_count	=3D ATOMIC_INIT(1=
),
bb1f17b0372de9 Alexey Dobriyan 2009-06-16  33  	.mmap_sem	=3D __RWSEM_INITI=
ALIZER(init_mm.mmap_sem),
f91cb6062ff32b Mike Rapoport   2019-08-06  34  	.pgt			=3D {
f91cb6062ff32b Mike Rapoport   2019-08-06  35  		.page_table_lock =3D __SPI=
N_LOCK_UNLOCKED(init_mm.pgt.page_table_lock),
e5db6ff88e6ef1 Mike Rapoport   2019-11-18  36  		.pgd		=3D swapper_pg_dir,
a661e3799be71e Mike Rapoport   2019-11-19 @37  		INIT_PT_CONTEXT(init_mm.pg=
t)

:::::: The code at line 37 was first introduced by commit
:::::: a661e3799be71e741ee4d31e1386e9f6f0932b38 x86/mm: split pt_context_t =
out of mm_context_t

:::::: TO: Mike Rapoport <rppt@linux.ibm.com>
:::::: CC: Mike Rapoport <rppt@linux.ibm.com>

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============0045785051332025878==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
l3xfTLNUqW7HRpJKzfc/mHcdUbukAAA=
--===============0045785051332025878==--

