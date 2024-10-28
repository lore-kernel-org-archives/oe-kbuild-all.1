Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB562185B58
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 11:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730116802; cv=none; b=fMUrsCsAfWzHBrf7A/gQFkYjRHV4zLObf7nRNgc4IyYACn7CwY5OwD5/7u4LrgV59MaNxYi7lLdGhtuvb0qlLNMCEj3Vm+CLGAHrKRWeEKK9utIURajBTFtuzyWRHEnC3qUgU6UD15XpPLaagFxW0c872ncED06rHETxzpbLvho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730116802; c=relaxed/simple;
	bh=J9vblrD4eV+nwZDperfa8tgyh7KPAfgD4ctt8G1NPLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n7VgbMJGQUBTpedyNEcgDhE2Ag7swfK3PXvE8Pxrsd/sxltLtatkUyo7Lrk8vX1Sd9eAieU3UsN/MIhgk5G0gmpOWeU25c+Yi1WFPcoQ5d+hJeTYvz/6z7Kzw7Mi6HavRQgpmpaO8FACO8AumNocHzK+VNFHekJIG0Sq/4xGF7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OFP3jzfG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OFP3jzfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730116800; x=1761652800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J9vblrD4eV+nwZDperfa8tgyh7KPAfgD4ctt8G1NPLo=;
  b=OFP3jzfGvkSgnqqDv58Gv7mXuK0+NbHxUWw/WaiN/NLBct1mzCeoONXT
   snVVLEowZfqh6AQb3UgSSPxO7ZWeRWGjgbTNCKeywLOBrzexsb39jPJmr
   KBRezEfuQ4ws+0A2YR6e8ID8Wd1fF+s1dsKsfque1TY+Ps20Sm8Ons8Ty
   AaX+IDMQmWKIVXDPpUqeGboA2SgEQk4SZKOsHDOLr3q6v6k9xsmHDBkUh
   HZ/VbtmXUnIo8/uMEFKBeyL2WPNymcV1IwY9c92TleVV17HrgwmPHV+ht
   gR8ysFbN+vDnXjt16sPr+kF2SsNQ1Mms/flGXQiGLRrrti4QQNBDNLHP7
   A==;
X-CSE-ConnectionGUID: +u6YQ+8mSwep0kY/EvMvoA==
X-CSE-MsgGUID: t36vLFa1T7mzeZ6vNYY1zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29572863"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29572863"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 05:00:00 -0700
X-CSE-ConnectionGUID: QO/RFpIrT5WKv5KA9bEhAw==
X-CSE-MsgGUID: 6PEXDnp1Txq6KWMQUGkRmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="81496682"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Oct 2024 04:59:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5OPb-000cOo-1T;
	Mon, 28 Oct 2024 11:59:55 +0000
Date: Mon, 28 Oct 2024 19:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, weiyuchen <weiyuchen3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 28630/30000]
 drivers/irqchip/irq-mbigen.c:693:12: warning: 'vtimer_mbigen_set_regs'
 defined but not used
Message-ID: <202410281921.NaI3m81D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi weiyuchen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a0194593a9cec12b03a0b5d84cbc937243e65153
commit: a8af21a94f6331eb77ca486a511cbbb548de94df [28630/30000] mbigen: add kvm dependency
config: arm64-randconfig-001-20241028 (https://download.01.org/0day-ci/archive/20241028/202410281921.NaI3m81D-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410281921.NaI3m81D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410281921.NaI3m81D-lkp@intel.com/

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
