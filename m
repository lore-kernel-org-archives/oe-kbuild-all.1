Content-Type: multipart/mixed; boundary="===============9197457049925568972=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v9 92/96] iomap: Convert iomap_write_begin and iomap_write_end to folios
Date: Thu, 06 May 2021 05:36:54 +0800
Message-ID: <202105060511.863ZVBcq-lkp@intel.com>
In-Reply-To: <20210505150628.111735-93-willy@infradead.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9197457049925568972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi "Matthew,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20210505]
[cannot apply to hnaz-linux-mm/master xfs-linux/for-next tip/perf/core shag=
gy/jfs-next block/for-next linus/master asm-generic/master v5.12 v5.12-rc8 =
v5.12-rc7 v5.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Matthew-Wilcox-Oracle/Memo=
ry-folios/20210506-014108
base:    29955e0289b3255c5f609a7564a0f0bb4ae35c7a
config: nds32-defconfig (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0780b0addad735d2cceb3680d=
49f54f8618e1334
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Matthew-Wilcox-Oracle/Memory-folio=
s/20210506-014108
        git checkout 0780b0addad735d2cceb3680d49f54f8618e1334
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
W=3D1 ARCH=3Dnds32 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/swap.h:9,
                    from fs/iomap/buffered-io.c:16:
   include/linux/memcontrol.h: In function 'folio_uncharge_cgroup':
   include/linux/memcontrol.h:1213:42: error: parameter name omitted
    1213 | static inline void folio_uncharge_cgroup(struct folio *)
         |                                          ^~~~~~~~~~~~~~
   fs/iomap/buffered-io.c: In function '__iomap_write_end':
>> fs/iomap/buffered-io.c:645:2: error: implicit declaration of function 'f=
lush_dcache_folio'; did you mean 'flush_dcache_page'? [-Werror=3Dimplicit-f=
unction-declaration]
     645 |  flush_dcache_folio(folio);
         |  ^~~~~~~~~~~~~~~~~~
         |  flush_dcache_page
   cc1: some warnings being treated as errors


vim +645 fs/iomap/buffered-io.c

   640	=

   641	static size_t __iomap_write_end(struct inode *inode, loff_t pos, siz=
e_t len,
   642			size_t copied, struct folio *folio)
   643	{
   644		struct iomap_page *iop =3D to_iomap_page(folio);
 > 645		flush_dcache_folio(folio);
   646	=

   647		/*
   648		 * The blocks that were entirely written will now be uptodate, so we
   649		 * don't have to worry about a readpage reading them and overwritin=
g a
   650		 * partial write.  However if we have encountered a short write and=
 only
   651		 * partially written into a block, it will not be marked uptodate, =
so a
   652		 * readpage might come in and destroy our partial write.
   653		 *
   654		 * Do the simplest thing, and just treat any short write to a non
   655		 * uptodate page as a zero-length write, and force the caller to re=
do
   656		 * the whole thing.
   657		 */
   658		if (unlikely(copied < len && !folio_uptodate(folio)))
   659			return 0;
   660		iomap_set_range_uptodate(folio, iop, offset_in_folio(folio, pos), l=
en);
   661		filemap_dirty_folio(inode->i_mapping, folio);
   662		return copied;
   663	}
   664	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9197457049925568972==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
nlHe86KW5f8PstPkjtKpAAA=
--===============9197457049925568972==--

