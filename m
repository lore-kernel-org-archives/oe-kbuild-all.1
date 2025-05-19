Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8517E288CA1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 16:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670859; cv=none; b=PmuZ1nrR+VFK037sDnl417O8W7G5EalJ2HgQNlnCe5mQnwe4Z3XDFrFUkyGgofRg4pAu5zJJvAZ5MMkDd1V7DMKcMlfneHAshvsETgqGMxft1UfSr052LyiRhMmRPmvW0zcvY4RshL8AXCpWQT5bJKPgszxY9VBo2jQ3LBk74Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670859; c=relaxed/simple;
	bh=4TDYFrBF6gDoCbOD9z4x5zPVbvdf5rU+TzEBarRAdJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQU18C2w6eFs4Mqqwkok7/2FxIlt4tKEW4oshd/xFpBJc2g8kzpvL78KzuGjHwbrgSRh/Z3OqeWFSVVbY6Ak7N5krCtbacyLpveWUwv+r8mzgthdD/Kvcohus50zdTYpr2qPVDmPBWbJfd/8h2L6dsdTYyj6ucrzb4qGGOyhu8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kOxFSN9q; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kOxFSN9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747670858; x=1779206858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4TDYFrBF6gDoCbOD9z4x5zPVbvdf5rU+TzEBarRAdJY=;
  b=kOxFSN9qPVg4JDZ7ESTTLfvmP4p56jCafB8lVbfK0Z59Tj/93RaFVw76
   xgV96WCeJ/AumNaZgniION8yanDVw1+Vgr1f5M+8oNtx9FTBFQBajXWmM
   MRua9Jmfuqn5+YU23LhbPfAtxFA4HTSwDR/lccpShr/VSiIolksUkb5ng
   l3bA5XYN8lRhfYm8l3vObnc2+MaIupPRmSXYcR/o2hKgttqseIzq0QuHT
   3RIBZE1TRs8Q1U+XC1EKwHd7QiYV14nvtua0yxbgNeCgwnjlszJL5Spw8
   0Ljk1qmZCV2a7LsIPxQaDXnNg36qKSh9PS23kvWINDeddxpvZf0EggYkR
   g==;
X-CSE-ConnectionGUID: zJsIurmTTiKpCJF2yH1Eng==
X-CSE-MsgGUID: 8Lb2LbPGTpikZhFIdqCM6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49715980"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49715980"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 09:07:37 -0700
X-CSE-ConnectionGUID: wcyE/iz7T62OtKsP9b0PSQ==
X-CSE-MsgGUID: 17iA2bSfQieL4v2muPT/yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="144291759"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 May 2025 09:07:36 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH31Z-0000r9-2i;
	Mon, 19 May 2025 16:07:33 +0000
Date: Tue, 20 May 2025 00:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 0/1]
 arch/x86/include/asm/pci_x86.h:241:16: error: implicit declaration of
 function 'pv_pci_mmcfg_readb'; did you mean 'pci_mmcfg_readb'?
Message-ID: <202505200012.3YuaTbct-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   aba25e4ac40a20c6843e2b3128c2e8acfa43e99d
commit: e8ff3beffe966e1849777b6897b881467519a640 [0/1] ANDROID: x86/paravirt: Extend pv_mmio_ops to support pci mmcfg read and write
config: x86_64-buildonly-randconfig-2004-20250519 (https://download.01.org/0day-ci/archive/20250520/202505200012.3YuaTbct-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505200012.3YuaTbct-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505200012.3YuaTbct-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/resource.c:5:
   arch/x86/include/asm/pci_x86.h: In function 'mmio_config_readb':
>> arch/x86/include/asm/pci_x86.h:241:16: error: implicit declaration of function 'pv_pci_mmcfg_readb'; did you mean 'pci_mmcfg_readb'? [-Werror=implicit-function-declaration]
     241 |         return pv_pci_mmcfg_readb(pos);
         |                ^~~~~~~~~~~~~~~~~~
         |                pci_mmcfg_readb
   arch/x86/include/asm/pci_x86.h: In function 'mmio_config_readw':
>> arch/x86/include/asm/pci_x86.h:246:16: error: implicit declaration of function 'pv_pci_mmcfg_readw'; did you mean 'pci_mmcfg_readw'? [-Werror=implicit-function-declaration]
     246 |         return pv_pci_mmcfg_readw(pos);
         |                ^~~~~~~~~~~~~~~~~~
         |                pci_mmcfg_readw
   arch/x86/include/asm/pci_x86.h: In function 'mmio_config_readl':
>> arch/x86/include/asm/pci_x86.h:251:16: error: implicit declaration of function 'pv_pci_mmcfg_readl'; did you mean 'pci_mmcfg_readl'? [-Werror=implicit-function-declaration]
     251 |         return pv_pci_mmcfg_readl(pos);
         |                ^~~~~~~~~~~~~~~~~~
         |                pci_mmcfg_readl
   arch/x86/include/asm/pci_x86.h: In function 'mmio_config_writeb':
>> arch/x86/include/asm/pci_x86.h:256:9: error: implicit declaration of function 'pv_pci_mmcfg_writeb'; did you mean 'pci_mmcfg_writeb'? [-Werror=implicit-function-declaration]
     256 |         pv_pci_mmcfg_writeb(val, pos);
         |         ^~~~~~~~~~~~~~~~~~~
         |         pci_mmcfg_writeb
   arch/x86/include/asm/pci_x86.h: In function 'mmio_config_writew':
>> arch/x86/include/asm/pci_x86.h:261:9: error: implicit declaration of function 'pv_pci_mmcfg_writew'; did you mean 'pci_mmcfg_writew'? [-Werror=implicit-function-declaration]
     261 |         pv_pci_mmcfg_writew(val, pos);
         |         ^~~~~~~~~~~~~~~~~~~
         |         pci_mmcfg_writew
   arch/x86/include/asm/pci_x86.h: In function 'mmio_config_writel':
>> arch/x86/include/asm/pci_x86.h:266:9: error: implicit declaration of function 'pv_pci_mmcfg_writel'; did you mean 'pci_mmcfg_writel'? [-Werror=implicit-function-declaration]
     266 |         pv_pci_mmcfg_writel(val, pos);
         |         ^~~~~~~~~~~~~~~~~~~
         |         pci_mmcfg_writel
   cc1: some warnings being treated as errors


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
