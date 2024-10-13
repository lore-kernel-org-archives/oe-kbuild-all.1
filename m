Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC383139E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 09:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728810826; cv=none; b=DHgcizDf1+SCn2rj3l+qKQr5nwUgXRm2IcDeWuW4umWVSD0DUET3N3auG6yLgS16hWDfJZstyDgckPseQXRr2hOMCyV8ugPiWiG06a/wQNnyzJ4jws8NSnP7WpqfB43vGNqNI9kjKBJ8Y00R6l1fwqLjVN5tiTeUFX3L4ZgTlGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728810826; c=relaxed/simple;
	bh=NxjnZduwPt1FJhpVpZv44ChNFROD6VxwvysXlenc9+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pf5S7BVqUabTEASgZsmqyTWTvnAWr60RT8bW9xC3bSWH/kVW2CJ5JZ87mpBol8OdntjePMrTlalj3R//odVz8EFDiDuu3JS46MT+95O8if7gGdAWgTIrjcM0yPcb04/SnWPMu1CggjwF0SkaJDY41a1ba/i0H755jG20RO/Dqgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q88PuYGh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q88PuYGh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728810824; x=1760346824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NxjnZduwPt1FJhpVpZv44ChNFROD6VxwvysXlenc9+s=;
  b=Q88PuYGhM+5wQXQE1MKpMC7zVjb0/H9D+2DK0nw3n4tysZwl+VU1EUBm
   dIb6SpUcyv/ZMlLE1hpIDR6m+1KhAqDOgb8D82Ip4pWGQgMi1KV4vZ545
   F4Nc8d+d9yTCE4gpAOHFOuafyonbiz22IPtMH1Abccoea7FZhaw//dyeE
   Z4dGhUHcEP0creaTfHLSf9qadL6pvZm9dGy88QFzXFsU7iAQuW3Q7OKTp
   u6HxaakVW8dFdJUYNzqrZvoj8AAgB+g3DdrL/kTYBkph9C3Wh74+bqZ9l
   tLcDM8tfcS17fi5a79IfP4EXohqYyiWn7UOsQz+z8e97CV8BDPDw1p4/Y
   w==;
X-CSE-ConnectionGUID: fLfjtSuRTzio2iWlX77aMg==
X-CSE-MsgGUID: KaFR77vORriNRw0pveMAOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28040869"
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="28040869"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 02:13:43 -0700
X-CSE-ConnectionGUID: 1o3BLH9sTPStM8TNuEsFHw==
X-CSE-MsgGUID: pyGmukj1TC6Q9y2mWpMUnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="114754525"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Oct 2024 02:13:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szufT-000EEx-1h;
	Sun, 13 Oct 2024 09:13:39 +0000
Date: Sun, 13 Oct 2024 17:13:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, weiyuchen <weiyuchen3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 28917/30000]
 drivers/irqchip/irq-mbigen.c:693:12: warning: 'vtimer_mbigen_set_regs'
 defined but not used
