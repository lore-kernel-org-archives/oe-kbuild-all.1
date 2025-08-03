Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC7A262A6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 15:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754233974; cv=none; b=pbdGAyavAx3w+UJDlL6HzeiXxqFCa5R6D2bdPBLBheCg4AEIcZZ6IaaQvJKjoVH2BHuX/AwISVHPrpch819KntLWoRrr2jAPCluKlq7Lu6iFGYIatbXsnUYaM5GkoJvRctT/fX02MfI75ioV/zdm+xnfuWSBAZHmJreyNSt4XxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754233974; c=relaxed/simple;
	bh=snBiEJH85WbOEp0FgxwnNSeXxKIz34sOAKxjaOOJMxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NsNY/TIWXS86mD9CFU51376754t3U9Y4MJMPBN792R+anmVnE4PqWnis/0iZ0cMz4tgJXA15iRTEu1/oTclSdWmmjc6llcOT7JeMcknNr6lwVziGczT3lkHE9TXvT7x4hn93UlNG/vuybdLtXnz2VQUAIKIfwfyzx/ITHwcxwMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbJiOGU/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbJiOGU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754233973; x=1785769973;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=snBiEJH85WbOEp0FgxwnNSeXxKIz34sOAKxjaOOJMxU=;
  b=EbJiOGU/4E6RX8FYIV8bDAUfRkxBXKhx585J+hxdlKXGHFPagpkvlrCN
   nnqUOCOs4y8BqpeUsD3esgbvoJ9LXjZ6n1gfrBjWlpiP/EHlfR+3vz9dO
   U23ExvNKNP50TXjLNqtCH0OmgbwnYHSrAig9EhMWo50fXqJ8TgP657oqK
   e+L2GJaoR7+bnstO9IGJM8NGdUzBrrtZy8OV/lplviY3y4FdkIZUe317o
   DcpK3peAcsYiCQPxEMsddi6bB7Vf2bkKpUDLjuvzrtx6d2w/ZFNkh5meG
   hXSluaDWgzUm9DNeCTXn8lvugoh7/at4iGwljFBHM9YQCqhLjsMhmnPXx
   w==;
X-CSE-ConnectionGUID: xbQQNQcPQ4+jD6Hp+uzT6Q==
X-CSE-MsgGUID: HwtqWuGtTw2N5bYFiLw09g==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="56468904"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56468904"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 08:12:52 -0700
X-CSE-ConnectionGUID: e/bieDySSS+1lj/eOFmTMg==
X-CSE-MsgGUID: UgMJblywTyCnwgkUOaauiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168142133"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Aug 2025 08:12:51 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiaOH-0006WG-25;
	Sun, 03 Aug 2025 15:12:49 +0000
Date: Sun, 3 Aug 2025 23:11:59 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.16/zen-sauce 2/31] include/asm-generic/io.h:1175:55: error:
 performing pointer arithmetic on a null pointer has undefined behavior
Message-ID: <202508032322.LpwfFq6H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/zen-kernel/zen-kernel 6.16/zen-sauce
head:   08d11019f3924f192e1a68d7d2007f8ec7bdf889
commit: fff64147d7411e03ec87ec1f9716fe5795dbdfd1 [2/31] ZEN: Add VHBA driver
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250803/202508032322.LpwfFq6H-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508032322.LpwfFq6H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508032322.LpwfFq6H-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/vhba/vhba.c:27:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
>> include/asm-generic/io.h:1175:55: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   drivers/scsi/vhba/vhba.c:192:23: error: variable 'vhost' set but not used [-Werror,-Wunused-but-set-variable]
     192 |     struct vhba_host *vhost;
         |                       ^
   2 errors generated.
--
   In file included from vhba.c:27:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
>> include/asm-generic/io.h:1175:55: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   vhba.c:192:23: error: variable 'vhost' set but not used [-Werror,-Wunused-but-set-variable]
     192 |     struct vhba_host *vhost;
         |                       ^
   2 errors generated.


vim +1175 include/asm-generic/io.h

7c566bb5e4d5fb Hector Martin    2021-02-11  1167  
ce816fa88cca08 Uwe Kleine-König 2014-04-07  1168  #ifdef CONFIG_HAS_IOPORT_MAP
3f7e212df82ca0 Arnd Bergmann    2009-05-13  1169  #ifndef CONFIG_GENERIC_IOMAP
9216efafc52ff9 Thierry Reding   2014-10-01  1170  #ifndef ioport_map
9216efafc52ff9 Thierry Reding   2014-10-01  1171  #define ioport_map ioport_map
3f7e212df82ca0 Arnd Bergmann    2009-05-13  1172  static inline void __iomem *ioport_map(unsigned long port, unsigned int nr)
3f7e212df82ca0 Arnd Bergmann    2009-05-13  1173  {
500dd232449e7c Andrew Murray    2018-09-13  1174  	port &= IO_SPACE_LIMIT;
500dd232449e7c Andrew Murray    2018-09-13 @1175  	return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
3f7e212df82ca0 Arnd Bergmann    2009-05-13  1176  }
316e8d79a0959c Linus Torvalds   2021-09-19  1177  #define ARCH_HAS_GENERIC_IOPORT_MAP
9216efafc52ff9 Thierry Reding   2014-10-01  1178  #endif
3f7e212df82ca0 Arnd Bergmann    2009-05-13  1179  

:::::: The code at line 1175 was first introduced by commit
:::::: 500dd232449e7c07500e713dc6970aa713f8e4f1 asm-generic: io: Fix ioport_map() for !CONFIG_GENERIC_IOMAP && CONFIG_INDIRECT_PIO

:::::: TO: Andrew Murray <andrew.murray@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
