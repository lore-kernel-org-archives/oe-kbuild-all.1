Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E5B22F75D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 11:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748000269; cv=none; b=hkzrShM5Ybv6xm2+DyujQNKezOy4+o8xOk12k5wkLQ7BK5xN3HWpzIkzBnIDa6QM79Uw9ujgwCvT8PdW9LDt0xYdLglnt7wQsZm2dj0AysaWI/B3iKRX0OVLpbZX6hDavN1kY6a41KAGwYgCORE4SMOBuUBJOuYPEi8RphJ2bFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748000269; c=relaxed/simple;
	bh=6lUAc40t0zp3JjZhD/GJG7fOpFX0CCAe4sprmXYtIYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AcF9q17jmFBDzBuqkLRTD3p8ZLnVNx1kY09k9jiyk3L7zHl20sOiMW3xa2aQxKDHXegjTYzqtvG0mTv9EWkwhh1HMSwMi9FNYKD7lx2J5qg1phXyW6Psi61BjYeM9YSLnmlV+YNaiQAMlN4nVaVuPJxdFeVbPa5poRvPbzpK74s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1i/Mjj1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1i/Mjj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748000268; x=1779536268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6lUAc40t0zp3JjZhD/GJG7fOpFX0CCAe4sprmXYtIYQ=;
  b=R1i/Mjj1cn8pEnQbac5RnS458MPpTCUmzCqnq53rHKfPPsYCKcYi/2ox
   /qvyA+VVF1oDCHbJPsPzVfhzlEu17wxx6+pRINvTQC73LWvf1CtPSGAdu
   deX42diBv/hguUmmdksm66tmR/ZPogdWNmHiNZOFYnY2PoTqlPipvd4d2
   BqDTBSbFEpqyReBo/YRWUsKoVWLJDJ+Z6fcH19dzKrNJZ0EUS/G1tg1bn
   sZx+4wE05t28bOLWxHP0zE25ucOeiAN3Nrrifl6R01PnynGkyWPLjatfz
   lk/h2VQ23gsHtTGpRLIHQikb68ODIYV9n8iWQnnqiCQwwL6PJ3CMli/g+
   w==;
X-CSE-ConnectionGUID: LoZxzZTsSuO6asIiwHoqGg==
X-CSE-MsgGUID: I2o6SzbCQQKYv5/k5jlkFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50218522"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="50218522"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 04:37:47 -0700
X-CSE-ConnectionGUID: 4+PWaNCUQ++t1JvQTTQRSg==
X-CSE-MsgGUID: mrzWnyZmT7iTEgkQfR7RNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="141171930"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 May 2025 04:37:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIQid-000QL0-0A;
	Fri, 23 May 2025 11:37:43 +0000
Date: Fri, 23 May 2025 19:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.14/zen-sauce 2/35] include/asm-generic/io.h:549:31: error:
 performing pointer arithmetic on a null pointer has undefined behavior
Message-ID: <202505231917.J74JseMp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jan,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 6.14/zen-sauce
head:   364ae676d7695faebb72009f89a1ed042c351033
commit: 6d141e3121676e9ca50d6465a622b9a5d572219a [2/35] ZEN: Add VHBA driver
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250523/202505231917.J74JseMp-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505231917.J74JseMp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505231917.J74JseMp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/vhba/vhba.c:27:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
>> include/asm-generic/io.h:549:31: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/scsi/vhba/vhba.c:27:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/scsi/vhba/vhba.c:27:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   drivers/scsi/vhba/vhba.c:192:23: error: variable 'vhost' set but not used [-Werror,-Wunused-but-set-variable]
     192 |     struct vhba_host *vhost;
         |                       ^
   drivers/scsi/vhba/vhba.c:541:25: error: use of undeclared identifier 'BLK_TAG_ALLOC_RR'
     541 |     .tag_alloc_policy = BLK_TAG_ALLOC_RR,
         |                         ^
   14 errors generated.
--
   In file included from vhba.c:27:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
>> include/asm-generic/io.h:549:31: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from vhba.c:27:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from vhba.c:27:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   vhba.c:192:23: error: variable 'vhost' set but not used [-Werror,-Wunused-but-set-variable]
     192 |     struct vhba_host *vhost;
         |                       ^
   vhba.c:541:25: error: use of undeclared identifier 'BLK_TAG_ALLOC_RR'
     541 |     .tag_alloc_policy = BLK_TAG_ALLOC_RR,
         |                         ^
   14 errors generated.


vim +549 include/asm-generic/io.h

3f7e212df82ca0 Arnd Bergmann   2009-05-13  534  
9216efafc52ff9 Thierry Reding  2014-10-01  535  /*
9216efafc52ff9 Thierry Reding  2014-10-01  536   * {in,out}{b,w,l}() access little endian I/O. {in,out}{b,w,l}_p() can be
9216efafc52ff9 Thierry Reding  2014-10-01  537   * implemented on hardware that needs an additional delay for I/O accesses to
9216efafc52ff9 Thierry Reding  2014-10-01  538   * take effect.
9216efafc52ff9 Thierry Reding  2014-10-01  539   */
9216efafc52ff9 Thierry Reding  2014-10-01  540  
f009c89df79abe John Garry      2020-03-28  541  #if !defined(inb) && !defined(_inb)
f009c89df79abe John Garry      2020-03-28  542  #define _inb _inb
6f043e75744596 Niklas Schnelle 2024-10-24  543  #ifdef CONFIG_HAS_IOPORT
214ba3584b2e2c Stafford Horne  2020-07-26  544  static inline u8 _inb(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  545  {
87fe2d543f8173 Sinan Kaya      2018-04-05  546  	u8 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  547  
87fe2d543f8173 Sinan Kaya      2018-04-05  548  	__io_pbr();
87fe2d543f8173 Sinan Kaya      2018-04-05 @549  	val = __raw_readb(PCI_IOBASE + addr);
abbbbc83a210e9 Will Deacon     2019-02-22  550  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  551  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  552  }
6f043e75744596 Niklas Schnelle 2024-10-24  553  #else
6f043e75744596 Niklas Schnelle 2024-10-24  554  u8 _inb(unsigned long addr)
6f043e75744596 Niklas Schnelle 2024-10-24  555  	__compiletime_error("inb()) requires CONFIG_HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  556  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  557  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  558  

:::::: The code at line 549 was first introduced by commit
:::::: 87fe2d543f817300e13f0ea683f38c122737856e io: change inX() to have their own IO barrier overrides

:::::: TO: Sinan Kaya <okaya@codeaurora.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
