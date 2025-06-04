Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B82A2F56
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 15:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050440; cv=none; b=bQev89cXSLI5aUwmIM9W1UJKxdPhHCRQ8K/rQCIfpcKsZChtF2nHB3TEd1mBrWk+JXntl+KOrvZ99qFEv7d3GTHPmoJehb6Wb2La+iNOLMG5xwJACLyjydQFswvcsLcrY12SK4PSP/b4CgUhHJzzJxi/vkCN3hEyxc+GJQjjHdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050440; c=relaxed/simple;
	bh=Sembt8MzKdacvtITukxbklnmmkb0lW/eEeL1CSqVeTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BDrv2ltTO7HYXmEjyWcE9Yr1UTfatPmviJKTj9RT42/pGnkVVBEL0DBrIIEPYs/CM0ANo/ehUgk2b0RntlWt2MDQDrBFRPkAaor9oqB/wK/0Ecm2CiOAmmif6fWvrD11NIPydGZDTv8mwGLbRqjP8S5wCAiNv4MTnVfu46snHEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZV0qkJax; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZV0qkJax"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749050439; x=1780586439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sembt8MzKdacvtITukxbklnmmkb0lW/eEeL1CSqVeTg=;
  b=ZV0qkJax10sReDr1w3p9nZwjHvRGn8E//6XyDY2B96UsSGGLP5N3JdGP
   FJ3Mu59HC84fG9JtppWDgBmqdmj3wirtZdVPw+rcYnKOdgkDsn7La681M
   FwMcf6CownZ1Tu/S9n+uH/wN2wkWnTHL7s13ixDhba+Xl7xHUrshx5Pd0
   QxJMgxXbJK4XPTnlj7otukrBdlEemD5MVUnNZ1DJMF6BXubSHPoKr9dY7
   3et9Ap7cqenQdj4ZgWmkVJqPniSVlgbOb3uTE0GkVEIX9rlkitINi9u0t
   H9Iqnp7mqNcxNzwSjpgRPQJPDQ+tclOmVghonq0LGu4bzjNqpSKWj8glq
   w==;
X-CSE-ConnectionGUID: bXzzuwvTQMmaSLAQ0xTQ1Q==
X-CSE-MsgGUID: 0n9s04AFQNyIsom9r2vDCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="54802700"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="54802700"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 08:20:33 -0700
X-CSE-ConnectionGUID: DcWO7m3GTvSfcJuoydmyBA==
X-CSE-MsgGUID: EbYjeYcUS1u7if6oylgdqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="145550282"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Jun 2025 08:20:32 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMpun-0001jO-2W;
	Wed, 04 Jun 2025 15:20:29 +0000
Date: Wed, 4 Jun 2025 23:19:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 17/17]
 arch/x86/include/asm/pci_x86.h:241:9: error: call to undeclared function
 'pv_pci_mmcfg_readb'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202506042345.pvs8RyRn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   7d21e26cc9296ffd8d83440c989eb089f799f75c
commit: 3b88862f9b7f7434c1456fc15232238fa84e3a42 [17/17] ANDROID: x86/paravirt: Extend pv_mmio_ops to support pci mmcfg read and write
config: x86_64-randconfig-2003-20250604 (https://download.01.org/0day-ci/archive/20250604/202506042345.pvs8RyRn-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506042345.pvs8RyRn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506042345.pvs8RyRn-lkp@intel.com/

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
