Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF6235962
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 02:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747190978; cv=none; b=qA5TSzZFgnPYzEZQBbIXgaxCSkfHCvXyWW+BCFyRtSNq8a1XiAFvYg8nNCsMbU3Ze1FgkLqbV8naYvcMNQR6jtqMj+w3/8Mve/8HMla5l6hMwptBHYrUAQbiuN7642TCzMSQvZRFPLFzp03AzXTwEYo5h2KuoqDq70Js7JPTJOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747190978; c=relaxed/simple;
	bh=rMSkMZABrWptS62QD1V0yZl+6EiMR5WzJXC7BmO+FOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tm9qjr1CR5ike9qxjhRW5UggMKXmic6FlGGm08I+zPGtomjo8Dd6Zd6nXuodJjPN0avNPF1kmiz52xNQYWTGiJ30xU2ulD8p6tov/Z2DTmZ42IuIHmHnYGtJyG17Wm5rdu0hBHgWhH35v90x4vfeLJ1DrDouj1HWwWc+FcZNcOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GshV5QCi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GshV5QCi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747190977; x=1778726977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rMSkMZABrWptS62QD1V0yZl+6EiMR5WzJXC7BmO+FOM=;
  b=GshV5QCip7OvMa8QFxK7DLufOuQbNU6igtfG9QQ7lB5kxGIBFvb3F7zb
   sKKLv7nNIk2ZMBN6h+jcYZRhizitjTwfkJOgStVNBgLbNXOHkhhDk9FnE
   v9oDWlTsVpjyfQ05oMGBUHfgl9qCilF1w9T9kORaCUwb/xY+Dz+VAPgki
   1xErv7RruSk493pYfqDjQ7ZBaqTtmScVENrEWNyqJfOhBCJRZ/20ZzIqB
   nV8/SjWdz5ZxvGWhFJDjJZyQK0Mg0tOFPuMaCn8cUiz7A8b2Nb2/G+9oy
   CrSRHy9qakARmOn46A/JomFc00QnW751O9Fph97KIasSR7UdaJjyB8evb
   g==;
X-CSE-ConnectionGUID: 2MSaTUtDSLiP4rVtHVlYOA==
X-CSE-MsgGUID: Jz94FiRdRuqRfsDglhMnwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48998235"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48998235"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 19:49:35 -0700
X-CSE-ConnectionGUID: issRaCfYQG+2lj9dhoQnFw==
X-CSE-MsgGUID: JBt1A0l+T5q2QFU8USksEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="161195462"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 May 2025 19:49:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF2BX-000GcZ-27;
	Wed, 14 May 2025 02:49:31 +0000
Date: Wed, 14 May 2025 10:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 4/4]
 arch/x86/include/asm/pci_x86.h:241:16: error: implicit declaration of
 function 'pv_pci_mmcfg_readb'; did you mean 'pci_mmcfg_readb'?
Message-ID: <202505141001.heM0QCJb-lkp@intel.com>
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
commit: e8ff3beffe966e1849777b6897b881467519a640 [4/4] ANDROID: x86/paravirt: Extend pv_mmio_ops to support pci mmcfg read and write
config: i386-buildonly-randconfig-002-20250514 (https://download.01.org/0day-ci/archive/20250514/202505141001.heM0QCJb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141001.heM0QCJb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141001.heM0QCJb-lkp@intel.com/

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
