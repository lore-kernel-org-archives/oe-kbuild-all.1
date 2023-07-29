Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708E13D60
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 18:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690656552; x=1722192552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SyuRSc0oGaI32GSLkBX3+mcT1HXK7zL8zw9zEImLOdY=;
  b=mG4SxWgIMurP4MOdujAIMT+tl61XOsakpmhlceeZauOzNf+oBobfclwe
   REqbUusLtV8BcoTCYZ61k7eycHUVG7V5Ma9BlGxkw2bqCuH0OgVqgxzQz
   FY5k8/1d7V/WJvhx+CRjUQpBaKOj5QIjsGLcg/nb3fDCGwG/dquWIG78W
   sjbDGkPRx3VyAW2x4v920fhHhnzQXwJj8pPD8+NY4fa6nnrNY9K/soMql
   k8OKvOx//cdab0Gtq7YkR4WyoLuF3AfdwaFRBtLKO6wEL6N3HSdLJgVKL
   Mlb+zt3lHLlcXziWcU9ehmqoLFuBq55A8Y7gA9K5ycT5FeQAR4W6LY1lt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="399727812"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="399727812"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 11:49:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="974444590"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="974444590"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 29 Jul 2023 11:49:09 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPp00-0004FP-31;
	Sat, 29 Jul 2023 18:49:08 +0000
Date: Sun, 30 Jul 2023 02:48:21 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/md/dm-bow.c:97:10: warning: no previous prototype for
 function 'range_top'
