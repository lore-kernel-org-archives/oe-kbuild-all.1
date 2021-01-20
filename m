Content-Type: multipart/mixed; boundary="===============4700201096433973825=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH mm/zswap 1/2] mm/zswap: add the flag can_sleep_mapped
Date: Wed, 20 Jan 2021 22:46:48 +0800
Message-ID: <202101202247.eTZ4UdGZ-lkp@intel.com>
In-Reply-To: <1611035683-12732-2-git-send-email-tiantao6@hisilicon.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4700201096433973825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Tian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.11-rc4]
[cannot apply to hnaz-linux-mm/master next-20210120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tian-Tao/Fix-the-compatibi=
lity-of-zsmalloc-and-zswap/20210120-162712
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
45dfb8a5659ad286c28fa59008271dbc4e5e3f2d
config: s390-randconfig-r003-20210120 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 22b684=
40e1647e16b5ee24b924986207173c02d1)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/d2ad619ba5016be9cd273292a=
e5dc40d8402fe4e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Tian-Tao/Fix-the-compatibility-of-=
zsmalloc-and-zswap/20210120-162712
        git checkout d2ad619ba5016be9cd273292ae5dc40d8402fe4e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

                              ^
   include/uapi/linux/swab.h:20:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
                     ^
   In file included from mm/zswap.c:23:
   In file included from include/linux/frontswap.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:21:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
                     ^
   In file included from mm/zswap.c:23:
   In file included from include/linux/frontswap.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
           ___constant_swab32(x) :                 \
                              ^
   include/uapi/linux/swab.h:22:12: note: expanded from macro '___constant_=
swab32'
           (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
                     ^
   In file included from mm/zswap.c:23:
   In file included from include/linux/frontswap.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
           __fswab32(x))
                     ^
   In file included from mm/zswap.c:23:
   In file included from include/linux/frontswap.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> mm/zswap.c:947:17: warning: variable 'entry' is uninitialized when used =
here [-Wuninitialized]
                   tmp =3D kmalloc(entry->length, GFP_ATOMIC);
                                 ^~~~~
   mm/zswap.c:933:27: note: initialize the variable 'entry' to silence this=
 warning
           struct zswap_entry *entry;
                                    ^
                                     =3D NULL
