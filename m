Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DD4362
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 04:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681272960; x=1712808960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yu0i8xjgLAvCU2cc6saKFUkTourLxXxeeB9OyHEnzBE=;
  b=CRDkmXlJVQUuIELq0zHPw0jCbHzVoYR8tHL3sJiFj8yT070Iw8nFuUFQ
   cOShkxVGwWk3NL37byYTdXtrAFB1nIejYwkL5q1F8lfCDPwoPRt47CID5
   tIrpuOrZ5AmurjEM42X/3MDfkV4JfIAtzwtsOE3mmIXILaimLbnmmT1G2
   59/KJKYV06i2+nMxNOndjpxPjt3cKp3MbN1IHFpLD3cwCofmBmg7UdcYk
   QQxGECXXI5XLhgubK0xxCmsRcqQvKXsKc+xn98HQmcgBrWJ8x6ayQ4U91
   ZLUE/j41euWbYyWbHGa/JEKyI41O9uwHeaBdz8jiB82dvjjem0rbhzA2P
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="430083264"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="430083264"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 21:15:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="688815401"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="688815401"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Apr 2023 21:15:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmRth-000XGB-0L;
	Wed, 12 Apr 2023 04:15:53 +0000
Date: Wed, 12 Apr 2023 12:15:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 434/511] fs/xfs/xfs_bmap_item.c:371:17:
 error: call to undeclared function 'xfs_rtgroup_intent_get'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202304121230.UVfdiA7U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   954ad3ce89f15b7e9eab0e81f1371fb8ef38ec25
