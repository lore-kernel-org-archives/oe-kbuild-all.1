Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54D82D0C90
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 18:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765220350; cv=none; b=lPlJO5Qg0I2kMSw/V/hLPKqC1RzZ4LZkuN6jU4A8O3WPfgW+RFNELLrxWtNqPtE+r9wPeBEO73/bchON6deTSPHphvmc6CVaNIL1NtUI26XrJDqRTR3adAFzcdUolSGn9RGRgx93z0lvtS99UGTxMixzJlvWX4joGKERLnnh3L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765220350; c=relaxed/simple;
	bh=Fyw3XzqlmmOm8giLgNlIw49fP6q5cvv/1utTtdg1a8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=piqq3+J47ApUgYNWtxabCVY3RpupXMuM+uhzuy9LRujRAy1I4m7wu6nHNuX4nUtFj01bG21nHmyG30kKEIRvVdst4pGbv7vtXjdh+BIaurjdNwwIm4/9NEX+M7zSB0d2oABhka7Ylt3G39N319GonXFgqNbI75arymeTl70rK0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zm8W477o; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zm8W477o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765220347; x=1796756347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fyw3XzqlmmOm8giLgNlIw49fP6q5cvv/1utTtdg1a8Y=;
  b=Zm8W477o7ouTSA557SD9TEyuA5Okm78loYUKeiHQx60IzjItewDOCtzy
   I2IoOwBRj4Mj+WxdtgjY8gGttPVSQe8UbbaB0psndxvsVy1AGoDDWTtX3
   ceQjnaukavUMX81bPHVpyri6SRqASDx6g+Ks+DPuxB1TpQTevYEyY2vTe
   3Y8fqf5Wy/HgKBRBJIBrGOu0mRaGS3Xnk/871ZEBWpY/vNaD1HWiHd7bN
   phXwiF9iRh8kPidt4Bhn5nQgVOEYM9QuAem+TpfuF0cmt5CcKTNSwPAjk
   XaKvIxB/MSdW8GVLc8dbpUNhaqNBICtjWSDfaZc1+RwhvCZasq+/LTkLf
   A==;
X-CSE-ConnectionGUID: /bAXG8URSvWXmee4L9PiVQ==
X-CSE-MsgGUID: nvrS4gWhQF6FYrQpwaBJIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="66351841"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="66351841"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 10:59:06 -0800
X-CSE-ConnectionGUID: HGTTfO2fTWWedQXgnrNmXA==
X-CSE-MsgGUID: 5AZR5sAtRTa1Z5yvPzutUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="196062153"
Received: from igk-lkp-server01.igk.intel.com (HELO a9286e139fc0) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 08 Dec 2025 10:59:05 -0800
Received: from kbuild by a9286e139fc0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSgRq-000000002Er-4C7U;
	Mon, 08 Dec 2025 18:59:03 +0000
Date: Mon, 8 Dec 2025 19:58:59 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3493/3493] drivers/ata/ahci_zhaoxin_sgpio.c:31:5:
 warning: no previous prototype for 'ahci_wait_em_reset'
Message-ID: <202512081930.DAECHxia-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   36141432a37f7dedddde8825e724b07ce3a440fb
commit: fb43492008c11fe89e510dd63383a2d37ea3cf8e [3493/3493] ata: ahci: Add support for AHCI SGPIO Enclosure Management
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251208/202512081930.DAECHxia-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512081930.DAECHxia-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512081930.DAECHxia-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ata/ahci_zhaoxin_sgpio.c:31:5: warning: no previous prototype for 'ahci_wait_em_reset' [-Wmissing-prototypes]
      31 | int ahci_wait_em_reset(struct sgpio_zhaoxin *sgpio_zhaoxin, u32 retry)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/ata/ahci_zhaoxin_sgpio.c:55:6: warning: no previous prototype for 'ahci_zhaoxin_set_em_sgpio' [-Wmissing-prototypes]
      55 | void ahci_zhaoxin_set_em_sgpio(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ata/ahci_zhaoxin_sgpio.c:99:6: warning: no previous prototype for 'ahci_zhaoxin_set_em_sgpio_gpmode' [-Wmissing-prototypes]
      99 | void ahci_zhaoxin_set_em_sgpio_gpmode(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ata/ahci_zhaoxin_sgpio.c:601:6: warning: no previous prototype for 'set_em_messages' [-Wmissing-prototypes]
     601 | void set_em_messages(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^~~~~~~~~~~~~~~
>> drivers/ata/ahci_zhaoxin_sgpio.c:621:5: warning: no previous prototype for 'add_sgpio_zhaoxin' [-Wmissing-prototypes]
     621 | int add_sgpio_zhaoxin(void)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/ata/ahci_zhaoxin_sgpio.c:673:6: warning: no previous prototype for 'remove_sgpio_zhaoxin' [-Wmissing-prototypes]
     673 | void remove_sgpio_zhaoxin(void)
         |      ^~~~~~~~~~~~~~~~~~~~


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
