Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074C53A4535
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 12:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356856; cv=none; b=kI/y5UhEOvQZ2C4UygkMnD3reKeGYc+lfFvMXdWE5LTC5pSnVrtRHqESN7oV+UTgjk4UmDkESpMWB04pbB5hHmFNOxg48JK09EAg0JoBLSGbNwTBqV69XO0dwFCtUU8y9oECinrbunITpuXQ1eixHmbUpCafDfEiQmvKGCyQGTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356856; c=relaxed/simple;
	bh=KxfqkOQ9FUx1RXXoXPb/x6LFQ4yubBBmVVA04Uj33+s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oI45pkP6VTWLCGSKQLGhSR1QmpbqGv84/2FjJFT9BbCKvbD5gq1uVZkq+U2mQTYzxf+lHv9dsABKEdzLfxc+iFCiYQ7xceglABKq8nCJWKh7LO5GmOQGcO89M98i2YzYk1mgFal1swxq/O7vhAe07rjC8gnXrRjN0x4HLhqQ6bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONP2UdbO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONP2UdbO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774356853; x=1805892853;
  h=date:from:to:cc:subject:message-id;
  bh=KxfqkOQ9FUx1RXXoXPb/x6LFQ4yubBBmVVA04Uj33+s=;
  b=ONP2UdbO0+BfSj9aGWD4O7A4vh4xhBUgs1X34o0NGVMC3eOHa5jG8vLS
   G2xY5q8hM7bYk+pT15fV7vbT8sFn9FJDOFND+VaYqw9Tj9h2AlnS1ZdYu
   j99DFHGNbsUI+8gBejS+HDxsimf5Wekz8qZwX0tw7DBkkDq77QHeaomvR
   wZm/43pjSGE2RBecAaLMNWipOeXKN4tXhIO3bk9Q7Y3U1BSf/1zErNvGP
   ohSqz+sKOKMY/UiGq+xOrb6cVvwJAzpadF2LcUKMKbgAtryje2GwxkbHy
   UyNavS9tp9lW+qgcn0qw/YlvS7p73Biu5oAIhuakActtdcJo6HIGayPFm
   g==;
X-CSE-ConnectionGUID: LPPrt0wLTBuHDftwz8CVfg==
X-CSE-MsgGUID: kUILoWgUQBu3fNSV2J1BUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="77973667"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="77973667"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 05:54:12 -0700
X-CSE-ConnectionGUID: 3k4wzF1FT1aZ/8gvYgBIHg==
X-CSE-MsgGUID: 8iWtphu/T62OEWk+zLrg8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247423196"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Mar 2026 05:54:10 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w51Gp-000000004ZJ-4AY4;
	Tue, 24 Mar 2026 12:54:07 +0000
Date: Tue, 24 Mar 2026 20:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 41/41]
 arch/x86/include/asm/pci_x86.h:241:9: error: call to undeclared function
 'pv_pci_mmcfg_readb'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202603242052.KueVuDRu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Chuanxiao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2d13a0e00b4d9cf3601b0e0d2c1838ec962f4e88
