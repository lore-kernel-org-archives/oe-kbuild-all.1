Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F751A2645
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 09:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733303673; cv=none; b=tIiCd/tYcVnnsd9OONhckvcmNvRt8ayj6Manm/UFqen7qIii+RyhChSz9HJQ2T0GHdQGDjrX725WoWzmLu4OX55tV0pR6Ooky9QxAijQa8wpAO1NM8G+17DAKIwyBLa1Gq2a/bvqTe60n6iyIwzooN8QvY3ASEK5fehszMFVj8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733303673; c=relaxed/simple;
	bh=PXY95rInxihAPom8BgP17qAlsCcIOs15tHfB2Bn/aH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d1GQ0d3Hddd1m+kkoe8mKQME0goqYeoaQus8jYrMa5r5GZmujEXy9SjkiMMI9z3KJPaoVJtnWdW+gT7iroIZtE6H0aJyjU1dQFghYPyzAuxK1Szw28RElrSC/ynWHS/TF0maBc5HmsKoZ3+XLNx7z13G83ZBCLZcYP3ZvsRXMcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4dGU5kQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4dGU5kQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733303671; x=1764839671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PXY95rInxihAPom8BgP17qAlsCcIOs15tHfB2Bn/aH4=;
  b=S4dGU5kQXqdARVYOH5fOL/xuaebpzLmw4JXiklO5vRBsa6fMl9Pvkf/u
   tE+eg8llA/8dUtk3WsaW6mZQdcLKPC8+FdqqU4sMLFlv752klH3BKbWjR
   soykqHrtA1ypjsWlZNTHqIWknxV6U4wljH7eqltgT1pZokpwgxMCitCpl
   7YDTQUpwUY5Q0a683n9Fvu7bZHlOKDZ5yo06duX8wadcIIRN8FhGuS8Dm
   tkVFZVC6HWSyrKq2F5hIPWjEAAvT84xgXXGBQcmS/5J/mQ/Zr7TKhlXPj
   6m0QEdJK9ypz//m+ConlbXGO9gPzlfIi+Icf2tAFGqM2hjB1+GZrbpYhh
   A==;
X-CSE-ConnectionGUID: AqkAnEd0R5OcZ6kkIECVXQ==
X-CSE-MsgGUID: qp5+/Zc+Q4aP5vpsZOBIgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33689551"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="33689551"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 01:14:30 -0800
X-CSE-ConnectionGUID: 2tAWO3EwSZWuhdnC8+OFbQ==
X-CSE-MsgGUID: +yAefypKTj2NGThzZPO6oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="93891142"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 04 Dec 2024 01:14:29 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIlSg-0002oh-11;
	Wed, 04 Dec 2024 09:14:23 +0000
Date: Wed, 4 Dec 2024 17:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, LeoLiu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1584/1584] drivers/ata/ahci_zhaoxin_sgpio.c:31:5:
 warning: no previous prototype for function 'ahci_wait_em_reset'
