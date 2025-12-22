Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB6817B505
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 09:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394073; cv=none; b=TZJBx8RfpiP4FwBlZIxu1xN9pRK2JAYfAyU2aE2qK4vcFX/yMr4PVcFDMn+5/Va53PnX3qkmBesplP0R8RHCN5Tkrrx+VEI4DDdGGiV+QkIRXo4vkLnpCw5rcaVLL3WwQLQi1UekwPEvAwtqn5DuuhRIDA3GqI/sdyWeP4h6CY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394073; c=relaxed/simple;
	bh=TvkvVx5resTipHSrCxPbkwVCzIfLIaDmHATCb7HT/zg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CjhU6LsMh3xmLbDgckG2r28WVet19wWU/sKU752gt0f98ayTCgvRUBdpMvzXF8PFqPWY+zFsFWWcvkMt6SzDePaSQakvrKp5ALzPoUHH/whUcKW0b3fCZJhShCrz4fxv4TK0+hNPqIOsI2dCt6N1qHZ/mYDO/LI1gLxf3xZLag0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mRcuoQ0s; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRcuoQ0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766394072; x=1797930072;
  h=date:from:to:cc:subject:message-id;
  bh=TvkvVx5resTipHSrCxPbkwVCzIfLIaDmHATCb7HT/zg=;
  b=mRcuoQ0sBXoa8rRUJnVsoFGDETj7g3N20ZAfI8AWpR8qY2iREy0J1iz5
   YVgkST4KkSeFaXF2YBxsoJu/AnYstM4kT2ByRE1V0aT+vFgsEzKUhcPBK
   bXTFCVfKjwYd12ggE8A/Hk2fq4k20LMABKNK8hnR1JB24RSzLZeF3IaH2
   Akfmi4zwk8dzSNUUvVTB6ck8S3GwlzTsF2m8blzrZVwxICNWptj+jWsMy
   RxJPdhZdk9R/TWYrVTe/zXUUNVAzXqC0gpASkd1p+mJ22t9SN90Jx52uC
   8hZgPsOwBL/DYYNs53lqxgicaKhgr8wQ0ZdmeqwaXI0aA+c0xoRHRcssq
   Q==;
X-CSE-ConnectionGUID: KMzeWzH/TNqOUwkBh64SSQ==
X-CSE-MsgGUID: tEJ6yK+ISCeu0mHjUsbMkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68322497"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68322497"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 01:01:11 -0800
X-CSE-ConnectionGUID: axRj3xRbRwyWHzHeT7xmdA==
X-CSE-MsgGUID: SgOz3tvwQIek6s2v8rNe8w==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Dec 2025 01:01:09 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXbmf-000000000Ip-0Zny;
	Mon, 22 Dec 2025 09:00:57 +0000
Date: Mon, 22 Dec 2025 16:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sundongxu <sundongxu3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3542/3542]
 drivers/irqchip/irq-mbigen.c:127: warning: Function parameter or member
 'vtimer_mbigen_chip' not described in 'mbigen_device'
Message-ID: <202512221648.01it8GuK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 3ce0ad7d0b4cb6538fe25fb20ca838c06e3cc516 [3542/3542] mbigen: vtimer mbigen driver support
config: arm64-randconfig-001-20251215 (https://download.01.org/0day-ci/archive/20251222/202512221648.01it8GuK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221648.01it8GuK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221648.01it8GuK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-mbigen.c:77: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * MBIX config register
>> drivers/irqchip/irq-mbigen.c:127: warning: Function parameter or member 'vtimer_mbigen_chip' not described in 'mbigen_device'
>> drivers/irqchip/irq-mbigen.c:136: warning: expecting prototype for Due to the existence of hyper(). Prototype was for GICR_LENGTH() instead

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +127 drivers/irqchip/irq-mbigen.c

3ce0ad7d0b4cb65 Kunkun Jiang 2024-01-11  114  
717c3dbc118ecbb Ma Jun       2015-12-17  115  /**
717c3dbc118ecbb Ma Jun       2015-12-17  116   * struct mbigen_device - holds the information of mbigen device.
717c3dbc118ecbb Ma Jun       2015-12-17  117   *
717c3dbc118ecbb Ma Jun       2015-12-17  118   * @pdev:		pointer to the platform device structure of mbigen chip.
717c3dbc118ecbb Ma Jun       2015-12-17  119   * @base:		mapped address of this mbigen chip.
717c3dbc118ecbb Ma Jun       2015-12-17  120   */
717c3dbc118ecbb Ma Jun       2015-12-17  121  struct mbigen_device {
717c3dbc118ecbb Ma Jun       2015-12-17  122  	struct platform_device	*pdev;
717c3dbc118ecbb Ma Jun       2015-12-17  123  	void __iomem		*base;
3ce0ad7d0b4cb65 Kunkun Jiang 2024-01-11  124  #ifdef CONFIG_VIRT_VTIMER_IRQ_BYPASS
3ce0ad7d0b4cb65 Kunkun Jiang 2024-01-11  125  	struct vtimer_mbigen_device	*vtimer_mbigen_chip;
3ce0ad7d0b4cb65 Kunkun Jiang 2024-01-11  126  #endif
717c3dbc118ecbb Ma Jun       2015-12-17 @127  };
717c3dbc118ecbb Ma Jun       2015-12-17  128  
3ce0ad7d0b4cb65 Kunkun Jiang 2024-01-11  129  #ifdef CONFIG_VIRT_VTIMER_IRQ_BYPASS
3ce0ad7d0b4cb65 Kunkun Jiang 2024-01-11  130  static LIST_HEAD(vtimer_mgn_list);
3ce0ad7d0b4cb65 Kunkun Jiang 2024-01-11  131  
3ce0ad7d0b4cb65 Kunkun Jiang 2024-01-11  132  /**
3ce0ad7d0b4cb65 Kunkun Jiang 2024-01-11  133   * Due to the existence of hyper-threading technology, We need to get the
3ce0ad7d0b4cb65 Kunkun Jiang 2024-01-11  134   * absolute offset of a cpu relative to the base cpu.
3ce0ad7d0b4cb65 Kunkun Jiang 2024-01-11  135   */
3ce0ad7d0b4cb65 Kunkun Jiang 2024-01-11 @136  #define GICR_LENGTH                            0x40000
3ce0ad7d0b4cb65 Kunkun Jiang 2024-01-11  137  static inline int get_abs_offset(int cpu, int cpu_base)
3ce0ad7d0b4cb65 Kunkun Jiang 2024-01-11  138  {
3ce0ad7d0b4cb65 Kunkun Jiang 2024-01-11  139  	return ((get_gicr_paddr(cpu) - get_gicr_paddr(cpu_base)) / GICR_LENGTH);
3ce0ad7d0b4cb65 Kunkun Jiang 2024-01-11  140  }
3ce0ad7d0b4cb65 Kunkun Jiang 2024-01-11  141  

:::::: The code at line 127 was first introduced by commit
:::::: 717c3dbc118ecbbd5dab06c7e02dac68d3f62e1d irqchip/mgigen: Add platform device driver for mbigen device

:::::: TO: Ma Jun <majun258@huawei.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
