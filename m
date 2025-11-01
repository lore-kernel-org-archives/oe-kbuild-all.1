Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1691046BF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 15:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762011051; cv=none; b=YID8eWgKL/knwkS1G9zKXcqJoh3sSCeLSXw9csZWdf9+g/i/Zmgdrxe+Cb4am73qjBMbYkWaN6Q9jDPHxA0oj+eAuwATJOPu1EhNGK35KW+e7ohoI1VzkwrVCKWwsCu02yuKSwG4xrWSDrj8FLmGXX0jYH1Z7kMQGu/axyIyfc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762011051; c=relaxed/simple;
	bh=SOetyFA3rKW14k9DNBhpixUDHj612WnYhAHRpwppiaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mfcHMd51eOY4WZSgz1JzqLW31ZYec9WkLPx8BEMfgIBB51h6SOddKFvfdJpORGDRA8+QJk9H8yMCV8C07lIo5BWklHr1eV7t6tK9aUCaERerFEz4FAMWUEfY8p7Go1fesLNYnc2brc87SW6rVIXdvP2uxhYyLgY99RRRMYdA4os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fsuOzr5M; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fsuOzr5M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762011050; x=1793547050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SOetyFA3rKW14k9DNBhpixUDHj612WnYhAHRpwppiaE=;
  b=fsuOzr5MweNl6CcRba69SWlOG7xxD6+Pi/FD/Ch1MlGlZXHwbEgemdPX
   uTUK7/Kqym+nMKiC+wbCah8TatJQW8DoXWr1I4QcUy9eSAojWfXJPTCuq
   HJs3DWTBFZMN3hl9AeMD65WyjR4Pe4LyPXYiyzMYBsU1y9ezlO9eA81Li
   6+hI9rdwcF7KMtvenIwdA4zTpdCvMiV5YAPTJ/3Ed0GU+9ffGGBAtidYX
   DfPCsdKEiU0azMkMnfTV1+xstSanypwUsoCOSeNrf6OM1OTeC7nd7kZhR
   6gA0OQBAgVpuEyvk/tKhbdOSUppvs9PEqxB+T1lwH48YQaNyJv1iOsXSZ
   A==;
X-CSE-ConnectionGUID: N77qlHIzR5a5K+AHWcc8ZQ==
X-CSE-MsgGUID: LT57PEIURGO/A1N8tg89gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="64182673"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="64182673"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 08:30:49 -0700
X-CSE-ConnectionGUID: XgiFgXSiQL63Vzqr3tcrUg==
X-CSE-MsgGUID: 1EryzKpVSfmYRuZ7I474jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="191608502"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Nov 2025 08:30:48 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFDZ0-000OOq-0S;
	Sat, 01 Nov 2025 15:30:46 +0000
Date: Sat, 1 Nov 2025 23:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 3/3]
 arch/x86/include/asm/pci_x86.h:241:16: error: implicit declaration of
 function 'pv_pci_mmcfg_readb'; did you mean 'pci_mmcfg_readb'?
Message-ID: <202511012306.Gs4NtEyT-lkp@intel.com>
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
head:   43ce0f84dc2297fc37c2b9e5ccdbf24edab58576
commit: 3b88862f9b7f7434c1456fc15232238fa84e3a42 [3/3] ANDROID: x86/paravirt: Extend pv_mmio_ops to support pci mmcfg read and write
config: i386-randconfig-003-20251101 (https://download.01.org/0day-ci/archive/20251101/202511012306.Gs4NtEyT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511012306.Gs4NtEyT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511012306.Gs4NtEyT-lkp@intel.com/

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
