Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4968633F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Jun 2025 19:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749411702; cv=none; b=cmAjwqBHbOxkBGgUqLGYgsm7qouwicKC5O8d7VBt89ZBDjVARCyMTXZpR7hLElgLiqeV00loguN/S5JsogdqNYpOk3eLl+1WNGqxU72IvuYsFAendYAJftMG67G96MO8ijAal/bUjwHRQx6YbRJNRk4ifhFmrffCzO/ZANq0Yec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749411702; c=relaxed/simple;
	bh=KCOZ9q6JVRcqM/xq1NqQ+FFFx1MimruyaZKdiFh8icQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lB6qvD4bfr9KtRl5Lfa98//sDz+VD7yN0FZoh9ZPKzknLR/ULkpn64KQPScGYUR7cRb8qdTdmhMFZSwlajAnpU7KAWO8nmh2//DbXgRTsdGbKv+0R+Hher2G0dwE1RJiXqp/aLR29+4nPcRDjJyUlSnDMssireKcXUzGYEVztWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bd5Oe9fu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bd5Oe9fu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749411700; x=1780947700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KCOZ9q6JVRcqM/xq1NqQ+FFFx1MimruyaZKdiFh8icQ=;
  b=bd5Oe9fupaxzTBR7ujz7/t5iygTfHoQxElTDfxm/yhGhgKCYgl08nmSq
   p5H1oZhF5iEU1+D5jyFfiVISCx1X5edLrseAj4qDAlM6+eb+JigUuL6Wh
   HC/4BIJfbTmsVuwSxfYSQRa5pFYSAW2czl231IsJfAYqEFAe4PGAUvZQT
   tykTTGTS+exwTHEG4B31h1j8yaifEoy978CHiYh9jzcKSe6p27bRknzZT
   QGUiaaafE8lydLZaRhBHtq43nVgXBYqyrIwyZ3/l2F4wJZ1KH1zavyOLs
   xNu8kyX/SKn4MlUQAkjkP54UOaRFlh3nngpgDkqGpMyzJrlgY59Wc+GtT
   A==;
X-CSE-ConnectionGUID: 6y1P1R89TkOdazFDXgDIdw==
X-CSE-MsgGUID: J/R3F1++T5y2/URp7baIQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="62108688"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="62108688"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 12:41:40 -0700
X-CSE-ConnectionGUID: xwboVmoWRYuGxqUWPSGQ9A==
X-CSE-MsgGUID: Y4K1yQDORjCL8notBvhkZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="151194772"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jun 2025 12:41:39 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOLtg-0006XF-3D;
	Sun, 08 Jun 2025 19:41:36 +0000
Date: Mon, 9 Jun 2025 03:41:04 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cbeznea:for-mainline/SSGRLPCSRC-2694/pm-domain-issue-v3 19/25]
 drivers/pci/controller/pcie-rzg3s-host.c:45:49: error: implicit declaration
 of function 'FIELD_PREP'
Message-ID: <202506090332.efKZpwIh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/claudiubeznea/linux.git for-mainline/SSGRLPCSRC-2694/pm-domain-issue-v3
head:   113f0fb8fac8c74f0a0733efec43494f92fad91b
commit: bfb9647ecdc32b5364d7e843dbf66afe53364e97 [19/25] PCI: rzg3s-host: Add Initial PCIe Host Driver for Renesas RZ/G3S SoC
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250609/202506090332.efKZpwIh-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506090332.efKZpwIh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506090332.efKZpwIh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/pcie-rzg3s-host.c: In function 'rzg3s_pcie_child_read_conf':
>> drivers/pci/controller/pcie-rzg3s-host.c:45:49: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      45 | #define RZG3S_PCI_REQISS_TR_TP0_RD              FIELD_PREP(RZG3S_PCI_REQISS_TR_TYPE, 0x4)
         |                                                 ^~~~~~~~~~
   drivers/pci/controller/pcie-rzg3s-host.c:262:16: note: in expansion of macro 'RZG3S_PCI_REQISS_TR_TP0_RD'
     262 |         writel(RZG3S_PCI_REQISS_TR_TP0_RD, host->axi + RZG3S_PCI_REQISS);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/pci/controller/pcie-rzg3s-host.c:16:
   drivers/pci/controller/pcie-rzg3s-host.c: In function 'rzg3s_pcie_set_max_link_speed':
