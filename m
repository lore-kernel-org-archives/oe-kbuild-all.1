Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B8935E939
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 23:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668247; cv=none; b=uXXJw87kDrGKdKaqijDWuPcfg1nLC3IUoikbXWarNYlUbpDB2pilWoPJceey7oSWbfqLay3WgqyyMAsvSSvMZTsRVR9+anj9kCskSwZ58PYnNdqM02kFNiPGtNImOi3DT7M9Ydi3a1DzXcR+5cMd56cGfTifTRfx0zMLSUk69YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668247; c=relaxed/simple;
	bh=5T53kg50OU6Haz/ywzYLQqQq8OfeY14enqVyK5bgBBs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ehYBauiqhvwZCd8jrunm197UfjlwM+IAXCzBMYU2jNJCQG1o0Bs4HP0LrmWeCOE0zOYaxoCRAivu+yIIJn/g/iNnw1DsaXJIcxXBKk56KVztDHP4Ds2X+KBS9brAH/a0n6kudXXhPy3HRvYHHGkSm7F5NOZ4Y4G7gS01iw0HdoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqoTqqzW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqoTqqzW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772668246; x=1804204246;
  h=date:from:to:cc:subject:message-id;
  bh=5T53kg50OU6Haz/ywzYLQqQq8OfeY14enqVyK5bgBBs=;
  b=lqoTqqzWOJ4NyftokXSIdgd00Quqpb5MmOVWWMpAAUmYQD1Rz/zDxtRk
   fSW1Thk6pRxThaksj5/1imGg7jPn/o0Fpx5q9V1OjBL2apPdvq4abhmy9
   X2ObuHy3gtlnCv3ndm9HVOmLGxgaxCG8yvEgXrqptkfuE5w3V5f864jIT
   WvXuy7BjawgTR3a730VLO42UNZ5hFWAZ7VBHxXLNecoJuhy21u3FU6fX9
   Gp7+UCHNXCZSoFpCciFSi+Z7IQI+uzlKBTU1/Z9EClk7ZOgmLj/Zm1HVm
   sVECDFqD1HPQheyMiOYW09ZLprA89wmztyRhianTZJ2IOfWdgG12pk6h1
   g==;
X-CSE-ConnectionGUID: 1xLb/6YvQKekxdU2YIMKUw==
X-CSE-MsgGUID: kLmcJUCJS0iUMMjdxusENw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="85090584"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="85090584"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 15:50:44 -0800
X-CSE-ConnectionGUID: 9Y7W5xswRgO/Qwo2r//Nhw==
X-CSE-MsgGUID: OMb86+4QRUyuIkgqVK2sAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="216339420"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Mar 2026 15:50:43 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxvzF-000000004iT-052h;
	Wed, 04 Mar 2026 23:50:41 +0000
Date: Thu, 05 Mar 2026 07:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-laj 1/1]
 arch/x86/include/asm/pci_x86.h:241:9: error: call to undeclared function
 'pv_pci_mmcfg_readb'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202603050727.4NJmn5Tm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-laj
head:   595daaae8397c27158e7b67211859925d3dd2338
commit: 86e78ec63732935a6f2f6d269905eb2e4cacfb21 [1/1] ANDROID: x86/paravirt: Extend pv_mmio_ops to support pci mmcfg read and write
config: x86_64-randconfig-161-20260305 (https://download.01.org/0day-ci/archive/20260305/202603050727.4NJmn5Tm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050727.4NJmn5Tm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050727.4NJmn5Tm-lkp@intel.com/

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
