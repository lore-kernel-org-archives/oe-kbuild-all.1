Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BC47E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 03:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7fIqspE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698981204; x=1730517204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7m/PJ76I4C6E8V9ERcl0DaLD3yHRQnSM6X7l3eDeGRE=;
  b=e7fIqspEaCEVY0IffUErxvkq1hxc92Eewh9kGXGS2hterWZ695sQQ4fY
   viLo2NMqUpSiCwxgVoXXZYYFxRt/WYRwl62cQnfqXEk8asG2aypy0Wbev
   BmPOdd2VOXKUMf87AMH6o59oG5dymZSKogP6okIM5Aoiz+XwBt7KTJV8Y
   pqygsNBmiGMxLr1NnsBGq6X7bqG5zoVrBD2/MrRSsZAruc71mC9chF++7
   saRgM+yD0q7h/Fqr+BTxD5KGqI+MSy0qwxE6p/0i/u7utI+dBtlNa7r7g
   lBjiQa4F1AG57d1kcrdQc9Nh1KswxrRhlk/WGnNtFjc8tTYE7+aSsrWuR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1742741"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="1742741"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 20:13:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="878488437"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="878488437"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Nov 2023 20:13:19 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qykcX-00029A-2E;
	Fri, 03 Nov 2023 03:13:17 +0000
Date: Fri, 3 Nov 2023 11:12:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:file-force-align 506/507] fs/xfs/xfs_bmap_util.c:1450:2:
 error: implicit declaration of function
 'trace_xfs_convert_bigalloc_file_space' is invalid in C99
Message-ID: <202311031101.1U5lK9TP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git file-force-align
head:   2f5d0685694a329d50ad1988293dc3f838d798ed
commit: 9560af7afefad8ce14877a40e356fb869ca7c785 [506/507] xfs: support reflink with force align enabled
config: powerpc-ppc64e_defconfig (https://download.01.org/0day-ci/archive/20231103/202311031101.1U5lK9TP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031101.1U5lK9TP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031101.1U5lK9TP-lkp@intel.com/

All errors (new ones prefixed by >>):

   ^
   arch/powerpc/include/asm/io.h:610:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/xfs/xfs_bmap_util.c:7:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:55:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:611:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/xfs/xfs_bmap_util.c:7:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:57:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:612:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/xfs/xfs_bmap_util.c:7:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:59:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:613:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/xfs/xfs_bmap_util.c:7:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:61:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:614:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> fs/xfs/xfs_bmap_util.c:1450:2: error: implicit declaration of function 'trace_xfs_convert_bigalloc_file_space' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           trace_xfs_convert_bigalloc_file_space(ip, pos, len);
           ^
   fs/xfs/xfs_bmap_util.c:1450:2: note: did you mean 'xfs_convert_bigalloc_file_space'?
   fs/xfs/xfs_bmap_util.c:1434:1: note: 'xfs_convert_bigalloc_file_space' declared here
   xfs_convert_bigalloc_file_space(
   ^
   12 warnings and 1 error generated.


vim +/trace_xfs_convert_bigalloc_file_space +1450 fs/xfs/xfs_bmap_util.c

d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1415  
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1416  /*
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1417   * Prepare a file with multi-fsblock allocation units for a remapping.
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1418   *
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1419   * File allocation units (AU) must be fully mapped to the data fork.  If the
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1420   * space in an AU have not been fully written, there can be multiple extent
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1421   * mappings (e.g. mixed written and unwritten blocks) to the AU.  If the log
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1422   * does not have a means to ensure that all remappings for a given AU will be
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1423   * completed even if the fs goes down, we must maintain the above constraint in
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1424   * another way.
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1425   *
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1426   * Convert the unwritten parts of an AU to written by writing zeroes to the
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1427   * storage and flipping the mapping.  Once this completes, there will be a
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1428   * single mapping for the entire AU, and we can proceed with the remapping
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1429   * operation.
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1430   *
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1431   * Callers must ensure that there are no dirty pages in the given range.
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1432   */
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1433  int
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1434  xfs_convert_bigalloc_file_space(
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1435  	struct xfs_inode	*ip,
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1436  	loff_t			pos,
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1437  	uint64_t		len)
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1438  {
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1439  	struct xfs_mount	*mp = ip->i_mount;
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1440  	xfs_fileoff_t		off;
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1441  	xfs_fileoff_t		endoff;
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1442  	int			error;
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1443  
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1444  	if (!xfs_inode_has_bigallocunit(ip))
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1445  		return 0;
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1446  
f05b39e060631e Darrick J. Wong 2023-03-06  1447  	off = xfs_rtb_rounddown_rtx(mp, XFS_B_TO_FSBT(mp, pos));
f05b39e060631e Darrick J. Wong 2023-03-06  1448  	endoff = xfs_rtb_roundup_rtx(mp, XFS_B_TO_FSB(mp, pos + len));
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1449  
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06 @1450  	trace_xfs_convert_bigalloc_file_space(ip, pos, len);
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1451  
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1452  	while (off < endoff) {
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1453  		if (fatal_signal_pending(current))
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1454  			return -EINTR;
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1455  
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1456  		error = xfs_convert_bigalloc_mapping(ip, &off, endoff);
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1457  		if (error)
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1458  			return error;
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1459  	}
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1460  
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1461  	return 0;
d0c6e4b2d648b8 Darrick J. Wong 2023-03-06  1462  }
2f1c2bb5cdbcf6 Darrick J. Wong 2023-03-06  1463  

:::::: The code at line 1450 was first introduced by commit
:::::: d0c6e4b2d648b8ae0382bb9e56bbf8c88e438646 xfs: make atomic extent swapping support realtime files

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
