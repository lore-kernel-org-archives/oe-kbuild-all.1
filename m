Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0084E27F19F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 05:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779340519; cv=none; b=A6hF6PUEowUhmTUh8DJ9FnUs0KG5P22PXEaKp0WnzorFY66ngM8/B1E0M/3NOddDEVViqlNoUMsYzCgZ3vQKbBD11JYJhpQKAAvxFDVbdIDI+oQgGvJV3fbc0oRmTBQ7r6kEHANqq97brZiStOJ+bY4W/qkD8swjriE0q22R6Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779340519; c=relaxed/simple;
	bh=T8l97CDPRSsYS93zGZe7zhqRzt7K9jl1HrJeqxovXfk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YBRax1iA3HuIcdbqg9b9RfDnX+t1hkf/OvhW5Q/zWbiu4GuXlX788X1n7C0g8/P4YXhOH3SyiQjnMI3MKOxvNdcB5nMn2DsOWimrk+p9BmdwH4VxRan/GknRFo3WXAVETPwIx7XqXaFknHFwdXCSPLO4GTpROR/dFxmub911AJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ewbi5iPp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ewbi5iPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779340518; x=1810876518;
  h=date:from:to:cc:subject:message-id;
  bh=T8l97CDPRSsYS93zGZe7zhqRzt7K9jl1HrJeqxovXfk=;
  b=Ewbi5iPp7HMIuijGkOAobQoXO462M/Su0FT94n8tyGp7M/3OTijhZx7G
   tEap1AGDywdrLLGTgVm2XCm0Zi/ATajMJRlBitUkL2CyTHIVbbmSH/c3l
   Nc3HJw6hZfmmIirQIatmPxW13HMd6abnyaE/JdYBrebDJkaT3WebjvlVj
   /KlFnIodHaKH8pOKPNg1h5LUsFeo0rFT3rr97T8d5GNQ/mMJeo6wU2l3z
   zVbhgMGYS/NKTRyAmUysdnnGvLste31TbmkpTJ3lAl0+Xo91zoJqclqEd
   edmZN+Mg8aVJWmUJxkbBybjMN5ypiZNVEjfnyfxIc32ZjtR+UtOGn8SCv
   w==;
X-CSE-ConnectionGUID: yfXZWF2fRzSX0p9qybVKQA==
X-CSE-MsgGUID: IEvV3lBrQ6W8HFGot/0srA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97823762"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="97823762"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 22:15:17 -0700
X-CSE-ConnectionGUID: R7iSp4TqT7SKU+0TjupLfg==
X-CSE-MsgGUID: OiMMUI1pRyesWuKYGpLikQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="263941243"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 May 2026 22:15:16 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPvkN-000000004RR-1Sxq;
	Thu, 21 May 2026 05:15:05 +0000
Date: Thu, 21 May 2026 13:14:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/2]
 arch/x86/include/asm/pci_x86.h:241:9: error: call to undeclared function
 'pv_pci_mmcfg_readb'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202605211308.MkGdHAGN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Chuanxiao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   f26b61355a1b5a3b8286d5bddc7a3fa5a5191317
commit: 86e78ec63732935a6f2f6d269905eb2e4cacfb21 [0/2] ANDROID: x86/paravirt: Extend pv_mmio_ops to support pci mmcfg read and write
config: x86_64-randconfig-075-20260521 (https://download.01.org/0day-ci/archive/20260521/202605211308.MkGdHAGN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211308.MkGdHAGN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211308.MkGdHAGN-lkp@intel.com/

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
