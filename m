Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA3832D42A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 04:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765858282; cv=none; b=KxrQbp12vXzlMhPYbn/QLvXQimg3Bo5wusgBqfeaaCGftVbwZEWOFvtiXw/wUgl/962oHvxphE/zPeayKqS/pE4Ydr0lWYw9+rk2kcERPcsJhq9WBBXzFVxPz2O073iHDXVBWvcvbmPdbfr+fPB2LTnrxirV2kFDdmPYWMsnpD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765858282; c=relaxed/simple;
	bh=hhGGkIF9BwG90c791r32bprST8TiBkMOQlBQjjcRP48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pN4tbW5stMFAF58I1M5QeEhDmA6mRiy2O3zqB8YhA2AHYIM6OVjMUFJLN7rg3y2LASShLWUffaBXkKABhQPdpqQgtSIjqbY2F7qCAMwxbQisupo+2Xlka1gqtbbELTcQnYBmITr6DBf3FQ6bRWHewdlTCmhixUx6sFrykTIrNwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKmL6hZc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKmL6hZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765858271; x=1797394271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hhGGkIF9BwG90c791r32bprST8TiBkMOQlBQjjcRP48=;
  b=AKmL6hZcwVSUsXeMi23n0EGp+CYWIEbE+3SLLxYo9y1Tl6d7M28JnSMr
   5KzKAgC/AQDi/9EgC6U0uc+xGJr0FxsNFnArAUSLdcrxWQhizMQG4/Dl7
   wz/RQzuvWsgAzF7ZRJoD9WBTr7RpJ34y6lUA4mdy0MkgkvPIOpRdFweiK
   mdPXwPJ0o+AE3JXv0RyVFEfOJuCcmy61n3FGtDeFVKAXeF55aiA8Dqv5f
   VyisddAZyK1Orj/InAGAfKHcK6B8bHUPacCpYdY0tIJ40a6poEGWPV9H+
   YgllcjtwK476Pf6WEiMqVydST/IYUAwxYxfh3o7hKk/CVmH7b3erWcihv
   g==;
X-CSE-ConnectionGUID: p2FY/QwMS2ma3Ge4g6axwA==
X-CSE-MsgGUID: SSLSQ0+CQKC/UZRCTNkJPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="55335769"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="55335769"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 20:11:06 -0800
X-CSE-ConnectionGUID: ZEn3V5brR6KJKYdy5Ho0bQ==
X-CSE-MsgGUID: O17KlCGKRkuw26+5HscxBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="228577763"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Dec 2025 20:11:05 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVMOt-00000000195-05V3;
	Tue, 16 Dec 2025 04:11:03 +0000
Date: Tue, 16 Dec 2025 12:10:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/2]
 arch/x86/include/asm/pci_x86.h:241:16: error: implicit declaration of
 function 'pv_pci_mmcfg_readb'; did you mean 'pci_mmcfg_readb'?
Message-ID: <202512161256.mJm75FYV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chuanxiao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1d988c988f0fc2f9a25a9cd9da5d96e8f8f12c84
commit: 3b88862f9b7f7434c1456fc15232238fa84e3a42 [0/2] ANDROID: x86/paravirt: Extend pv_mmio_ops to support pci mmcfg read and write
config: x86_64-randconfig-006-20251216 (https://download.01.org/0day-ci/archive/20251216/202512161256.mJm75FYV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161256.mJm75FYV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161256.mJm75FYV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/resource.c:5:
   arch/x86/include/asm/pci_x86.h: In function 'mmio_config_readb':
>> arch/x86/include/asm/pci_x86.h:241:16: error: implicit declaration of function 'pv_pci_mmcfg_readb'; did you mean 'pci_mmcfg_readb'? [-Wimplicit-function-declaration]
     241 |         return pv_pci_mmcfg_readb(pos);
         |                ^~~~~~~~~~~~~~~~~~
         |                pci_mmcfg_readb
   arch/x86/include/asm/pci_x86.h: In function 'mmio_config_readw':
>> arch/x86/include/asm/pci_x86.h:246:16: error: implicit declaration of function 'pv_pci_mmcfg_readw'; did you mean 'pci_mmcfg_readw'? [-Wimplicit-function-declaration]
     246 |         return pv_pci_mmcfg_readw(pos);
         |                ^~~~~~~~~~~~~~~~~~
         |                pci_mmcfg_readw
   arch/x86/include/asm/pci_x86.h: In function 'mmio_config_readl':
>> arch/x86/include/asm/pci_x86.h:251:16: error: implicit declaration of function 'pv_pci_mmcfg_readl'; did you mean 'pci_mmcfg_readl'? [-Wimplicit-function-declaration]
     251 |         return pv_pci_mmcfg_readl(pos);
         |                ^~~~~~~~~~~~~~~~~~
         |                pci_mmcfg_readl
   arch/x86/include/asm/pci_x86.h: In function 'mmio_config_writeb':
>> arch/x86/include/asm/pci_x86.h:256:9: error: implicit declaration of function 'pv_pci_mmcfg_writeb'; did you mean 'pci_mmcfg_writeb'? [-Wimplicit-function-declaration]
     256 |         pv_pci_mmcfg_writeb(val, pos);
         |         ^~~~~~~~~~~~~~~~~~~
         |         pci_mmcfg_writeb
   arch/x86/include/asm/pci_x86.h: In function 'mmio_config_writew':
>> arch/x86/include/asm/pci_x86.h:261:9: error: implicit declaration of function 'pv_pci_mmcfg_writew'; did you mean 'pci_mmcfg_writew'? [-Wimplicit-function-declaration]
     261 |         pv_pci_mmcfg_writew(val, pos);
         |         ^~~~~~~~~~~~~~~~~~~
         |         pci_mmcfg_writew
   arch/x86/include/asm/pci_x86.h: In function 'mmio_config_writel':
>> arch/x86/include/asm/pci_x86.h:266:9: error: implicit declaration of function 'pv_pci_mmcfg_writel'; did you mean 'pci_mmcfg_writel'? [-Wimplicit-function-declaration]
     266 |         pv_pci_mmcfg_writel(val, pos);
         |         ^~~~~~~~~~~~~~~~~~~
         |         pci_mmcfg_writel


vim +241 arch/x86/include/asm/pci_x86.h

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
