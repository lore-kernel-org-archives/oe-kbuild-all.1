Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2A9153BF3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 13:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714744358; cv=none; b=W84JYiQ0K1001C1+mquxBNMFJq6upxw5QWqAH6WtVga68Aa+g1OG1DOkxzi/97FuU2aqgpzEuGEUPiRW2Jy2jkv+t0acRG3pKYk3SH0J8iGsjKDvgq2thnybHDj0DhN/oFfbW3/bGK0nAZ+pHLDulTi07U95Alm9M3xntD+wEAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714744358; c=relaxed/simple;
	bh=TZwOqgk2cQLFLGUv8Go4xRFhaYENwObD+fK96vb/lRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YozJo+IHbVmg5y4TAa+TJd0vbpJRxe9yQ3ESoN88XKHQibqBCO+ynLsbtBhDxUisrRRQifnUIF5kQqAuGVCjRRzqWhpTMxCw/5GRQgQUWaOjas9xR7ow1bXYLq/+nd5rGCgAjWNy6COQE4hueHL4O4KbZX/HMM58G63s8nZ3UFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjZ/n79O; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjZ/n79O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714744357; x=1746280357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TZwOqgk2cQLFLGUv8Go4xRFhaYENwObD+fK96vb/lRk=;
  b=PjZ/n79OR96vslvq0XvOjOJoBVKDFwgZ9SfbKF8pxQ3SCE4F+TssPV/V
   we2JUs8QiWdM+SG8zbRVNOI+VAbfPsTk56y81m0fUw6PsMdG3KQmke6Pu
   T16qroCxOF3hS7uQ7ukguR6cQI+oEaQHaZ9yXo8wQ/0+2tikgkOUt3v7A
   SAMINECs41dWjxhpZcvfXboicXH5TJj5TaegMygH6y2RujuvbONu0YkTe
   ErvKkwiF3bdFVqjXxqy0lYPMTmEIomwcTsPPRv6yY3ASJs/xmBoMl7ObD
   ++eVqknIDDZ53E3jaaJ3DBRtJPqK0qiT9yR7ey/33k7wxONio3/NnV9gC
   w==;
X-CSE-ConnectionGUID: b8lFJx2PSaSjZDZmm9D7fQ==
X-CSE-MsgGUID: Hz2U06rKRw6bUN/vGzZbmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10768583"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10768583"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:52:36 -0700
X-CSE-ConnectionGUID: 1xc2Yr9MRciOiQLNFSMJHA==
X-CSE-MsgGUID: ijcu0e4CTde8qEZ7mNVi+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="32259518"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 May 2024 06:52:35 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2tKy-000Bk6-1g;
	Fri, 03 May 2024 13:52:32 +0000
Date: Fri, 3 May 2024 21:51:53 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 225/1143]
 drivers/char/ipmi/kcs_bmc_aspeed.c:73: warning: "STR1" redefined
Message-ID: <202405032148.i0ofEJQq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 0e8fbafef4b48c2306fc26a6b24f1fa0c2044948 [225/1143] ipmi-kcs: aspeed: Fix DTS property and HW feature inconsistency
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240503/202405032148.i0ofEJQq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405032148.i0ofEJQq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405032148.i0ofEJQq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/ipmi/kcs_bmc_aspeed.c:73: warning: "STR1" redefined
      73 | #define STR1                    0x03C
         | 
   In file included from arch/m68k/include/asm/irqflags.h:8,
                    from include/linux/irqflags.h:18,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from drivers/char/ipmi/kcs_bmc_aspeed.c:8:
   arch/m68k/include/asm/entry.h:245: note: this is the location of the previous definition
     245 | #define STR1(X) #X
         | 


vim +/STR1 +73 drivers/char/ipmi/kcs_bmc_aspeed.c

    29	
    30	
    31	/*
    32	 * Field class descriptions
    33	 *
    34	 * LPCyE	Enable LPC channel y
    35	 * IBFIEy	Input Buffer Full IRQ Enable for LPC channel y
    36	 * IRQxEy	Assert SerIRQ x for LPC channel y (Deprecated, use IDyIRQX, IRQXEy)
    37	 * IDyIRQX	Use the specified 4-bit SerIRQ for LPC channel y
    38	 * SELyIRQX	SerIRQ polarity for LPC channel y (low: 0, high: 1)
    39	 * IRQXEy	Assert the SerIRQ specified in IDyIRQX for LPC channel y
    40	 */
    41	#define HICR0			0x000
    42	#define   HICR0_LPC3E		BIT(7)
    43	#define   HICR0_LPC2E		BIT(6)
    44	#define   HICR0_LPC1E		BIT(5)
    45	#define HICR2			0x008
    46	#define   HICR2_IBFIE3		BIT(3)
    47	#define   HICR2_IBFIE2		BIT(2)
    48	#define   HICR2_IBFIE1		BIT(1)
    49	#define HICR4			0x010
    50	#define   HICR4_LADR12AS	BIT(7)
    51	#define   HICR4_KCSENBL		BIT(2)
    52	#define SIRQCR0			0x070
    53	/* IRQ{12,1}E1 are deprecated as of AST2600 A3 but necessary for prior chips */
    54	#define   SIRQCR0_IRQ12E1	BIT(1)
    55	#define   SIRQCR0_IRQ1E1	BIT(0)
    56	#define HICR5			0x080
    57	#define   HICR5_ID3IRQX		GENMASK(23, 20)
    58	#define   HICR5_ID2IRQX		GENMASK(19, 16)
    59	#define   HICR5_SEL3IRQX	BIT(15)
    60	#define   HICR5_IRQXE3		BIT(14)
    61	#define   HICR5_SEL2IRQX	BIT(13)
    62	#define   HICR5_IRQXE2		BIT(12)
    63	#define LADR3H			0x014
    64	#define LADR3L			0x018
    65	#define LADR12H			0x01C
    66	#define LADR12L			0x020
    67	#define IDR1			0x024
    68	#define IDR2			0x028
    69	#define IDR3			0x02C
    70	#define ODR1			0x030
    71	#define ODR2			0x034
    72	#define ODR3			0x038
  > 73	#define STR1			0x03C
    74	#define STR2			0x040
    75	#define STR3			0x044
    76	#define HICRB			0x100
    77	#define   HICRB_EN16LADR2	BIT(5)
    78	#define   HICRB_EN16LADR1	BIT(4)
    79	#define   HICRB_IBFIE4		BIT(1)
    80	#define   HICRB_LPC4E		BIT(0)
    81	#define HICRC			0x104
    82	#define   HICRC_ID4IRQX		GENMASK(7, 4)
    83	#define   HICRC_SEL4IRQX	BIT(2)
    84	#define   HICRC_OBF4_AUTO_CLR	BIT(1)
    85	#define   HICRC_IRQXE4		BIT(0)
    86	#define LADR4			0x110
    87	#define IDR4			0x114
    88	#define ODR4			0x118
    89	#define STR4			0x11C
    90	#define LSADR12			0x120
    91	#define   LSADR12_LSADR2	GENMASK(31, 16)
    92	#define   LSADR12_LSADR1	GENMASK(15, 0)
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
