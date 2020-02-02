Content-Type: multipart/mixed; boundary="===============5785256930011450033=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [rppt:pg_table/v0.0 11/18] mm/memory.c:430:3: error: implicit declaration of function '_pmd_populate'; did you mean '_pud_populate'?
Date: Sun, 02 Feb 2020 15:13:53 +0800
Message-ID: <202002021547.bBIX1aNu%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5785256930011450033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git pg_t=
able/v0.0
head:   fd150c5a9ef6e3e43818825c69a46de2b427dedf
commit: a28a3e30c8e9b58a6da1d5e6a4803c5580e93ce5 [11/18] mm: enable pte all=
ocations for pg_table
config: riscv-allnoconfig (attached as .config)
compiler: riscv64-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout a28a3e30c8e9b58a6da1d5e6a4803c5580e93ce5
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Driscv =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   mm/memory.c: In function '__pte_alloc':
>> mm/memory.c:430:3: error: implicit declaration of function '_pmd_populat=
e'; did you mean '_pud_populate'? [-Werror=3Dimplicit-function-declaration]
      _pmd_populate(pgt, pmd, new);
      ^~~~~~~~~~~~~
      _pud_populate
   cc1: some warnings being treated as errors

vim +430 mm/memory.c

   404	=

   405	int __pte_alloc(struct pg_table *pgt, pmd_t *pmd)
   406	{
   407		spinlock_t *ptl;
   408		pgtable_t new =3D pte_alloc_one(pgt);
   409		if (!new)
   410			return -ENOMEM;
   411	=

   412		/*
   413		 * Ensure all pte setup (eg. pte page lock and page clearing) are
   414		 * visible before the pte is made visible to other CPUs by being
   415		 * put into page tables.
   416		 *
   417		 * The other side of the story is the pointer chasing in the page
   418		 * table walking code (when walking the page table without locking;
   419		 * ie. most of the time). Fortunately, these data accesses consist
   420		 * of a chain of data-dependent loads, meaning most CPUs (alpha
   421		 * being the notable exception) will already guarantee loads are
   422		 * seen in-order. See the alpha page table accessors for the
   423		 * smp_read_barrier_depends() barriers in page table walking code.
   424		 */
   425		smp_wmb(); /* Could be smp_wmb__xxx(before|after)_spin_lock */
   426	=

   427		ptl =3D _pmd_lock(pgt, pmd);
   428		if (likely(pmd_none(*pmd))) {	/* Has another populated it ? */
   429			mm_inc_nr_ptes(pgt);
 > 430			_pmd_populate(pgt, pmd, new);
   431			new =3D NULL;
   432		}
   433		spin_unlock(ptl);
   434		if (new)
   435			pte_free(pgt, new);
   436		return 0;
   437	}
   438	=


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============5785256930011450033==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
4NCITTLtcI7lOI6qyGIY/Vf4/T8wv72wDkoAAA==
--===============5785256930011450033==--

