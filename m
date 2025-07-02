Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250AE3196BE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 15:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470955; cv=none; b=mbDLmtVbH5Y3axQC1Coh7IpCjHzrNqxHGNpm1+ewuF3GcKzMORvUm3HznbUySgRz3ADwVYkTom9OORbIcvfuRugyQTHahEt6Rki8j3+0Y79AWkXqnMeYpID9EH/attJNO20PmiKRbmeISzlnHeX3Hrox0h57A0+TFRlHcT1ZGPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470955; c=relaxed/simple;
	bh=jeLodGa6ydGulxvvaarnA3o1V2WefGQJYBwIOEIn6G0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rOq6GGwdmxLR0GtuIZ3E8Gd0DWm7Yx49v3CA+MRK48pgCYX5rUaRxma3OoSPIfjTrgpPb9p4w0RnEzc9Fnc0nK18MLUUvVA0i9A29MEKi1p/PhOMULY99loZdLa/x8xRG718/eBVXuMpcJRIuJJJ5fFBXXPhf8JoSm0EGvyLxcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJs26ibK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJs26ibK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751470953; x=1783006953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jeLodGa6ydGulxvvaarnA3o1V2WefGQJYBwIOEIn6G0=;
  b=NJs26ibKhE4oAw6kpWrB+sOBYQ9sMgwqU5mLevRfEIWU31DkDwuxpqI7
   d0W03V8XB8yIuesjTTfApkQbPHdEWAkC949ZsTahpd4dmsGKqceG6PDfr
   dILQ/dvb+OtPovAitWrf4gAEB6n7m37hhm/IW+LjdbzVRFFORZWNkGMQl
   hTqDLWDYU4UMXCPQcRD7WuCKVUFGIDE+WDN1LBCqDSPBFDB1dH4ZPuikw
   /AsF6IhV+vGP3ENX84tY1KFtIfHAt72VmuyxC3V9rYSv7kuR4q+6pLUtx
   Zl04u7EdQwhTXlWscYZiwSSLKQDHfK8EDvNf7bNZXYjB79QnjEhksLAgw
   g==;
X-CSE-ConnectionGUID: QRv96p+uQIinbVz0sYTm3w==
X-CSE-MsgGUID: zEyPAfzcTnaP5mFpdqTECw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53704223"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53704223"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:42:33 -0700
X-CSE-ConnectionGUID: DW/nwf/4T2Wk62wJjCCbgg==
X-CSE-MsgGUID: CcT1w00OTrOIGlCsONNX2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154668733"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jul 2025 08:42:31 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWzbR-0000o3-2K;
	Wed, 02 Jul 2025 15:42:29 +0000
Date: Wed, 2 Jul 2025 23:42:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/74]
 arch/x86/include/asm/pci_x86.h:241:9: error: call to undeclared function
 'pv_pci_mmcfg_readb'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202507022356.ZKdTr4hk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   d94c9af01df6cfef567c9c9c34f97a683cfecc9c
commit: 3b88862f9b7f7434c1456fc15232238fa84e3a42 [0/74] ANDROID: x86/paravirt: Extend pv_mmio_ops to support pci mmcfg read and write
config: x86_64-buildonly-randconfig-005-20250702 (https://download.01.org/0day-ci/archive/20250702/202507022356.ZKdTr4hk-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507022356.ZKdTr4hk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507022356.ZKdTr4hk-lkp@intel.com/

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