Message-ID: <202410131716.kAGt5y1E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   caaf346be46cf898a60d036ab7717cead0e3c264
commit: a8af21a94f6331eb77ca486a511cbbb548de94df [28917/30000] mbigen: add kvm dependency
config: arm64-randconfig-003-20241013 (https://download.01.org/0day-ci/archive/20241013/202410131716.kAGt5y1E-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410131716.kAGt5y1E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131716.kAGt5y1E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-mbigen.c:875:36: warning: 'mbigen_acpi_match' defined but not used [-Wunused-const-variable=]
     875 | static const struct acpi_device_id mbigen_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mbigen.c:693:12: warning: 'vtimer_mbigen_set_regs' defined but not used [-Wunused-function]
     693 | static int vtimer_mbigen_set_regs(struct platform_device *pdev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mbigen.c:651:13: warning: 'vtimer_mbigen_should_probe' defined but not used [-Wunused-function]
     651 | static bool vtimer_mbigen_should_probe(struct mbigen_device *mgn_chip)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mbigen.c:636:13: warning: 'is_mbigen_vtimer_bypass_enabled' defined but not used [-Wunused-function]
     636 | static bool is_mbigen_vtimer_bypass_enabled(struct mbigen_device *mgn_chip)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mbigen.c:597:12: warning: 'vtimer_mbigen_chip_match_cpu' defined but not used [-Wunused-function]
     597 | static int vtimer_mbigen_chip_match_cpu(struct vtimer_mbigen_device *chip)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mbigen.c:588:12: warning: 'vtimer_mbigen_chip_read_aff3' defined but not used [-Wunused-function]
     588 | static int vtimer_mbigen_chip_read_aff3(struct vtimer_mbigen_device *chip)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mbigen.c:581:13: warning: 'vtimer_mbigen_set_kvm_info' defined but not used [-Wunused-function]
     581 | static void vtimer_mbigen_set_kvm_info(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/irqchip/irq-mbigen.c:268:12: warning: 'vtimer_mbigen_set_type' defined but not used [-Wunused-function]
     268 | static int vtimer_mbigen_set_type(unsigned int cpu_id)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/vtimer_mbigen_set_regs +693 drivers/irqchip/irq-mbigen.c

f907c515ffb06e Hanjun Guo   2017-03-28  580  
212e82b2357f91 Kunkun Jiang 2023-12-06 @581  static void vtimer_mbigen_set_kvm_info(void)
212e82b2357f91 Kunkun Jiang 2023-12-06  582  {
212e82b2357f91 Kunkun Jiang 2023-12-06  583  	struct arch_timer_kvm_info *info = arch_timer_get_kvm_info();
212e82b2357f91 Kunkun Jiang 2023-12-06  584  
212e82b2357f91 Kunkun Jiang 2023-12-06  585  	info->irqbypass_flag |= VT_EXPANDDEV_PROBED;
212e82b2357f91 Kunkun Jiang 2023-12-06  586  }
212e82b2357f91 Kunkun Jiang 2023-12-06  587  
212e82b2357f91 Kunkun Jiang 2023-12-06 @588  static int vtimer_mbigen_chip_read_aff3(struct vtimer_mbigen_device *chip)
212e82b2357f91 Kunkun Jiang 2023-12-06  589  {
212e82b2357f91 Kunkun Jiang 2023-12-06  590  	void __iomem *base = chip->base;
212e82b2357f91 Kunkun Jiang 2023-12-06  591  	void __iomem *addr = base + MBIGEN_CTLR;
212e82b2357f91 Kunkun Jiang 2023-12-06  592  	u32 val = readl_relaxed(addr);
212e82b2357f91 Kunkun Jiang 2023-12-06  593  
212e82b2357f91 Kunkun Jiang 2023-12-06  594  	return ((val & MBIGEN_AFF3_MASK) >> MBIGEN_AFF3_SHIFT);
212e82b2357f91 Kunkun Jiang 2023-12-06  595  }
212e82b2357f91 Kunkun Jiang 2023-12-06  596  
212e82b2357f91 Kunkun Jiang 2023-12-06 @597  static int vtimer_mbigen_chip_match_cpu(struct vtimer_mbigen_device *chip)
212e82b2357f91 Kunkun Jiang 2023-12-06  598  {
212e82b2357f91 Kunkun Jiang 2023-12-06  599  	int cpu;
212e82b2357f91 Kunkun Jiang 2023-12-06  600  
212e82b2357f91 Kunkun Jiang 2023-12-06  601  	chip->cpu_base = -1;
212e82b2357f91 Kunkun Jiang 2023-12-06  602  	chip->cpu_num = 0;
212e82b2357f91 Kunkun Jiang 2023-12-06  603  
212e82b2357f91 Kunkun Jiang 2023-12-06  604  	for_each_possible_cpu(cpu) {
212e82b2357f91 Kunkun Jiang 2023-12-06  605  		int mpidr_aff3 = MPIDR_AFFINITY_LEVEL(cpu_logical_map(cpu), 3);
212e82b2357f91 Kunkun Jiang 2023-12-06  606  
212e82b2357f91 Kunkun Jiang 2023-12-06  607  		if (chip->mpidr_aff3 == mpidr_aff3) {
212e82b2357f91 Kunkun Jiang 2023-12-06  608  			/* get the first cpu attached to the mbigen */
212e82b2357f91 Kunkun Jiang 2023-12-06  609  			if (chip->cpu_base == -1) {
212e82b2357f91 Kunkun Jiang 2023-12-06  610  				/* Make sure cpu_base is attached to PIN0 */
212e82b2357f91 Kunkun Jiang 2023-12-06  611  				u64 mpidr = cpu_logical_map(cpu);
212e82b2357f91 Kunkun Jiang 2023-12-06  612  				if (!MPIDR_AFFINITY_LEVEL(mpidr, 2) &&
212e82b2357f91 Kunkun Jiang 2023-12-06  613  				    !MPIDR_AFFINITY_LEVEL(mpidr, 1) &&
212e82b2357f91 Kunkun Jiang 2023-12-06  614  				    !MPIDR_AFFINITY_LEVEL(mpidr, 0))
212e82b2357f91 Kunkun Jiang 2023-12-06  615  					chip->cpu_base = cpu;
212e82b2357f91 Kunkun Jiang 2023-12-06  616  			}
212e82b2357f91 Kunkun Jiang 2023-12-06  617  
212e82b2357f91 Kunkun Jiang 2023-12-06  618  			chip->cpu_num++;
212e82b2357f91 Kunkun Jiang 2023-12-06  619  			/*
212e82b2357f91 Kunkun Jiang 2023-12-06  620  			 * check if this cpu has already
212e82b2357f91 Kunkun Jiang 2023-12-06  621  			 * attached to another mbigen
212e82b2357f91 Kunkun Jiang 2023-12-06  622  			 */
212e82b2357f91 Kunkun Jiang 2023-12-06  623  			if (cpumask_test_and_set_cpu(cpu, &vtimer_cpu_mask)) {
212e82b2357f91 Kunkun Jiang 2023-12-06  624  				WARN_ON_ONCE(1);
212e82b2357f91 Kunkun Jiang 2023-12-06  625  				return -EINVAL;
212e82b2357f91 Kunkun Jiang 2023-12-06  626  			}
212e82b2357f91 Kunkun Jiang 2023-12-06  627  		}
212e82b2357f91 Kunkun Jiang 2023-12-06  628  	}
212e82b2357f91 Kunkun Jiang 2023-12-06  629  
212e82b2357f91 Kunkun Jiang 2023-12-06  630  	if (chip->cpu_base == -1 || chip->cpu_num > IRQS_PER_MBIGEN_NODE)
212e82b2357f91 Kunkun Jiang 2023-12-06  631  		return -EINVAL;
212e82b2357f91 Kunkun Jiang 2023-12-06  632  
212e82b2357f91 Kunkun Jiang 2023-12-06  633  	return 0;
212e82b2357f91 Kunkun Jiang 2023-12-06  634  }
212e82b2357f91 Kunkun Jiang 2023-12-06  635  
212e82b2357f91 Kunkun Jiang 2023-12-06 @636  static bool is_mbigen_vtimer_bypass_enabled(struct mbigen_device *mgn_chip)
212e82b2357f91 Kunkun Jiang 2023-12-06  637  {
212e82b2357f91 Kunkun Jiang 2023-12-06  638  	void __iomem *base = mgn_chip->base;
212e82b2357f91 Kunkun Jiang 2023-12-06  639  	void __iomem *addr = base + MBIGEN_NODE_CFG_OFFSET;
212e82b2357f91 Kunkun Jiang 2023-12-06  640  	u32 val = readl_relaxed(addr);
212e82b2357f91 Kunkun Jiang 2023-12-06  641  
212e82b2357f91 Kunkun Jiang 2023-12-06  642  	return ((val & MBIGEN_TYPE_MASK) >> MBIGEN_TYPE_SHIFT)
212e82b2357f91 Kunkun Jiang 2023-12-06  643  		== TYPE_VTIMER_ENABLED;
212e82b2357f91 Kunkun Jiang 2023-12-06  644  }
212e82b2357f91 Kunkun Jiang 2023-12-06  645  
212e82b2357f91 Kunkun Jiang 2023-12-06  646  /**
212e82b2357f91 Kunkun Jiang 2023-12-06  647   * MBIX_VPPI_ITS_TA: Indicates the address of the ITS corresponding
212e82b2357f91 Kunkun Jiang 2023-12-06  648   * to the mbigen.
212e82b2357f91 Kunkun Jiang 2023-12-06  649   */
212e82b2357f91 Kunkun Jiang 2023-12-06  650  #define MBIX_VPPI_ITS_TA	0x0038
212e82b2357f91 Kunkun Jiang 2023-12-06 @651  static bool vtimer_mbigen_should_probe(struct mbigen_device *mgn_chip)
212e82b2357f91 Kunkun Jiang 2023-12-06  652  {
212e82b2357f91 Kunkun Jiang 2023-12-06  653  	unsigned int mpidr_aff3;
212e82b2357f91 Kunkun Jiang 2023-12-06  654  	struct vtimer_mbigen_device *chip;
212e82b2357f91 Kunkun Jiang 2023-12-06  655  	void __iomem *addr;
212e82b2357f91 Kunkun Jiang 2023-12-06  656  	u32 val;
212e82b2357f91 Kunkun Jiang 2023-12-06  657  
212e82b2357f91 Kunkun Jiang 2023-12-06  658  	/* find the valid mbigen */
212e82b2357f91 Kunkun Jiang 2023-12-06  659  	addr = mgn_chip->base + MBIX_VPPI_ITS_TA;
212e82b2357f91 Kunkun Jiang 2023-12-06  660  	val = readl_relaxed(addr);
212e82b2357f91 Kunkun Jiang 2023-12-06  661  	if (!val)
212e82b2357f91 Kunkun Jiang 2023-12-06  662  		return false;
212e82b2357f91 Kunkun Jiang 2023-12-06  663  
212e82b2357f91 Kunkun Jiang 2023-12-06  664  	addr = mgn_chip->base + MBIGEN_CTLR;
212e82b2357f91 Kunkun Jiang 2023-12-06  665  	val = readl_relaxed(addr);
212e82b2357f91 Kunkun Jiang 2023-12-06  666  	mpidr_aff3 = (val & MBIGEN_AFF3_MASK) >> MBIGEN_AFF3_SHIFT;
212e82b2357f91 Kunkun Jiang 2023-12-06  667  	list_for_each_entry(chip, &vtimer_mgn_list, entry) {
212e82b2357f91 Kunkun Jiang 2023-12-06  668  		if (chip->mpidr_aff3 == mpidr_aff3)
212e82b2357f91 Kunkun Jiang 2023-12-06  669  			return false;
212e82b2357f91 Kunkun Jiang 2023-12-06  670  	}
212e82b2357f91 Kunkun Jiang 2023-12-06  671  
212e82b2357f91 Kunkun Jiang 2023-12-06  672  	return true;
212e82b2357f91 Kunkun Jiang 2023-12-06  673  }
212e82b2357f91 Kunkun Jiang 2023-12-06  674  
473e1b802231d7 Kunkun Jiang 2023-12-06  675  #define CHIP0_TA_MBIGEN_PHY_BASE	0x4604400000
473e1b802231d7 Kunkun Jiang 2023-12-06  676  #define CHIP0_TA_MBIGEN_ITS_BASE	0x84028
473e1b802231d7 Kunkun Jiang 2023-12-06  677  #define CHIP0_TA_PERI_PHY_BASE		0x4614002018
473e1b802231d7 Kunkun Jiang 2023-12-06  678  
473e1b802231d7 Kunkun Jiang 2023-12-06  679  #define CHIP0_TB_MBIGEN_PHY_BASE	0xc604400000
473e1b802231d7 Kunkun Jiang 2023-12-06  680  #define CHIP0_TB_PERI_PHY_BASE		0xc614002018
473e1b802231d7 Kunkun Jiang 2023-12-06  681  #define CHIP0_TB_MBIGEN_ITS_BASE	0x4028
473e1b802231d7 Kunkun Jiang 2023-12-06  682  
473e1b802231d7 Kunkun Jiang 2023-12-06  683  #define CHIP1_TA_MBIGEN_PHY_BASE	0x204604400000
473e1b802231d7 Kunkun Jiang 2023-12-06  684  #define CHIP1_TA_PERI_PHY_BASE		0x204614002018
473e1b802231d7 Kunkun Jiang 2023-12-06  685  #define CHIP1_TA_MBIGEN_ITS_BASE	0x2084028
473e1b802231d7 Kunkun Jiang 2023-12-06  686  
473e1b802231d7 Kunkun Jiang 2023-12-06  687  #define CHIP1_TB_MBIGEN_PHY_BASE	0x20c604400000
473e1b802231d7 Kunkun Jiang 2023-12-06  688  #define CHIP1_TB_MBIGEN_ITS_BASE	0x2004028
473e1b802231d7 Kunkun Jiang 2023-12-06  689  #define CHIP1_TB_PERI_PHY_BASE		0x20c614002018
473e1b802231d7 Kunkun Jiang 2023-12-06  690  
473e1b802231d7 Kunkun Jiang 2023-12-06  691  extern bool vtimer_irqbypass;
473e1b802231d7 Kunkun Jiang 2023-12-06  692  
473e1b802231d7 Kunkun Jiang 2023-12-06 @693  static int vtimer_mbigen_set_regs(struct platform_device *pdev)
473e1b802231d7 Kunkun Jiang 2023-12-06  694  {
473e1b802231d7 Kunkun Jiang 2023-12-06  695  	struct mbigen_device *mgn_chip = platform_get_drvdata(pdev);
473e1b802231d7 Kunkun Jiang 2023-12-06  696  	struct resource *res;
473e1b802231d7 Kunkun Jiang 2023-12-06  697  	void __iomem *addr;
473e1b802231d7 Kunkun Jiang 2023-12-06  698  	unsigned int mpidr_aff3;
473e1b802231d7 Kunkun Jiang 2023-12-06  699  	u32 val;
473e1b802231d7 Kunkun Jiang 2023-12-06  700  	struct vtimer_mbigen_device *chip;
473e1b802231d7 Kunkun Jiang 2023-12-06  701  
473e1b802231d7 Kunkun Jiang 2023-12-06  702  	addr = mgn_chip->base + MBIGEN_CTLR;
473e1b802231d7 Kunkun Jiang 2023-12-06  703  	val = readl_relaxed(addr);
473e1b802231d7 Kunkun Jiang 2023-12-06  704  	mpidr_aff3 = (val & MBIGEN_AFF3_MASK) >> MBIGEN_AFF3_SHIFT;
473e1b802231d7 Kunkun Jiang 2023-12-06  705  	list_for_each_entry(chip, &vtimer_mgn_list, entry) {
473e1b802231d7 Kunkun Jiang 2023-12-06  706  		if (chip->mpidr_aff3 == mpidr_aff3)
473e1b802231d7 Kunkun Jiang 2023-12-06  707  			return 0;
473e1b802231d7 Kunkun Jiang 2023-12-06  708  	}
473e1b802231d7 Kunkun Jiang 2023-12-06  709  
473e1b802231d7 Kunkun Jiang 2023-12-06  710  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
473e1b802231d7 Kunkun Jiang 2023-12-06  711  	if (!mgn_chip)
473e1b802231d7 Kunkun Jiang 2023-12-06  712  		return -ENOMEM;
473e1b802231d7 Kunkun Jiang 2023-12-06  713  
473e1b802231d7 Kunkun Jiang 2023-12-06  714  	if (res->start == CHIP0_TA_MBIGEN_PHY_BASE) {
473e1b802231d7 Kunkun Jiang 2023-12-06  715  		addr = ioremap(CHIP0_TA_PERI_PHY_BASE, 4);
473e1b802231d7 Kunkun Jiang 2023-12-06  716  		if (!addr) {
473e1b802231d7 Kunkun Jiang 2023-12-06  717  			pr_err("Unable to map CHIP0-TA-PERI\n");
473e1b802231d7 Kunkun Jiang 2023-12-06  718  			return -ENOMEM;
473e1b802231d7 Kunkun Jiang 2023-12-06  719  		}
473e1b802231d7 Kunkun Jiang 2023-12-06  720  
473e1b802231d7 Kunkun Jiang 2023-12-06  721  		writel_relaxed(1, addr);
473e1b802231d7 Kunkun Jiang 2023-12-06  722  		iounmap(addr);
473e1b802231d7 Kunkun Jiang 2023-12-06  723  
473e1b802231d7 Kunkun Jiang 2023-12-06  724  		addr = mgn_chip->base + MBIX_VPPI_ITS_TA;
473e1b802231d7 Kunkun Jiang 2023-12-06  725  		writel_relaxed(CHIP0_TA_MBIGEN_ITS_BASE, addr);
473e1b802231d7 Kunkun Jiang 2023-12-06  726  	}
473e1b802231d7 Kunkun Jiang 2023-12-06  727  
473e1b802231d7 Kunkun Jiang 2023-12-06  728  	if (res->start == CHIP0_TB_MBIGEN_PHY_BASE) {
473e1b802231d7 Kunkun Jiang 2023-12-06  729  		addr = ioremap(CHIP0_TB_PERI_PHY_BASE, 4);
473e1b802231d7 Kunkun Jiang 2023-12-06  730  		if (!addr) {
473e1b802231d7 Kunkun Jiang 2023-12-06  731  			pr_err("Unable to map CHIP0-TB-PERI\n");
473e1b802231d7 Kunkun Jiang 2023-12-06  732  			return -ENOMEM;
473e1b802231d7 Kunkun Jiang 2023-12-06  733  		}
473e1b802231d7 Kunkun Jiang 2023-12-06  734  
473e1b802231d7 Kunkun Jiang 2023-12-06  735  		writel_relaxed(1, addr);
473e1b802231d7 Kunkun Jiang 2023-12-06  736  		iounmap(addr);
473e1b802231d7 Kunkun Jiang 2023-12-06  737  
473e1b802231d7 Kunkun Jiang 2023-12-06  738  		addr = mgn_chip->base + MBIX_VPPI_ITS_TA;
473e1b802231d7 Kunkun Jiang 2023-12-06  739  		writel_relaxed(CHIP0_TB_MBIGEN_ITS_BASE, addr);
473e1b802231d7 Kunkun Jiang 2023-12-06  740  	}
473e1b802231d7 Kunkun Jiang 2023-12-06  741  
473e1b802231d7 Kunkun Jiang 2023-12-06  742  	if (res->start == CHIP1_TA_MBIGEN_PHY_BASE) {
473e1b802231d7 Kunkun Jiang 2023-12-06  743  		addr = ioremap(CHIP1_TA_PERI_PHY_BASE, 4);
473e1b802231d7 Kunkun Jiang 2023-12-06  744  		if (!addr) {
473e1b802231d7 Kunkun Jiang 2023-12-06  745  			pr_err("Unable to map CHIP1-TA-PERI\n");
473e1b802231d7 Kunkun Jiang 2023-12-06  746  			return -ENOMEM;
473e1b802231d7 Kunkun Jiang 2023-12-06  747  		}
473e1b802231d7 Kunkun Jiang 2023-12-06  748  
473e1b802231d7 Kunkun Jiang 2023-12-06  749  		writel_relaxed(1, addr);
473e1b802231d7 Kunkun Jiang 2023-12-06  750  		iounmap(addr);
473e1b802231d7 Kunkun Jiang 2023-12-06  751  
473e1b802231d7 Kunkun Jiang 2023-12-06  752  		addr = mgn_chip->base + MBIX_VPPI_ITS_TA;
473e1b802231d7 Kunkun Jiang 2023-12-06  753  		writel_relaxed(CHIP1_TA_MBIGEN_ITS_BASE, addr);
473e1b802231d7 Kunkun Jiang 2023-12-06  754  	}
473e1b802231d7 Kunkun Jiang 2023-12-06  755  
473e1b802231d7 Kunkun Jiang 2023-12-06  756  	if (res->start == CHIP1_TB_MBIGEN_PHY_BASE) {
473e1b802231d7 Kunkun Jiang 2023-12-06  757  		addr = ioremap(CHIP1_TB_PERI_PHY_BASE, 4);
473e1b802231d7 Kunkun Jiang 2023-12-06  758  		if (!addr) {
473e1b802231d7 Kunkun Jiang 2023-12-06  759  			pr_err("Unable to map CHIP1-TB-PERI\n");
473e1b802231d7 Kunkun Jiang 2023-12-06  760  			return -ENOMEM;
473e1b802231d7 Kunkun Jiang 2023-12-06  761  		}
473e1b802231d7 Kunkun Jiang 2023-12-06  762  
473e1b802231d7 Kunkun Jiang 2023-12-06  763  		writel_relaxed(1, addr);
473e1b802231d7 Kunkun Jiang 2023-12-06  764  		iounmap(addr);
473e1b802231d7 Kunkun Jiang 2023-12-06  765  
473e1b802231d7 Kunkun Jiang 2023-12-06  766  		addr = mgn_chip->base + MBIX_VPPI_ITS_TA;
473e1b802231d7 Kunkun Jiang 2023-12-06  767  		writel_relaxed(CHIP1_TB_MBIGEN_ITS_BASE, addr);
473e1b802231d7 Kunkun Jiang 2023-12-06  768  	}
473e1b802231d7 Kunkun Jiang 2023-12-06  769  
473e1b802231d7 Kunkun Jiang 2023-12-06  770  	return 0;
473e1b802231d7 Kunkun Jiang 2023-12-06  771  }
473e1b802231d7 Kunkun Jiang 2023-12-06  772  

:::::: The code at line 693 was first introduced by commit
:::::: 473e1b802231d790ba8eb31c0597d5b8eba306d6 mbigen: Sets the regs related to vtimer irqbypass

:::::: TO: Kunkun Jiang <jiangkunkun@huawei.com>
:::::: CC: Dongxu Sun <sundongxu3@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