>> drivers/pci/controller/pcie-rzg3s-host.c:929:34: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     929 |                                  FIELD_GET(RZG3S_PCI_PCSTAT1_LTSSM_STATE, tmp) == ltssm_state_l0,
         |                                  ^~~~~~~~~
   include/linux/iopoll.h:47:21: note: in definition of macro 'read_poll_timeout'
      47 |                 if (cond) \
         |                     ^~~~
   include/linux/iopoll.h:170:9: note: in expansion of macro 'readx_poll_timeout'
     170 |         readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-rzg3s-host.c:928:15: note: in expansion of macro 'readl_poll_timeout'
     928 |         ret = readl_poll_timeout(host->axi + RZG3S_PCI_PCSTAT1, tmp,
         |               ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:616,
                    from include/asm-generic/bug.h:22,
                    from arch/openrisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/openrisc/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/delay.h:13,
                    from drivers/pci/controller/pcie-rzg3s-host.c:15:
   drivers/pci/controller/pcie-rzg3s-host.c:933:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'int' [-Wformat=]
     933 |                         "Could not set max link speed! LTSSM not in L0, state=%lx\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/pci/controller/pcie-rzg3s-host.c:932:17: note: in expansion of macro 'dev_dbg'
     932 |                 dev_dbg(host->dev,
         |                 ^~~~~~~
   drivers/pci/controller/pcie-rzg3s-host.c:933:81: note: format string is defined here
     933 |                         "Could not set max link speed! LTSSM not in L0, state=%lx\n",
         |                                                                               ~~^
         |                                                                                 |
         |                                                                                 long unsigned int
         |                                                                               %x


vim +/FIELD_PREP +45 drivers/pci/controller/pcie-rzg3s-host.c

    31	
    32	/* AXI registers */
    33	#define RZG3S_PCI_REQDATA(id)			(0x80 + (id) * 0x4)
    34	#define RZG3S_PCI_REQRCVDAT			0x8c
    35	#define RZG3S_PCI_REQADR1			0x90
    36	#define RZG3S_PCI_REQADR1_BUS			GENMASK(31, 24)
    37	#define RZG3S_PCI_REQADR1_DEV			GENMASK(23, 19)
    38	#define RZG3S_PCI_REQADR1_FUNC			GENMASK(18, 16)
    39	#define RZG3S_PCI_REQADR1_REG			GENMASK(11, 0)
    40	#define RZG3S_PCI_REQBE				0x98
    41	#define RZG3S_PCI_REQBE_BYTE_EN			GENMASK(3, 0)
    42	#define RZG3S_PCI_REQISS			0x9c
    43	#define RZG3S_PCI_REQISS_REQ_ISSUE		BIT(0)
    44	#define RZG3S_PCI_REQISS_TR_TYPE		GENMASK(11, 8)
  > 45	#define RZG3S_PCI_REQISS_TR_TP0_RD		FIELD_PREP(RZG3S_PCI_REQISS_TR_TYPE, 0x4)
    46	#define RZG3S_PCI_REQISS_TR_TP0_WR		FIELD_PREP(RZG3S_PCI_REQISS_TR_TYPE, 0x5)
    47	#define RZG3S_PCI_REQISS_MOR_STATUS		GENMASK(18, 16)
    48	#define RZG3S_PCI_MSIRCVWADRL			0x100
    49	#define RZG3S_PCI_MSIRCVWADRL_ENA		BIT(0)
    50	#define RZG3S_PCI_MSIRCVWADRL_MSG_DATA_ENA	BIT(1)
    51	#define RZG3S_PCI_MSIRCVWADRU			0x104
    52	#define RZG3S_PCI_MSIRCVWMSKL			0x108
    53	#define RZG3S_PCI_MSIRCVWMSKU			0x10c
    54	#define RZG3S_PCI_PINTRCVIE			0x110
    55	#define RZG3S_PCI_PINTRCVIE_INTX(i)		BIT(i)
    56	#define RZG3S_PCI_PINTRCVIE_MSI			BIT(4)
    57	#define RZG3S_PCI_PINTRCVIS			0x114
    58	#define RZG3S_PCI_PINTRCVIS_INTX(i)		BIT(i)
    59	#define RZG3S_PCI_PINTRCVIS_MSI			BIT(4)
    60	#define RZG3S_PCI_MSGRCVIE			0x120
    61	#define RZG3S_PCI_MSGRCVIE_MSG_RCV		BIT(24)
    62	#define RZG3S_PCI_MSGRCVIS			0x124
    63	#define RZG3S_PCI_MSGRCVIS_MRI			BIT(24)
    64	#define RZG3S_PCI_PEIE0				0x200
    65	#define RZG3S_PCI_PEIS0				0x204
    66	#define RZG3S_PCI_PEIS0_DL_UPDOWN		BIT(9)
    67	#define RZG3S_PCI_PEIS0_RX_DLLP_PM_ENTER	BIT(12)
    68	#define RZG3S_PCI_PEIE1				0x208
    69	#define RZG3S_PCI_PEIS1				0x20c
    70	#define RZG3S_PCI_AMEIE				0x210
    71	#define RZG3S_PCI_AMEIS				0x214
    72	#define RZG3S_PCI_ASEIE1			0x220
    73	#define RZG3S_PCI_ASEIS1			0x224
    74	#define RZG3S_PCI_PCSTAT1			0x408
    75	#define RZG3S_PCI_PCSTAT1_DL_DOWN_STS		BIT(0)
    76	#define RZG3S_PCI_PCSTAT1_LTSSM_STATE		GENMASK(14, 10)
    77	#define RZG3S_PCI_PCCTRL2			0x410
    78	#define RZG3S_PCI_PCCTRL2_LS_CHG_REQ		BIT(0)
    79	#define RZG3S_PCI_PCCTRL2_LS_CHG		GENMASK(9, 8)
    80	#define RZG3S_PCI_PCSTAT2			0x414
    81	#define RZG3S_PCI_PCSTAT2_STATE_RX_DETECT	GENMASK(15, 8)
    82	#define RZG3S_PCI_PCSTAT2_SDRIRE		GENMASK(7, 0)
    83	#define RZG3S_PCI_PCSTAT2_LS_CHG_DONE		BIT(28)
    84	#define RZG3S_PCI_PERM				0x300
    85	#define RZG3S_PCI_PERM_PIPE_PHY_REG_EN		BIT(1)
    86	#define RZG3S_PCI_PERM_CFG_HWINIT_EN		BIT(2)
    87	#define RZG3S_PCI_MSIRE(id)			(0x600 + (id) * 0x10)
    88	#define RZG3S_PCI_MSIRE_ENA			BIT(0)
    89	#define RZG3S_PCI_MSIRM(id)			(0x608 + (id) * 0x10)
    90	#define RZG3S_PCI_MSIRS(id)			(0x60c + (id) * 0x10)
    91	#define RZG3S_PCI_AWBASEL(id)			(0x1000 + (id) * 0x20)
    92	#define RZG3S_PCI_AWBASEL_WIN_ENA		BIT(0)
    93	#define RZG3S_PCI_AWBASEU(id)			(0x1004 + (id) * 0x20)
    94	#define RZG3S_PCI_AWMASKL(id)			(0x1008 + (id) * 0x20)
    95	#define RZG3S_PCI_AWMASKU(id)			(0x100c + (id) * 0x20)
    96	#define RZG3S_PCI_ADESTL(id)			(0x1010 + (id) * 0x20)
    97	#define RZG3S_PCI_ADESTU(id)			(0x1014 + (id) * 0x20)
    98	#define RZG3S_PCI_PWBASEL(id)			(0x1100 + (id) * 0x20)
    99	#define RZG3S_PCI_PWBASEL_ENA			BIT(0)
   100	#define RZG3S_PCI_PWBASEU(id)			(0x1104 + (id) * 0x20)
   101	#define RZG3S_PCI_PDESTL(id)			(0x1110 + (id) * 0x20)
   102	#define RZG3S_PCI_PDESTU(id)			(0x1114 + (id) * 0x20)
   103	#define RZG3S_PCI_PWMASKL(id)			(0x1108 + (id) * 0x20)
   104	#define RZG3S_PCI_PWMASKU(id)			(0x110c + (id) * 0x20)
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
