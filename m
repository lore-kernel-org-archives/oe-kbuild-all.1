Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACFD2D9ECA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 06:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787208133; cv=none; b=cUXvOM+/s0H4Jq1IRM3s93RYVhcLrmLbzTv+mG8d5P9ioC7kaEKiJbMLPfFyWycw0SARNN0bLjSe6sp5wHqGiDI3YnbPWHruirbPs+ioVwHzdKIGiipHHGF91goXZPnM15aQVswR4AHIpMSl0s5zEPOpJIsuCsYVB5qYE0C7loE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787208133; c=relaxed/simple;
	bh=ms75tL/mBnHV5HhMmBbihO2GI8pD+jlF3JvjcECr0FA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xlk6GEY3OnTvm2yfBfS3MUKvfMdqNd7YJvsCMzRQedoPuIiUJz+/zjt94T8/T/ZAvtttskQzhjzx9mb6ZncLENpWZAa6qiYDFRW2km2++4fP9eUvxEwXxrMFNa05rFzRPrSvwt/04Sza2czWc3UzELX7uVPto7+iv07bOAV/zak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzZzB6vz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzZzB6vz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787208132; x=1818744132;
  h=date:from:to:cc:subject:message-id;
  bh=ms75tL/mBnHV5HhMmBbihO2GI8pD+jlF3JvjcECr0FA=;
  b=EzZzB6vzRGMTJ9Gu6x5zFcEW3HAeBoBxa6H4H6bwULjoy8UloK92QW1/
   9PjHiESotK59Ed+IaNr8JuWeW/Qd9MAQHOd4EEX6hN+9lZy5FEdLeOl5Z
   6Sk8Ud0Ue0IlGY8UCCZVZFyx+GPFFOB0JCxRiByCjEAJbbz/9wu5QDM59
   fdKqUDzeASETlDxRtk9Rl/3PYHS3xjqYMYGk1OJ9I28bM8lP7tlGskCd0
   731s5r8Gi4vCBVZ7yXJOAWFT/WokMsZQrmAKBxpkYcCG+BPm18WMYOXEj
   YAREHgW1eCqs+juTs+o13MU1csL8Hgs7ccvl9CXL4C2sPxmmjhcXl6Bd7
   Q==;
X-CSE-ConnectionGUID: OU/ZIV4DQN6lFklG8Vk9sA==
X-CSE-MsgGUID: EdZ744TZREe4eJTiOrd+MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="99257763"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="99257763"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 23:42:12 -0700
X-CSE-ConnectionGUID: zv/sC/JkSkuS1F0KUY4tEA==
X-CSE-MsgGUID: NSK/rYZcQzarYH9vbSgOtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="304070024"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Aug 2026 23:42:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwwTX-00000000i7z-3mUY;
	Thu, 20 Aug 2026 06:42:07 +0000
Date: Thu, 20 Aug 2026 14:41:26 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:headers 5/20]
 arch/arm/mach-pxa/pxa3xx.c:423:17: error: implicit declaration of function
 'enable_irq_wake'