commit: bd29054970459ac635ab764effbe7baaf668c6ac [434/511] xfs: allow queued realtime intents to drain before scrubbing
config: hexagon-randconfig-r012-20230409 (https://download.01.org/0day-ci/archive/20230412/202304121230.UVfdiA7U-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=bd29054970459ac635ab764effbe7baaf668c6ac
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout bd29054970459ac635ab764effbe7baaf668c6ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304121230.UVfdiA7U-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/xfs_bmap_item.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/xfs/xfs_bmap_item.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/xfs/xfs_bmap_item.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> fs/xfs/xfs_bmap_item.c:371:17: error: call to undeclared function 'xfs_rtgroup_intent_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           bi->bi_rtg = xfs_rtgroup_intent_get(mp, rgno);
                                        ^
   fs/xfs/xfs_bmap_item.c:371:17: note: did you mean 'xfs_rtgroup_intent_rele'?
   fs/xfs/xfs_drain.h:108:20: note: 'xfs_rtgroup_intent_rele' declared here
   static inline void xfs_rtgroup_intent_rele(struct xfs_rtgroup *rtg) { }
                      ^
>> fs/xfs/xfs_bmap_item.c:371:15: error: incompatible integer to pointer conversion assigning to 'struct xfs_rtgroup *' from 'int' [-Wint-conversion]
                           bi->bi_rtg = xfs_rtgroup_intent_get(mp, rgno);
                                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/xfs_bmap_item.c:398:4: error: call to undeclared function 'xfs_rtgroup_intent_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           xfs_rtgroup_intent_put(bi->bi_rtg);
                           ^
   6 warnings and 3 errors generated.
--
   In file included from fs/xfs/xfs_extfree_item.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/xfs/xfs_extfree_item.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/xfs/xfs_extfree_item.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> fs/xfs/xfs_extfree_item.c:493:20: error: call to undeclared function 'xfs_rtgroup_intent_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   xefi->xefi_rtg = xfs_rtgroup_intent_get(mp, rgno);
                                    ^
   fs/xfs/xfs_extfree_item.c:493:20: note: did you mean 'xfs_rtgroup_intent_rele'?
   fs/xfs/xfs_drain.h:108:20: note: 'xfs_rtgroup_intent_rele' declared here
   static inline void xfs_rtgroup_intent_rele(struct xfs_rtgroup *rtg) { }
                      ^
>> fs/xfs/xfs_extfree_item.c:493:18: error: incompatible integer to pointer conversion assigning to 'struct xfs_rtgroup *' from 'int' [-Wint-conversion]
                   xefi->xefi_rtg = xfs_rtgroup_intent_get(mp, rgno);
                                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/xfs_extfree_item.c:507:3: error: call to undeclared function 'xfs_rtgroup_intent_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   xfs_rtgroup_intent_put(xefi->xefi_rtg);
                   ^
   6 warnings and 3 errors generated.
--
   In file included from fs/xfs/xfs_rmap_item.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/xfs/xfs_rmap_item.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/xfs/xfs_rmap_item.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> fs/xfs/xfs_rmap_item.c:402:16: error: call to undeclared function 'xfs_rtgroup_intent_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ri->ri_rtg = xfs_rtgroup_intent_get(mp, rgno);
                                ^
   fs/xfs/xfs_rmap_item.c:402:16: note: did you mean 'xfs_rtgroup_intent_rele'?
   fs/xfs/xfs_drain.h:108:20: note: 'xfs_rtgroup_intent_rele' declared here
   static inline void xfs_rtgroup_intent_rele(struct xfs_rtgroup *rtg) { }
                      ^
>> fs/xfs/xfs_rmap_item.c:402:14: error: incompatible integer to pointer conversion assigning to 'struct xfs_rtgroup *' from 'int' [-Wint-conversion]
                   ri->ri_rtg = xfs_rtgroup_intent_get(mp, rgno);
                              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/xfs_rmap_item.c:416:3: error: call to undeclared function 'xfs_rtgroup_intent_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   xfs_rtgroup_intent_put(ri->ri_rtg);
                   ^
   6 warnings and 3 errors generated.


vim +/xfs_rtgroup_intent_get +371 fs/xfs/xfs_bmap_item.c

   357	
   358	/* Take a passive ref to the AG containing the space we're mapping. */
   359	void
   360	xfs_bmap_update_get_group(
   361		struct xfs_mount	*mp,
   362		struct xfs_bmap_intent	*bi)
   363	{
   364		xfs_agnumber_t		agno;
   365	
   366		if (xfs_ifork_is_realtime(bi->bi_owner, bi->bi_whichfork)) {
   367			if (xfs_has_rtgroups(mp)) {
   368				xfs_rgnumber_t	rgno;
   369	
   370				rgno = xfs_rtb_to_rgno(mp, bi->bi_bmap.br_startblock);
 > 371				bi->bi_rtg = xfs_rtgroup_intent_get(mp, rgno);
   372			} else {
   373				bi->bi_rtg = NULL;
   374			}
   375	
   376			return;
   377		}
   378	
   379		agno = XFS_FSB_TO_AGNO(mp, bi->bi_bmap.br_startblock);
   380	
   381		/*
   382		 * Bump the intent count on behalf of the deferred rmap and refcount
   383		 * intent items that that we can queue when we finish this bmap work.
   384		 * This new intent item will bump the intent count before the bmap
   385		 * intent drops the intent count, ensuring that the intent count
   386		 * remains nonzero across the transaction roll.
   387		 */
   388		bi->bi_pag = xfs_perag_intent_get(mp, agno);
   389	}
   390	
   391	/* Release a passive AG ref after finishing mapping work. */
   392	static inline void
   393	xfs_bmap_update_put_group(
   394		struct xfs_bmap_intent	*bi)
   395	{
   396		if (xfs_ifork_is_realtime(bi->bi_owner, bi->bi_whichfork)) {
   397			if (xfs_has_rtgroups(bi->bi_owner->i_mount)) {
 > 398				xfs_rtgroup_intent_put(bi->bi_rtg);
   399			}
   400			return;
   401		}
   402	
   403		xfs_perag_intent_put(bi->bi_pag);
   404	}
   405	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
