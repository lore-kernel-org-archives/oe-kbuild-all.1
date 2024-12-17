Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173B314A095
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Dec 2024 06:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734417440; cv=none; b=LojcWFp3ORlTsrkpXR1+MALQNHOYhg2d38jbwetK7+/5l6/6St3cSjUT0ZgPYITt2WvwuFWuQg1Utt+aIMDCxJUlU4S/M3Cb9TFDvWzvfhoPFUqqx7P5XR4tGBb4FpISI/rZ6eBdC6ClX1wmDB8m+fsxzbdwczAWLAdYO/k2btY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734417440; c=relaxed/simple;
	bh=7/aEd4C0gZAhZK9n1/06wNGN9fwYGmYy84jQoOzZaUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ms5ic9Wwk2pQCwpHSTqkHMV8fph7pocKWbZ1V+NJAbkkfQG1JuXlpR1G2Ceztx9GvbnAGre40/o2Z4C0ly+b0+Hzl4yviWJRuxHY7a2t4lerQ5AU3Pbu/FuZN3vUQpivJ0jUHeIzBbn9lbgYEDAEXkSaD5GQDkue9W8085HkS/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYCKk+E2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYCKk+E2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734417439; x=1765953439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7/aEd4C0gZAhZK9n1/06wNGN9fwYGmYy84jQoOzZaUI=;
  b=QYCKk+E20Cf6hHIbpGywoP334jmNz2l8m/kW3mZfXeP6PNU9KchtEmxw
   yFTGMg8oiAPeELYErzLobfuWPNX0S0xKmodc1X2m5vSdP751Xy4uZGIt3
   65YSon/NSpkGAvwZIQEUhDkc1ixLrjyhFLSRHz+eyc4glTCO9/eW/4+/0
   JLQBcxjcWaJb3mRH2df5mxiqZdWb07276iYjSKRAWjvH53uTt8qM295Ff
   tLfPEhmQoqWh7UboXD6dAIijpUeGLxqX0AvEJu68e/cizCrVyoVSl0NyS
   ejPp16/RCQDYjJ6zQVPJPvyGR6WAlHpu2qYv/pEtG/WhrGZyenctlD9g5
   w==;
X-CSE-ConnectionGUID: tbIHkNUiS6+BTdEhXnLPSA==
X-CSE-MsgGUID: tPcJmBBETEyv9z3+lE0IUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45313567"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45313567"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 22:37:17 -0800
X-CSE-ConnectionGUID: T9JGsbnETC2G0/byW+VH6A==
X-CSE-MsgGUID: mQsdAXKsTL6gxuB3DTFs1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="97882736"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Dec 2024 22:37:14 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNRCi-000ElI-1h;
	Tue, 17 Dec 2024 06:37:12 +0000
Date: Tue, 17 Dec 2024 14:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, LeoLiu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1640/1640] drivers/ata/ahci_zhaoxin_sgpio.c:31:5:
 sparse: sparse: symbol 'ahci_wait_em_reset' was not declared. Should it be
 static?
Message-ID: <202412171410.nclKCZrX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   46064348cc445799cf9e8fd030323a0426fbb5e4
commit: fb43492008c11fe89e510dd63383a2d37ea3cf8e [1640/1640] ata: ahci: Add support for AHCI SGPIO Enclosure Management
config: x86_64-randconfig-122-20241217 (https://download.01.org/0day-ci/archive/20241217/202412171410.nclKCZrX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412171410.nclKCZrX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412171410.nclKCZrX-lkp@intel.com/

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