Message-ID: <202412041754.ZiNZbWX3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8a512be8da229a21f36ac0a0253414f2fb9ac174
commit: fb43492008c11fe89e510dd63383a2d37ea3cf8e [1584/1584] ata: ahci: Add support for AHCI SGPIO Enclosure Management
config: x86_64-buildonly-randconfig-006 (https://download.01.org/0day-ci/archive/20241204/202412041754.ZiNZbWX3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041754.ZiNZbWX3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041754.ZiNZbWX3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/ata/ahci_zhaoxin_sgpio.c:10:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ata/ahci_zhaoxin_sgpio.c:31:5: warning: no previous prototype for function 'ahci_wait_em_reset' [-Wmissing-prototypes]
      31 | int ahci_wait_em_reset(struct sgpio_zhaoxin *sgpio_zhaoxin, u32 retry)
         |     ^
   drivers/ata/ahci_zhaoxin_sgpio.c:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      31 | int ahci_wait_em_reset(struct sgpio_zhaoxin *sgpio_zhaoxin, u32 retry)
         | ^
         | static 
>> drivers/ata/ahci_zhaoxin_sgpio.c:55:6: warning: no previous prototype for function 'ahci_zhaoxin_set_em_sgpio' [-Wmissing-prototypes]
      55 | void ahci_zhaoxin_set_em_sgpio(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^
   drivers/ata/ahci_zhaoxin_sgpio.c:55:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      55 | void ahci_zhaoxin_set_em_sgpio(struct sgpio_zhaoxin *sgpio_zhaoxin)
         | ^
         | static 
>> drivers/ata/ahci_zhaoxin_sgpio.c:99:6: warning: no previous prototype for function 'ahci_zhaoxin_set_em_sgpio_gpmode' [-Wmissing-prototypes]
      99 | void ahci_zhaoxin_set_em_sgpio_gpmode(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^
   drivers/ata/ahci_zhaoxin_sgpio.c:99:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      99 | void ahci_zhaoxin_set_em_sgpio_gpmode(struct sgpio_zhaoxin *sgpio_zhaoxin)
         | ^
         | static 
>> drivers/ata/ahci_zhaoxin_sgpio.c:601:6: warning: no previous prototype for function 'set_em_messages' [-Wmissing-prototypes]
     601 | void set_em_messages(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^
   drivers/ata/ahci_zhaoxin_sgpio.c:601:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     601 | void set_em_messages(struct sgpio_zhaoxin *sgpio_zhaoxin)
         | ^
         | static 
>> drivers/ata/ahci_zhaoxin_sgpio.c:621:5: warning: no previous prototype for function 'add_sgpio_zhaoxin' [-Wmissing-prototypes]
     621 | int add_sgpio_zhaoxin(void)
         |     ^
   drivers/ata/ahci_zhaoxin_sgpio.c:621:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     621 | int add_sgpio_zhaoxin(void)
         | ^
         | static 
>> drivers/ata/ahci_zhaoxin_sgpio.c:673:6: warning: no previous prototype for function 'remove_sgpio_zhaoxin' [-Wmissing-prototypes]
     673 | void remove_sgpio_zhaoxin(void)
         |      ^
   drivers/ata/ahci_zhaoxin_sgpio.c:673:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     673 | void remove_sgpio_zhaoxin(void)
         | ^
         | static 
   11 warnings generated.


vim +/ahci_wait_em_reset +31 drivers/ata/ahci_zhaoxin_sgpio.c

    25	
    26	static unsigned int zhaoxin_em_type __read_mostly = AHCI_EM_MSG_LED_MODE; /*LED protocol*/
    27	module_param(zhaoxin_em_type, int, 0644);
    28	MODULE_PARM_DESC(zhaoxin_em_type,
    29		"AHCI Enclosure Management Message type control (1 = led on, 2 = sgpio on,3 = sgpio gp on)");
    30	
  > 31	int ahci_wait_em_reset(struct sgpio_zhaoxin *sgpio_zhaoxin, u32 retry)
    32	{
    33		void __iomem *mmio = sgpio_zhaoxin->mmio;
    34		u32 em_ctl;
    35	
    36		if (!sgpio_zhaoxin || retry == 0) {
    37			pr_err("In ahci wait em reset, invalid param\n");
    38			return -EINVAL;
    39		}
    40	
    41		while (retry--) { /*EM_CTL needs reset at least 64ms*/
    42			em_ctl = readl(mmio + HOST_EM_CTL);
    43			if (em_ctl & EM_CTL_RST)
    44				usleep_range(10000, 20000); /*EM_CTL still in reset, usleep 10ms*/
    45			else
    46				break;
    47	
    48			if (!retry)
    49				pr_err("Wait for EM_CTL reset, time out\n");
    50		}
    51	
    52		return 0;
    53	}
    54	
  > 55	void ahci_zhaoxin_set_em_sgpio(struct sgpio_zhaoxin *sgpio_zhaoxin)
    56	{
    57		void __iomem *mmio = sgpio_zhaoxin->mmio;
    58		void __iomem *em_mmio = mmio + SGPIO_OFFSET;
    59	
    60		u32 read;
    61	
    62		sgpio_zhaoxin->sgpio_reg.cfg_0.enable = 1;
    63	
    64		sgpio_zhaoxin->sgpio_reg.cfg_1.blink_gen_a = 0x7;
    65		sgpio_zhaoxin->sgpio_reg.cfg_1.blink_gen_b = 0x3;
    66		sgpio_zhaoxin->sgpio_reg.cfg_1.blink_gen_c = 0x0;
    67		sgpio_zhaoxin->sgpio_reg.cfg_1.stretch_act_on = 0;
    68		sgpio_zhaoxin->sgpio_reg.cfg_1.stretch_act_off = 0;
    69		sgpio_zhaoxin->sgpio_reg.cfg_1.max_act_on = 2;
    70		sgpio_zhaoxin->sgpio_reg.cfg_1.force_act_off = 1;
    71	
    72		sgpio_zhaoxin->sgpio_reg.gp_transmit_cfg.sload = 0xf;
    73		sgpio_zhaoxin->sgpio_reg.gp_transmit_cfg.count = 0x0;
    74	
    75		sgpio_zhaoxin->sgpio_reg.transmit_0.sgpio_tx_0 = 0;
    76		sgpio_zhaoxin->sgpio_reg.transmit_1.sgpio_tx_1 = 0;
    77		sgpio_zhaoxin->sgpio_reg.gp_transmit_reg.sgpio_tx_gp = 0;
    78	
    79		sgpio_zhaoxin->sgpio_reg.receive_reg.sgpio_rx = 0x07070707;
    80		sgpio_zhaoxin->sgpio_reg.gp_receive_reg.sgpio_rx_gp = 0;
    81	
    82		/*Setup SGPIO type*/
    83		read = readl(mmio + sgpio_zhaoxin->em_loc);
    84		read = read | SGPIO_MESSAGE_HEAD;  /*LED register MSG_HEAD, select SGPIO*/
    85		writel(read, mmio + sgpio_zhaoxin->em_loc);
    86	
    87		/*Setup gp mode*/
    88		writel(sgpio_zhaoxin->sgpio_reg.gp_transmit_cfg.sgpio_tx_gp_cfg, em_mmio + 0x38);
    89	
    90		/*Initial SGPIO CFG1*/
    91		writel(sgpio_zhaoxin->sgpio_reg.cfg_1.sgpio_cfg_1, em_mmio + 0x4);
    92	
    93		/*Initial SGPIO CFG0*/
    94		read = readl(em_mmio);
    95		read |= sgpio_zhaoxin->sgpio_reg.cfg_0.sgpio_cfg_0;
    96		writel(read, em_mmio);
    97	}
    98	
  > 99	void ahci_zhaoxin_set_em_sgpio_gpmode(struct sgpio_zhaoxin *sgpio_zhaoxin)
   100	{
   101		void __iomem *mmio = sgpio_zhaoxin->mmio;
   102		void __iomem *em_mmio = mmio + SGPIO_OFFSET;
   103		u32 read;
   104	
   105		sgpio_zhaoxin->sgpio_reg.cfg_0.enable = 1;
   106	
   107		sgpio_zhaoxin->sgpio_reg.gp_transmit_cfg.sload = 0xf;
   108		sgpio_zhaoxin->sgpio_reg.gp_transmit_cfg.count = 0xff;
   109	
   110		sgpio_zhaoxin->sgpio_reg.transmit_0.sgpio_tx_0 = 0;
   111		sgpio_zhaoxin->sgpio_reg.transmit_1.sgpio_tx_1 = 0;
   112		sgpio_zhaoxin->sgpio_reg.gp_transmit_reg.sgpio_tx_gp = 0;
   113	
   114		sgpio_zhaoxin->sgpio_reg.receive_reg.sgpio_rx = 0;
   115		sgpio_zhaoxin->sgpio_reg.gp_receive_reg.sgpio_rx_gp = 0xff0f0000;
   116	
   117		/*Setup SGPIO type*/
   118		read = readl(mmio + sgpio_zhaoxin->em_loc);
   119		read |= SGPIO_MESSAGE_HEAD;
   120		writel(read, mmio + sgpio_zhaoxin->em_loc);
   121	
   122		/*Setup gp mode*/
   123		writel(sgpio_zhaoxin->sgpio_reg.gp_transmit_cfg.sgpio_tx_gp_cfg, em_mmio + 0x38);
   124	
   125		/*Enable SGPIO*/
   126		writel(sgpio_zhaoxin->sgpio_reg.cfg_0.sgpio_cfg_0, em_mmio);
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
