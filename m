Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CAD198E91
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 19:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747336934; cv=none; b=lqXdSShWT+KcY4QETKG5sof1XGXT99XisLMPcCELWpOobPiss83I+P0SVM1qYCNjhnX99Op/2PPX0WxXIlZc87Vgj7yQ8JzkvnoB6NgVZi1kd5EtiVV74HXiFmVWelcI+uwyQjQh7RoK3QzorASiZ8B75PSbTP7haNldkJthsRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747336934; c=relaxed/simple;
	bh=3ASxSs+E2yIcW7/xhEpxHxMhnBcYXz8KH9uwhQYlS1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VXCYSSj23xTpsyv/e/GJA59K18vA+bM16cF9T06I0nmvRCbWV+95YJLBcRl60x5PPMRCKwUNOZ5oXiswJbtUbxfyqJl0zeu+MW8Wj2zlokHwux2S0UExPwMDf6RbGKZ6BUbfzo82ODf4Dy0ZpbTfMXtW/rjk/bCIIqsVqpYiEs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mw8eygmn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mw8eygmn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747336932; x=1778872932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ASxSs+E2yIcW7/xhEpxHxMhnBcYXz8KH9uwhQYlS1s=;
  b=mw8eygmnFhk6uNRto7gtrkOYlMRJqXZmZWKzPd0wsznc17Gd2q0FwCjw
   qLOY+7Cvg2JIaFFuEpt1LvJX2HucevhU1DtiTgQzTW7HAA4FMkHCrl8ej
   goNc6dtAtj5JWbJCDDXMT2Vw6LUk9/zuBjzCH8oEFlMqx2LCscTr20lEZ
   zo3XPmWQ3XBuU+QPQQzUtlo+UPuMQA+ZkpTkBJ9mKycFqDO5tL6dpYXsF
   jStgSJY1UAfyeUaADDN7bhl4tvwIJRfja11w7jYnj/wAtrEMCuyVMWxa2
   s21OK0nfAQ6eUbbPYLgQHTtxJlMsdetl+QmOKWb2zRtUoU42tLwfhuGFN
   Q==;
X-CSE-ConnectionGUID: 8FuUPOVERWmXHtHtXjvgsg==
X-CSE-MsgGUID: lwIEOB6fTIinFHKs4pyg+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="66699781"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="66699781"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 12:22:11 -0700
X-CSE-ConnectionGUID: 15UFCu2uSwelmTklactEfg==
X-CSE-MsgGUID: cBDL3SnsSIm9ANYn6Uhfiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="138329773"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa010.jf.intel.com with ESMTP; 15 May 2025 12:22:10 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFe9g-0000Ih-04;
	Thu, 15 May 2025 19:22:08 +0000
Date: Fri, 16 May 2025 03:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2229/2229] drivers/ata/ahci_zhaoxin_sgpio.c:31:5:
 warning: no previous prototype for function 'ahci_wait_em_reset'
Message-ID: <202505160312.82TOlGtS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   baf4f02470215e4f896899f495ff7ac7fbfda979
commit: fb43492008c11fe89e510dd63383a2d37ea3cf8e [2229/2229] ata: ahci: Add support for AHCI SGPIO Enclosure Management
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250516/202505160312.82TOlGtS-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505160312.82TOlGtS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505160312.82TOlGtS-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   6 warnings generated.


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
