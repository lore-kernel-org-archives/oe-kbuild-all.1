Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163CF58126
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 14:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707836040; cv=none; b=PrKANOkU1ee3MUf2R6I9dS9LhDT6ZLU+gjyBLb/vEtwMKFdGDwhGE/fU+u9gowm2n06fZhMxU5evIwmQQnzJH14OLuavL2qILG2SeJh/rchUScpahLbcSZKtscJWe0BVTVJgGnYiyAw3333BHNrNVWOGVhDdLpbGE09aiawf/PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707836040; c=relaxed/simple;
	bh=GHHRRaDjU9xIS5j8nJqTG53N81m+3PnPDZvJk4w7tHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nJB+jFEa4JccBToJ6hT04raYdjRLklouaGwrBqrgwSRT8GfTluC6feirYYac83SGldPhHn0yRfM2NzTQGWdE36OR0OqecOPDnLFivhPZVd3a3enCkQsUaeFmvpmsW06ykkLiBgPoEGo8ZeGXm7nd/pJf359wychfbOzfq6o6A3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b7PDkxAz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b7PDkxAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707836038; x=1739372038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GHHRRaDjU9xIS5j8nJqTG53N81m+3PnPDZvJk4w7tHg=;
  b=b7PDkxAzzHzvmLK9anxVCfZRYODW94xRYlhAOvtTca2NdZSBvMBOzAnK
   EfykO8Er/WApcYVsre/k7HBzrLXJxhEvPr8eCRJFwf8bpK/AeFKqP3kKl
   B8lBIVhAXYprj9SR25aqAG6Q4ER57Io1kzs++puBgAHF/2t2e6L0izNE6
   FxXNT3J2Jh3fv6r5LtAlcBe0YFaT6qH99Prq31xAjkAhON4ZF1MWxfVOv
   IWl3PlNw0ABULpLDZ3UAeFiArT7j29rYoW3IAzBwzID+mo8e0BSrmbeAv
   HSGEUoLp8jzHYuZu6QDZ54AMIwW+Vh22uREjrVyQTQTpa0+c/0MNl8bKd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13239178"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="13239178"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 06:53:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="2858171"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Feb 2024 06:53:56 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZuAU-0007oe-0v;
	Tue, 13 Feb 2024 14:53:54 +0000
Date: Tue, 13 Feb 2024 22:53:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:health-monitoring 569/572] fs/xfs/xfs_healthmon.c:318:2:
 warning: label at end of compound statement is a C23 extension
Message-ID: <202402132245.H3DJUhHS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring
head:   9f39f2084cebe475618d869d62b32230a7729b0d
commit: 54d827a535b03f718b188ecd3a79abebe47fa20e [569/572] xfs: report metadata health events through healthmon
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240213/202402132245.H3DJUhHS-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project c08b90c50bcac9f3f563c79491c8dbcbe7c3b574)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240213/202402132245.H3DJUhHS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402132245.H3DJUhHS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/xfs/xfs_healthmon.c:6:
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
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/xfs/xfs_healthmon.c:6:
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
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/xfs/xfs_healthmon.c:6:
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
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/xfs/xfs_healthmon.c:318:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
     318 |         }
         |         ^
   7 warnings generated.


vim +318 fs/xfs/xfs_healthmon.c

   302	
   303	static inline enum xfs_healthmon_domain
   304	health_update_to_domain(
   305		enum xfs_health_update_domain	domain)
   306	{
   307		switch (domain) {
   308		case XFS_HEALTHUP_FS:
   309			return XFS_HEALTHMON_FS;
   310		case XFS_HEALTHUP_RT:
   311			return XFS_HEALTHMON_RT;
   312		case XFS_HEALTHUP_AG:
   313			return XFS_HEALTHMON_AG;
   314		case XFS_HEALTHUP_INODE:
   315			return XFS_HEALTHMON_INODE;
   316		case XFS_HEALTHUP_RTGROUP:
   317			/* static checking */
 > 318		}
   319		return XFS_HEALTHMON_RTGROUP;
   320	}
   321	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