Message-ID: <202608201404.iTlMKzrm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/willy/pagecache headers
head:   59e9c46a34f4b92aee962208f9d8953891709933
commit: ef1af1bbc3cf307179196f42c7c054931ad36626 [5/20] headers: Remove swap.h from suspend.h
config: arm-randconfig-r121-20260820 (https://download.01.org/0day-ci/archive/20260820/202608201404.iTlMKzrm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608201404.iTlMKzrm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608201404.iTlMKzrm-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/mach-pxa/pxa3xx.c: In function 'pxa3xx_init':
>> arch/arm/mach-pxa/pxa3xx.c:423:17: error: implicit declaration of function 'enable_irq_wake' [-Werror=implicit-function-declaration]
     423 |                 enable_irq_wake(IRQ_WAKEUP0);
         |                 ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/enable_irq_wake +423 arch/arm/mach-pxa/pxa3xx.c

851982c1b6ca18c Marek Vasut         2010-10-11  397  
2c8086a5d073e8e eric miao           2007-09-11  398  static int __init pxa3xx_init(void)
2c8086a5d073e8e eric miao           2007-09-11  399  {
2eaa03b5bebd1e8 Rafael J. Wysocki   2011-04-22  400  	int ret = 0;
2c8086a5d073e8e eric miao           2007-09-11  401  
2c8086a5d073e8e eric miao           2007-09-11  402  	if (cpu_is_pxa3xx()) {
04fef228fb00dd7 Eric Miao           2008-07-29  403  
e86bd43bcfc579c Arnd Bergmann       2019-09-08  404  		pxa_register_wdt(ARSR);
04fef228fb00dd7 Eric Miao           2008-07-29  405  
86260f987319fb5 Dmitry Krivoschekov 2008-02-08  406  		/*
86260f987319fb5 Dmitry Krivoschekov 2008-02-08  407  		 * clear RDH bit every time after reset
86260f987319fb5 Dmitry Krivoschekov 2008-02-08  408  		 *
86260f987319fb5 Dmitry Krivoschekov 2008-02-08  409  		 * Note: the last 3 bits DxS are write-1-to-clear so carefully
86260f987319fb5 Dmitry Krivoschekov 2008-02-08  410  		 * preserve them here in case they will be referenced later
86260f987319fb5 Dmitry Krivoschekov 2008-02-08  411  		 */
86260f987319fb5 Dmitry Krivoschekov 2008-02-08  412  		ASCR &= ~(ASCR_RDH | ASCR_D1S | ASCR_D2S | ASCR_D3S);
86260f987319fb5 Dmitry Krivoschekov 2008-02-08  413  
adf3442cc890f04 Robert Jarzmik      2015-08-23  414  		/*
adf3442cc890f04 Robert Jarzmik      2015-08-23  415  		 * Disable DFI bus arbitration, to prevent a system bus lock if
adf3442cc890f04 Robert Jarzmik      2015-08-23  416  		 * somebody disables the NAND clock (unused clock) while this
adf3442cc890f04 Robert Jarzmik      2015-08-23  417  		 * bit remains set.
adf3442cc890f04 Robert Jarzmik      2015-08-23  418  		 */
adf3442cc890f04 Robert Jarzmik      2015-08-23  419  		NDCR = (NDCR & ~NDCR_ND_ARB_EN) | NDCR_ND_ARB_CNTL;
adf3442cc890f04 Robert Jarzmik      2015-08-23  420  
7b5dea12346f98b Russell King        2008-01-07  421  		pxa3xx_init_pm();
7b5dea12346f98b Russell King        2008-01-07  422  
c1c14f8954c6d1c Daniel Mack         2018-05-24 @423  		enable_irq_wake(IRQ_WAKEUP0);
c1c14f8954c6d1c Daniel Mack         2018-05-24  424  		if (cpu_is_pxa320())
c1c14f8954c6d1c Daniel Mack         2018-05-24  425  			enable_irq_wake(IRQ_WAKEUP1);
c1c14f8954c6d1c Daniel Mack         2018-05-24  426  
a97fbc3ee3e2a53 Thierry Reding      2025-10-29  427  		register_syscore(&pxa_irq_syscore);
a97fbc3ee3e2a53 Thierry Reding      2025-10-29  428  		register_syscore(&pxa3xx_mfp_syscore);
b8f649f1f531914 Haojian Zhuang      2013-04-09  429  	}
c016550490687c6 eric miao           2008-01-28  430  
c016550490687c6 eric miao           2008-01-28  431  	return ret;
2c8086a5d073e8e eric miao           2007-09-11  432  }
2c8086a5d073e8e eric miao           2007-09-11  433  

:::::: The code at line 423 was first introduced by commit
:::::: c1c14f8954c6d1cb9867024618e93687d9d035ba ARM: pxa3xx: enable external wakeup pins

:::::: TO: Daniel Mack <daniel@zonque.org>
:::::: CC: Robert Jarzmik <robert.jarzmik@free.fr>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