>> mm/zswap.c:1271:6: warning: variable 'ret' is used uninitialized wheneve=
r 'if' condition is true [-Wsometimes-uninitialized]
           if (!entry->length) {
               ^~~~~~~~~~~~~~
   mm/zswap.c:1322:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   mm/zswap.c:1271:2: note: remove the 'if' if its condition is always false
           if (!entry->length) {
           ^~~~~~~~~~~~~~~~~~~~~
   mm/zswap.c:1259:9: note: initialize the variable 'ret' to silence this w=
arning
           int ret;
                  ^
                   =3D 0
   22 warnings generated.


vim +/entry +947 mm/zswap.c

   914	=

   915	/*
   916	 * Attempts to free an entry by adding a page to the swap cache,
   917	 * decompressing the entry data into the page, and issuing a
   918	 * bio write to write the page back to the swap device.
   919	 *
   920	 * This can be thought of as a "resumed writeback" of the page
   921	 * to the swap device.  We are basically resuming the same swap
   922	 * writeback path that was intercepted with the frontswap_store()
   923	 * in the first place.  After the page has been decompressed into
   924	 * the swap cache, the compressed version stored by zswap can be
   925	 * freed.
   926	 */
   927	static int zswap_writeback_entry(struct zpool *pool, unsigned long h=
andle)
   928	{
   929		struct zswap_header *zhdr;
   930		swp_entry_t swpentry;
   931		struct zswap_tree *tree;
   932		pgoff_t offset;
   933		struct zswap_entry *entry;
   934		struct page *page;
   935		struct scatterlist input, output;
   936		struct crypto_acomp_ctx *acomp_ctx;
   937	=

   938		u8 *src, *tmp;
   939		unsigned int dlen;
   940		int ret;
   941		struct writeback_control wbc =3D {
   942			.sync_mode =3D WB_SYNC_NONE,
   943		};
   944	=

   945		if (!zpool_can_sleep_mapped(pool)) {
   946	=

 > 947			tmp =3D kmalloc(entry->length, GFP_ATOMIC);
   948			if (!tmp)
   949				return -ENOMEM;
   950		}
   951	=

   952		/* extract swpentry from data */
   953		zhdr =3D zpool_map_handle(pool, handle, ZPOOL_MM_RO);
   954		swpentry =3D zhdr->swpentry; /* here */
   955		tree =3D zswap_trees[swp_type(swpentry)];
   956		offset =3D swp_offset(swpentry);
   957	=

   958		/* find and ref zswap entry */
   959		spin_lock(&tree->lock);
   960		entry =3D zswap_entry_find_get(&tree->rbroot, offset);
   961		if (!entry) {
   962			/* entry was invalidated */
   963			spin_unlock(&tree->lock);
   964			zpool_unmap_handle(pool, handle);
   965			return 0;
   966		}
   967		spin_unlock(&tree->lock);
   968		BUG_ON(offset !=3D entry->offset);
   969	=

   970		/* try to allocate swap cache page */
   971		switch (zswap_get_swap_cache_page(swpentry, &page)) {
   972		case ZSWAP_SWAPCACHE_FAIL: /* no memory or invalidate happened */
   973			ret =3D -ENOMEM;
   974			goto fail;
   975	=

   976		case ZSWAP_SWAPCACHE_EXIST:
   977			/* page is already in the swap cache, ignore for now */
   978			put_page(page);
   979			ret =3D -EEXIST;
   980			goto fail;
   981	=

   982		case ZSWAP_SWAPCACHE_NEW: /* page is locked */
   983			/* decompress */
   984			acomp_ctx =3D raw_cpu_ptr(entry->pool->acomp_ctx);
   985	=

   986			dlen =3D PAGE_SIZE;
   987			src =3D (u8 *)zhdr + sizeof(struct zswap_header);
   988	=

   989			if (!zpool_can_sleep_mapped(pool)) {
   990	=

   991				memcpy(tmp, src, entry->length);
   992				src =3D tmp;
   993	=

   994				zpool_unmap_handle(pool, handle);
   995			}
   996	=

   997			mutex_lock(acomp_ctx->mutex);
   998			sg_init_one(&input, src, entry->length);
   999			sg_init_table(&output, 1);
  1000			sg_set_page(&output, page, PAGE_SIZE, 0);
  1001			acomp_request_set_params(acomp_ctx->req, &input, &output, entry->l=
ength, dlen);
  1002			ret =3D crypto_wait_req(crypto_acomp_decompress(acomp_ctx->req), &=
acomp_ctx->wait);
  1003			dlen =3D acomp_ctx->req->dlen;
  1004			mutex_unlock(acomp_ctx->mutex);
  1005	=

  1006			BUG_ON(ret);
  1007			BUG_ON(dlen !=3D PAGE_SIZE);
  1008	=

  1009			/* page is up to date */
  1010			SetPageUptodate(page);
  1011		}
  1012	=

  1013		/* move it to the tail of the inactive list after end_writeback */
  1014		SetPageReclaim(page);
  1015	=

  1016		/* start writeback */
  1017		__swap_writepage(page, &wbc, end_swap_bio_write);
  1018		put_page(page);
  1019		zswap_written_back_pages++;
  1020	=

  1021		spin_lock(&tree->lock);
  1022		/* drop local reference */
  1023		zswap_entry_put(tree, entry);
  1024	=

  1025		/*
  1026		* There are two possible situations for entry here:
  1027		* (1) refcount is 1(normal case),  entry is valid and on the tree
  1028		* (2) refcount is 0, entry is freed and not on the tree
  1029		*     because invalidate happened during writeback
  1030		*  search the tree and free the entry if find entry
  1031		*/
  1032		if (entry =3D=3D zswap_rb_search(&tree->rbroot, offset))
  1033			zswap_entry_put(tree, entry);
  1034		spin_unlock(&tree->lock);
  1035	=

  1036		goto end;
  1037	=

  1038		/*
  1039		* if we get here due to ZSWAP_SWAPCACHE_EXIST
  1040		* a load may happening concurrently
  1041		* it is safe and okay to not free the entry
  1042		* if we free the entry in the following put
  1043		* it it either okay to return !0
  1044		*/
  1045	fail:
  1046		spin_lock(&tree->lock);
  1047		zswap_entry_put(tree, entry);
  1048		spin_unlock(&tree->lock);
  1049	=

  1050	end:
  1051		if (zpool_can_sleep_mapped(pool))
  1052			zpool_unmap_handle(pool, handle);
  1053		else
  1054			kfree(tmp);
  1055	=

  1056		return ret;
  1057	}
  1058	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4700201096433973825==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4700201096433973825==--