commit: 3b88862f9b7f7434c1456fc15232238fa84e3a42 [41/41] ANDROID: x86/paravirt: Extend pv_mmio_ops to support pci mmcfg read and write
config: i386-randconfig-004-20260324 (https://download.01.org/0day-ci/archive/20260324/202603242052.KueVuDRu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603242052.KueVuDRu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603242052.KueVuDRu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/resource.c:5:
>> arch/x86/include/asm/pci_x86.h:241:9: error: call to undeclared function 'pv_pci_mmcfg_readb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     241 |         return pv_pci_mmcfg_readb(pos);
         |                ^
   arch/x86/include/asm/pci_x86.h:241:9: note: did you mean 'pci_mmcfg_readb'?
   arch/x86/include/asm/pci_x86.h:202:29: note: 'pci_mmcfg_readb' declared here
     202 | static inline unsigned char pci_mmcfg_readb(const volatile void __iomem *pos)
         |                             ^
>> arch/x86/include/asm/pci_x86.h:246:9: error: call to undeclared function 'pv_pci_mmcfg_readw'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     246 |         return pv_pci_mmcfg_readw(pos);
         |                ^
   arch/x86/include/asm/pci_x86.h:246:9: note: did you mean 'pci_mmcfg_readw'?
   arch/x86/include/asm/pci_x86.h:209:30: note: 'pci_mmcfg_readw' declared here
     209 | static inline unsigned short pci_mmcfg_readw(const volatile void __iomem *pos)
         |                              ^
>> arch/x86/include/asm/pci_x86.h:251:9: error: call to undeclared function 'pv_pci_mmcfg_readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     251 |         return pv_pci_mmcfg_readl(pos);
         |                ^
   arch/x86/include/asm/pci_x86.h:251:9: note: did you mean 'pci_mmcfg_readl'?
   arch/x86/include/asm/pci_x86.h:216:28: note: 'pci_mmcfg_readl' declared here
     216 | static inline unsigned int pci_mmcfg_readl(const volatile void __iomem *pos)
         |                            ^
>> arch/x86/include/asm/pci_x86.h:256:2: error: call to undeclared function 'pv_pci_mmcfg_writeb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     256 |         pv_pci_mmcfg_writeb(val, pos);
         |         ^
   arch/x86/include/asm/pci_x86.h:256:2: note: did you mean 'pci_mmcfg_writeb'?
   arch/x86/include/asm/pci_x86.h:223:20: note: 'pci_mmcfg_writeb' declared here
     223 | static inline void pci_mmcfg_writeb(unsigned char val, volatile void __iomem *pos)
         |                    ^
>> arch/x86/include/asm/pci_x86.h:261:2: error: call to undeclared function 'pv_pci_mmcfg_writew'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     261 |         pv_pci_mmcfg_writew(val, pos);
         |         ^
   arch/x86/include/asm/pci_x86.h:261:2: note: did you mean 'pci_mmcfg_writew'?
   arch/x86/include/asm/pci_x86.h:228:20: note: 'pci_mmcfg_writew' declared here
     228 | static inline void pci_mmcfg_writew(unsigned short val, volatile void __iomem *pos)
         |                    ^
>> arch/x86/include/asm/pci_x86.h:266:2: error: call to undeclared function 'pv_pci_mmcfg_writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     266 |         pv_pci_mmcfg_writel(val, pos);
         |         ^
   arch/x86/include/asm/pci_x86.h:266:2: note: did you mean 'pci_mmcfg_writel'?
   arch/x86/include/asm/pci_x86.h:233:20: note: 'pci_mmcfg_writel' declared here
     233 | static inline void pci_mmcfg_writel(unsigned int val, volatile void __iomem *pos)
         |                    ^
   6 errors generated.


vim +/pv_pci_mmcfg_readb +241 arch/x86/include/asm/pci_x86.h

   237	
   238	#ifdef CONFIG_PARAVIRT
   239	static inline unsigned char mmio_config_readb(void __iomem *pos)
   240	{
 > 241		return pv_pci_mmcfg_readb(pos);
   242	}
   243	
   244	static inline unsigned short mmio_config_readw(void __iomem *pos)
   245	{
 > 246		return pv_pci_mmcfg_readw(pos);
   247	}
   248	
   249	static inline unsigned int mmio_config_readl(void __iomem *pos)
   250	{
 > 251		return pv_pci_mmcfg_readl(pos);
   252	}
   253	
   254	static inline void mmio_config_writeb(void __iomem *pos, u8 val)
   255	{
 > 256		pv_pci_mmcfg_writeb(val, pos);
   257	}
   258	
   259	static inline void mmio_config_writew(void __iomem *pos, u16 val)
   260	{
 > 261		pv_pci_mmcfg_writew(val, pos);
   262	}
   263	
   264	static inline void mmio_config_writel(void __iomem *pos, u32 val)
   265	{
 > 266		pv_pci_mmcfg_writel(val, pos);
   267	}
   268	#else
   269	static inline unsigned char mmio_config_readb(void __iomem *pos)
   270	{
   271		return pci_mmcfg_readb(pos);
   272	}
   273	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
