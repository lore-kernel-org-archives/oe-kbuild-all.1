Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F221EA85
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Sep 2024 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726759629; cv=none; b=pyva554S3IvEb6Vs612HC0oEVznwcCN6FM8ScUv0KzJniNWY6AC/3Xb+BAAhEkvcK/GItqS267LqB/Ed3TBtZYRjWGlMw6YUs8bysrn+talhWZ2kBVUyUY2xneuLwplEcZfdpMDdb3ZaQ1D2y49zSNB1KLEg3G8/LXS6MNINeoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726759629; c=relaxed/simple;
	bh=f+93S07JPyf7+ebhUltrYqraxhdgMSiGnq4L5OKJDjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O9kF/q0McKDsHgoypChS5X5f+lk6Wn93sd/Q8C0dSGNY2FLWH4WMByKnzBrcRwf7C4hwaczpoIr4H2LGAhSqoKD1Naep1F2wG/R2hcT8nxK1A9eiBf6aRFltAzKNw6ywfk9J4MBpWHO0L2VDGEudxhQWCIk2tPMiO1m1rac03b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMkVHWPD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMkVHWPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726759626; x=1758295626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f+93S07JPyf7+ebhUltrYqraxhdgMSiGnq4L5OKJDjc=;
  b=BMkVHWPDj/3DkZI5jC9vJLg745Ci1dmTa1s9wD/ng1uI9XFoKo6L3ChA
   SdXONDhNbzWJRvYG5Q6btG+bM1bmTr+4qBUGjYpoqY9pPGuHPteBaZvLP
   itUSK1UKQjx2vPhDLJvaFUyQb0fElADdKUvt/8nqywnrt3exa+muD3Ull
   Owapr8yabjE90ShBCbiZLEkk5edo6naGWNgrVJuoRPjeMGSFjCRNqBzxo
   BEzMl3aE4M2uYluqze/IYWaYyVCFM/I0DZmNl98uTRbOqyHXSPYdCT7r5
   ZybonYDVdkAffHRJ9IKG8CScmK/7/hU+f0GYFNpdnIh6B77ZVfWA0B8YE
   A==;
X-CSE-ConnectionGUID: 4LrUjQfzSmqCvUT7sH1ovA==
X-CSE-MsgGUID: bCcRbl/DQsaQOBa2f/oVbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25558634"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="25558634"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 08:27:06 -0700
X-CSE-ConnectionGUID: Mdde5aPhR5uUVrgmJH/ArA==
X-CSE-MsgGUID: lPb/aZ/iSf6OQJY1BkhnfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="74508359"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Sep 2024 08:27:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srJ3c-000DPY-2q;
	Thu, 19 Sep 2024 15:27:00 +0000
Date: Thu, 19 Sep 2024 23:26:51 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 10805/10978]
 drivers/ata/ahci_zhaoxin_sgpio.c:31:5: sparse: sparse: symbol
 'ahci_wait_em_reset' was not declared. Should it be static?
Message-ID: <202409192350.fiBKvYgq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   45d184515738e4fdb0e2ab06857b080fae646152
commit: 7163102e0aaa3f66d264a6076436c717a13762a1 [10805/10978] ata: ahci: Add support for AHCI SGPIO Enclosure Management
config: x86_64-randconfig-121-20240919 (https://download.01.org/0day-ci/archive/20240919/202409192350.fiBKvYgq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409192350.fiBKvYgq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409192350.fiBKvYgq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ata/ahci_zhaoxin_sgpio.c:31:5: sparse: sparse: symbol 'ahci_wait_em_reset' was not declared. Should it be static?
>> drivers/ata/ahci_zhaoxin_sgpio.c:55:6: sparse: sparse: symbol 'ahci_zhaoxin_set_em_sgpio' was not declared. Should it be static?
>> drivers/ata/ahci_zhaoxin_sgpio.c:99:6: sparse: sparse: symbol 'ahci_zhaoxin_set_em_sgpio_gpmode' was not declared. Should it be static?
>> drivers/ata/ahci_zhaoxin_sgpio.c:552:18: sparse: sparse: symbol 'sgpio_attrs' was not declared. Should it be static?
>> drivers/ata/ahci_zhaoxin_sgpio.c:563:30: sparse: sparse: symbol 'sgpio_groups' was not declared. Should it be static?
>> drivers/ata/ahci_zhaoxin_sgpio.c:591:24: sparse: sparse: symbol 'sgpio_zhaoxin_sysfs_ops' was not declared. Should it be static?
>> drivers/ata/ahci_zhaoxin_sgpio.c:596:24: sparse: sparse: symbol 'sgpio_zhaoxin_ktype' was not declared. Should it be static?
>> drivers/ata/ahci_zhaoxin_sgpio.c:601:6: sparse: sparse: symbol 'set_em_messages' was not declared. Should it be static?
>> drivers/ata/ahci_zhaoxin_sgpio.c:621:5: sparse: sparse: symbol 'add_sgpio_zhaoxin' was not declared. Should it be static?
>> drivers/ata/ahci_zhaoxin_sgpio.c:673:6: sparse: sparse: symbol 'remove_sgpio_zhaoxin' was not declared. Should it be static?
   drivers/ata/ahci_zhaoxin_sgpio.c:272:16: sparse: sparse: context imbalance in 'ahci_transmit_sgpio_indicator_gp' - different lock contexts for basic block

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