Message-ID: <202307300210.umkLrvl8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 184f0876d5a9e629ebf1bcb3398c74a310c02b3e ANDROID: dm-bow: Add dm-bow feature
date:   2 years, 7 months ago
config: s390-randconfig-r031-20230730 (https://download.01.org/0day-ci/archive/20230730/202307300210.umkLrvl8-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307300210.umkLrvl8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307300210.umkLrvl8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device-mapper.h:12:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     490 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
      34 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
     119 |         ___constant_swab32(x) :                 \
         |                            ^
   include/uapi/linux/swab.h:20:12: note: expanded from macro '___constant_swab32'
      20 |         (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
         |                   ^
   In file included from drivers/md/dm-bow.c:7:
   In file included from drivers/md/dm.h:14:
   In file included from include/linux/device-mapper.h:12:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     490 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
      34 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
     119 |         ___constant_swab32(x) :                 \
         |                            ^
   include/uapi/linux/swab.h:21:12: note: expanded from macro '___constant_swab32'
      21 |         (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
         |                   ^
   In file included from drivers/md/dm-bow.c:7:
   In file included from drivers/md/dm.h:14:
   In file included from include/linux/device-mapper.h:12:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     490 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
      34 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
     119 |         ___constant_swab32(x) :                 \
         |                            ^
   include/uapi/linux/swab.h:22:12: note: expanded from macro '___constant_swab32'
      22 |         (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
         |                   ^
   In file included from drivers/md/dm-bow.c:7:
   In file included from drivers/md/dm.h:14:
   In file included from include/linux/device-mapper.h:12:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     490 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
      34 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
     120 |         __fswab32(x))
         |                   ^
   In file included from drivers/md/dm-bow.c:7:
   In file included from drivers/md/dm.h:14:
   In file included from include/linux/device-mapper.h:12:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     501 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     511 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     521 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     609 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     617 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     625 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     634 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     643 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     652 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/md/dm-bow.c:97:10: warning: no previous prototype for function 'range_top' [-Wmissing-prototypes]
      97 | sector_t range_top(struct bow_range *br)
         |          ^
   drivers/md/dm-bow.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      97 | sector_t range_top(struct bow_range *br)
         | ^
         | static 
>> drivers/md/dm-bow.c:103:5: warning: no previous prototype for function 'range_size' [-Wmissing-prototypes]
     103 | u64 range_size(struct bow_range *br)
         |     ^
   drivers/md/dm-bow.c:103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     103 | u64 range_size(struct bow_range *br)
         | ^
         | static 
>> drivers/md/dm-bow.c:148:6: warning: no previous prototype for function 'add_before' [-Wmissing-prototypes]
     148 | void add_before(struct rb_root *ranges, struct bow_range *new_br,
         |      ^
   drivers/md/dm-bow.c:148:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     148 | void add_before(struct rb_root *ranges, struct bow_range *new_br,
         | ^
         | static 
>> drivers/md/dm-bow.c:1093:5: warning: no previous prototype for function 'remap_unless_illegal_trim' [-Wmissing-prototypes]
    1093 | int remap_unless_illegal_trim(struct bow_context *bc, struct bio *bio)
         |     ^
   drivers/md/dm-bow.c:1093:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1093 | int remap_unless_illegal_trim(struct bow_context *bc, struct bio *bio)
         | ^
         | static 
>> drivers/md/dm-bow.c:1248:5: warning: no previous prototype for function 'dm_bow_prepare_ioctl' [-Wmissing-prototypes]
    1248 | int dm_bow_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
         |     ^
   drivers/md/dm-bow.c:1248:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1248 | int dm_bow_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
         | ^
         | static 
>> drivers/md/dm-bow.c:1279:12: warning: no previous prototype for function 'dm_bow_init' [-Wmissing-prototypes]
    1279 | int __init dm_bow_init(void)
         |            ^
   drivers/md/dm-bow.c:1279:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1279 | int __init dm_bow_init(void)
         | ^
         | static 
>> drivers/md/dm-bow.c:1288:6: warning: no previous prototype for function 'dm_bow_exit' [-Wmissing-prototypes]
    1288 | void dm_bow_exit(void)
         |      ^
   drivers/md/dm-bow.c:1288:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1288 | void dm_bow_exit(void)
         | ^
         | static 
   27 warnings generated.


vim +/range_top +97 drivers/md/dm-bow.c

    96	
  > 97	sector_t range_top(struct bow_range *br)
    98	{
    99		return container_of(rb_next(&br->node), struct bow_range, node)
   100			->sector;
   101	}
   102	
 > 103	u64 range_size(struct bow_range *br)
   104	{
   105		return (range_top(br) - br->sector) * SECTOR_SIZE;
   106	}
   107	
   108	static sector_t bvec_top(struct bvec_iter *bi_iter)
   109	{
   110		return bi_iter->bi_sector + bi_iter->bi_size / SECTOR_SIZE;
   111	}
   112	
   113	/*
   114	 * Find the first range that overlaps with bi_iter
   115	 * bi_iter is set to the size of the overlapping sub-range
   116	 */
   117	static struct bow_range *find_first_overlapping_range(struct rb_root *ranges,
   118							      struct bvec_iter *bi_iter)
   119	{
   120		struct rb_node *node = ranges->rb_node;
   121		struct bow_range *br;
   122	
   123		while (node) {
   124			br = container_of(node, struct bow_range, node);
   125	
   126			if (br->sector <= bi_iter->bi_sector
   127			    && bi_iter->bi_sector < range_top(br))
   128				break;
   129	
   130			if (bi_iter->bi_sector < br->sector)
   131				node = node->rb_left;
   132			else
   133				node = node->rb_right;
   134		}
   135	
   136		WARN_ON(!node);
   137		if (!node)
   138			return NULL;
   139	
   140		if (range_top(br) - bi_iter->bi_sector
   141		    < bi_iter->bi_size >> SECTOR_SHIFT)
   142			bi_iter->bi_size = (range_top(br) - bi_iter->bi_sector)
   143				<< SECTOR_SHIFT;
   144	
   145		return br;
   146	}
   147	
 > 148	void add_before(struct rb_root *ranges, struct bow_range *new_br,
   149			struct bow_range *existing)
   150	{
   151		struct rb_node *parent = &(existing->node);
   152		struct rb_node **link = &(parent->rb_left);
   153	
   154		while (*link) {
   155			parent = *link;
   156			link = &((*link)->rb_right);
   157		}
   158	
   159		rb_link_node(&new_br->node, parent, link);
   160		rb_insert_color(&new_br->node, ranges);
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
