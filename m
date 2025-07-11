Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C5C27A114
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 12:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752236190; cv=none; b=MMruGLQqGAPx8XGZDzY0NOLDrrVrQN3kUunt+ye952RhC3KUA/FJOflcHFt+opipKESUPQN5H84i89hrepukR6N4w8oEYyBgqmAR6uF7FKI3bad80PmacQkPkGgLlACX5jlBie7H1JM3rI7mcMolDKDlf8CBjaUQCxt5zIb3ANs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752236190; c=relaxed/simple;
	bh=Yntst3xppqb0Ve2Fo/2FCjDkUdVF7iUsqSJxFmFyE/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nhCEAyxaA8fGndLOdKOjEApyOtWIZJruGV69KZpZEnNrCu6jCUU4U2jYvunhNANkPcZ0jq5oVR+wlkgKJZwcT/KDLuYBJUGMGNRtg5ivWd/PUkW8f9dL1KZLmcUj90Ld1rXNM/NXT4EMNIRsVCDQOrjn2cOGKH/gVoY0TwxfkeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHrgpXCw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHrgpXCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752236188; x=1783772188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yntst3xppqb0Ve2Fo/2FCjDkUdVF7iUsqSJxFmFyE/A=;
  b=GHrgpXCwm28Xc3EXDLkqk4hbgwlhrba/za9EHxcEk4qtqoizDHhZWHHz
   gbWSwldoh/gAhSne+BYGVCcROG5DSOcFqDGI+ygoD6zltMwLRlI51zBFj
   uFAvkTuo87cwVI9+gVM7P+iSl7qK5QyG00Hms8cLx+/86oJ1cLFYqZ7VD
   Lml30JbznCYIexn6tA7S/AXQN/6/p7+JJyze8ksVhAwYqYiVJ4ICECUJP
   BiWy2yUfRJJPge/u3uijpFcaRGJok+8GgTIqcD4vp8WD4IAgTSZgI2R4F
   +dJbnw2WFUc1B+s8OpmQdDiIY+hQ7HLh7eMhDaw+L9SJ1GFSxZ1H4tjB1
   A==;
X-CSE-ConnectionGUID: +N0HvuW5SVaX64isZRUnZg==
X-CSE-MsgGUID: zWzbOgLCT3OxeZaul9ax/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54666085"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="54666085"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 05:16:28 -0700
X-CSE-ConnectionGUID: N9gU1Ur3RZqvnqqdqerO+w==
X-CSE-MsgGUID: RIn/44vUSxiTpbXEafL9+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="162042814"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jul 2025 05:16:26 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaCfw-0006Kp-01;
	Fri, 11 Jul 2025 12:16:24 +0000
Date: Fri, 11 Jul 2025 20:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:63:8: error: use of
 undeclared identifier 'THC_M_PRT_ERR_CAUSE_INVLD_DEV_ENTRY'
Message-ID: <202507112024.iekiEnMg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   63e6a5406fdf9b8dd041d150db5aa6016d2b943c
commit: 10211a309ba13ebf035f7b01aa9849858312d454 [1/1] UPSTREAM: HID: intel-thc-hid: Add basic THC driver skeleton
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250711/202507112024.iekiEnMg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507112024.iekiEnMg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507112024.iekiEnMg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:63:8: error: use of undeclared identifier 'THC_M_PRT_ERR_CAUSE_INVLD_DEV_ENTRY'
      63 |         val = THC_M_PRT_ERR_CAUSE_INVLD_DEV_ENTRY |
         |               ^
>> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:64:8: error: use of undeclared identifier 'THC_M_PRT_ERR_CAUSE_FRAME_BABBLE_ERR'
      64 |               THC_M_PRT_ERR_CAUSE_FRAME_BABBLE_ERR |
         |               ^
>> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:65:8: error: use of undeclared identifier 'THC_M_PRT_ERR_CAUSE_BUF_OVRRUN_ERR'
      65 |               THC_M_PRT_ERR_CAUSE_BUF_OVRRUN_ERR |
         |               ^
>> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:66:8: error: use of undeclared identifier 'THC_M_PRT_ERR_CAUSE_PRD_ENTRY_ERR'
      66 |               THC_M_PRT_ERR_CAUSE_PRD_ENTRY_ERR;
         |               ^
>> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:67:37: error: use of undeclared identifier 'THC_M_PRT_ERR_CAUSE_OFFSET'
      67 |         regmap_write_bits(dev->thc_regmap, THC_M_PRT_ERR_CAUSE_OFFSET, val, val);
         |                                            ^
>> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:70:37: error: use of undeclared identifier 'THC_M_PRT_READ_DMA_CNTRL_1_OFFSET'
      70 |         regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_1_OFFSET,
         |                                            ^
>> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:71:6: error: use of undeclared identifier 'THC_M_PRT_READ_DMA_CNTRL_IE_STALL'
      71 |                           THC_M_PRT_READ_DMA_CNTRL_IE_STALL,
         |                           ^
   drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:72:6: error: use of undeclared identifier 'THC_M_PRT_READ_DMA_CNTRL_IE_STALL'
      72 |                           THC_M_PRT_READ_DMA_CNTRL_IE_STALL);
         |                           ^
>> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:73:37: error: use of undeclared identifier 'THC_M_PRT_READ_DMA_CNTRL_2_OFFSET'
      73 |         regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_2_OFFSET,
         |                                            ^
   drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:74:6: error: use of undeclared identifier 'THC_M_PRT_READ_DMA_CNTRL_IE_STALL'
      74 |                           THC_M_PRT_READ_DMA_CNTRL_IE_STALL,
         |                           ^
   drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:75:6: error: use of undeclared identifier 'THC_M_PRT_READ_DMA_CNTRL_IE_STALL'
      75 |                           THC_M_PRT_READ_DMA_CNTRL_IE_STALL);
         |                           ^
>> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:77:37: error: use of undeclared identifier 'THC_M_PRT_INT_STATUS_OFFSET'
      77 |         regmap_write_bits(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
         |                                            ^
>> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:78:6: error: use of undeclared identifier 'THC_M_PRT_INT_STATUS_TXN_ERR_INT_STS'
      78 |                           THC_M_PRT_INT_STATUS_TXN_ERR_INT_STS,
         |                           ^
   drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:79:6: error: use of undeclared identifier 'THC_M_PRT_INT_STATUS_TXN_ERR_INT_STS'
      79 |                           THC_M_PRT_INT_STATUS_TXN_ERR_INT_STS);
         |                           ^
   drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:80:37: error: use of undeclared identifier 'THC_M_PRT_INT_STATUS_OFFSET'
      80 |         regmap_write_bits(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
         |                                            ^
>> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:81:6: error: use of undeclared identifier 'THC_M_PRT_INT_STATUS_FATAL_ERR_INT_STS'
      81 |                           THC_M_PRT_INT_STATUS_FATAL_ERR_INT_STS,
         |                           ^
   drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:82:6: error: use of undeclared identifier 'THC_M_PRT_INT_STATUS_FATAL_ERR_INT_STS'
      82 |                           THC_M_PRT_INT_STATUS_FATAL_ERR_INT_STS);
         |                           ^
>> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:84:8: error: use of undeclared identifier 'THC_M_PRT_INT_EN_TXN_ERR_INT_EN'
      84 |         val = THC_M_PRT_INT_EN_TXN_ERR_INT_EN |
         |               ^
>> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c:85:8: error: use of undeclared identifier 'THC_M_PRT_INT_EN_FATAL_ERR_INT_EN'
      85 |               THC_M_PRT_INT_EN_FATAL_ERR_INT_EN |
         |               ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/THC_M_PRT_ERR_CAUSE_INVLD_DEV_ENTRY +63 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c

    52	
    53	/**
    54	 * thc_clear_state - Clear THC hardware state
    55	 *
    56	 * @dev: The pointer of THC device structure
    57	 */
    58	static void thc_clear_state(const struct thc_device *dev)
    59	{
    60		u32 val;
    61	
    62		/* Clear interrupt cause register */
  > 63		val = THC_M_PRT_ERR_CAUSE_INVLD_DEV_ENTRY |
  > 64		      THC_M_PRT_ERR_CAUSE_FRAME_BABBLE_ERR |
  > 65		      THC_M_PRT_ERR_CAUSE_BUF_OVRRUN_ERR |
  > 66		      THC_M_PRT_ERR_CAUSE_PRD_ENTRY_ERR;
  > 67		regmap_write_bits(dev->thc_regmap, THC_M_PRT_ERR_CAUSE_OFFSET, val, val);
    68	
    69		/* Clear interrupt error state */
  > 70		regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_1_OFFSET,
  > 71				  THC_M_PRT_READ_DMA_CNTRL_IE_STALL,
    72				  THC_M_PRT_READ_DMA_CNTRL_IE_STALL);
  > 73		regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_2_OFFSET,
  > 74				  THC_M_PRT_READ_DMA_CNTRL_IE_STALL,
    75				  THC_M_PRT_READ_DMA_CNTRL_IE_STALL);
    76	
  > 77		regmap_write_bits(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
  > 78				  THC_M_PRT_INT_STATUS_TXN_ERR_INT_STS,
    79				  THC_M_PRT_INT_STATUS_TXN_ERR_INT_STS);
  > 80		regmap_write_bits(dev->thc_regmap, THC_M_PRT_INT_STATUS_OFFSET,
  > 81				  THC_M_PRT_INT_STATUS_FATAL_ERR_INT_STS,
    82				  THC_M_PRT_INT_STATUS_FATAL_ERR_INT_STS);
    83	
  > 84		val = THC_M_PRT_INT_EN_TXN_ERR_INT_EN |
  > 85		      THC_M_PRT_INT_EN_FATAL_ERR_INT_EN |
    86		      THC_M_PRT_INT_EN_BUF_OVRRUN_ERR_INT_EN;
    87		regmap_write_bits(dev->thc_regmap, THC_M_PRT_INT_EN_OFFSET, val, val);
    88	
    89		val = THC_M_PRT_SW_SEQ_STS_THC_SS_ERR |
    90		      THC_M_PRT_SW_SEQ_STS_TSSDONE;
    91		regmap_write_bits(dev->thc_regmap, THC_M_PRT_SW_SEQ_STS_OFFSET, val, val);
    92	
    93		/* Clear RxDMA state */
    94		regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_1_OFFSET,
    95				  THC_M_PRT_READ_DMA_CNTRL_IE_EOF, 0);
    96		regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_2_OFFSET,
    97				  THC_M_PRT_READ_DMA_CNTRL_IE_EOF, 0);
    98	
    99		regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_INT_STS_1_OFFSET,
   100				  THC_M_PRT_READ_DMA_INT_STS_EOF_INT_STS,
   101				  THC_M_PRT_READ_DMA_INT_STS_EOF_INT_STS);
   102		regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_INT_STS_2_OFFSET,
   103				  THC_M_PRT_READ_DMA_INT_STS_EOF_INT_STS,
   104				  THC_M_PRT_READ_DMA_INT_STS_EOF_INT_STS);
   105		regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_INT_STS_1_OFFSET,
   106				  THC_M_PRT_READ_DMA_INT_STS_NONDMA_INT_STS,
   107				  THC_M_PRT_READ_DMA_INT_STS_NONDMA_INT_STS);
   108	
   109		/* Clear TxDMA state */
   110		regmap_write_bits(dev->thc_regmap, THC_M_PRT_WRITE_DMA_CNTRL_OFFSET,
   111				  THC_M_PRT_WRITE_DMA_CNTRL_THC_WRDMA_IE_IOC_DMACPL,
   112				  THC_M_PRT_WRITE_DMA_CNTRL_THC_WRDMA_IE_IOC_DMACPL);
   113	
   114		val = THC_M_PRT_WRITE_INT_STS_THC_WRDMA_ERROR_STS |
   115		      THC_M_PRT_WRITE_INT_STS_THC_WRDMA_IOC_STS |
   116		      THC_M_PRT_WRITE_INT_STS_THC_WRDMA_CMPL_STATUS;
   117		regmap_write_bits(dev->thc_regmap, THC_M_PRT_WRITE_INT_STS_OFFSET, val, val);
   118	
   119		/* Reset all DMAs count */
   120		regmap_write_bits(dev->thc_regmap, THC_M_PRT_DB_CNT_1_OFFSET,
   121				  THC_M_PRT_DB_CNT_1_THC_M_PRT_DB_CNT_RST,
   122				  THC_M_PRT_DB_CNT_1_THC_M_PRT_DB_CNT_RST);
   123	
   124		regmap_write_bits(dev->thc_regmap, THC_M_PRT_DEVINT_CNT_OFFSET,
   125				  THC_M_PRT_DEVINT_CNT_THC_M_PRT_DEVINT_CNT_RST,
   126				  THC_M_PRT_DEVINT_CNT_THC_M_PRT_DEVINT_CNT_RST);
   127		regmap_write_bits(dev->thc_regmap, THC_M_PRT_READ_DMA_CNTRL_1_OFFSET,
   128				  THC_M_PRT_READ_DMA_CNTRL_TPCPR,
   129				  THC_M_PRT_READ_DMA_CNTRL_TPCPR);
   130	
   131		/* Reset THC hardware sequence state */
   132		regmap_write_bits(dev->thc_regmap, THC_M_PRT_FRAME_DROP_CNT_1_OFFSET,
   133				  THC_M_PRT_FRAME_DROP_CNT_1_RFDC,
   134				  THC_M_PRT_FRAME_DROP_CNT_1_RFDC);
   135		regmap_write_bits(dev->thc_regmap, THC_M_PRT_FRAME_DROP_CNT_2_OFFSET,
   136				  THC_M_PRT_FRAME_DROP_CNT_2_RFDC,
   137				  THC_M_PRT_FRAME_DROP_CNT_2_RFDC);
   138	
   139		regmap_write_bits(dev->thc_regmap, THC_M_PRT_FRM_CNT_1_OFFSET,
   140				  THC_M_PRT_FRM_CNT_1_THC_M_PRT_FRM_CNT_RST,
   141				  THC_M_PRT_FRM_CNT_1_THC_M_PRT_FRM_CNT_RST);
   142		regmap_write_bits(dev->thc_regmap, THC_M_PRT_FRM_CNT_2_OFFSET,
   143				  THC_M_PRT_FRM_CNT_2_THC_M_PRT_FRM_CNT_RST,
   144				  THC_M_PRT_FRM_CNT_2_THC_M_PRT_FRM_CNT_RST);
   145	
   146		regmap_write_bits(dev->thc_regmap, THC_M_PRT_RXDMA_PKT_CNT_1_OFFSET,
   147				  THC_M_PRT_RXDMA_PKT_CNT_1_THC_M_PRT_RXDMA_PKT_CNT_RST,
   148				  THC_M_PRT_RXDMA_PKT_CNT_1_THC_M_PRT_RXDMA_PKT_CNT_RST);
   149		regmap_write_bits(dev->thc_regmap, THC_M_PRT_RXDMA_PKT_CNT_2_OFFSET,
   150				  THC_M_PRT_RXDMA_PKT_CNT_2_THC_M_PRT_RXDMA_PKT_CNT_RST,
   151				  THC_M_PRT_RXDMA_PKT_CNT_2_THC_M_PRT_RXDMA_PKT_CNT_RST);
   152	
   153		regmap_write_bits(dev->thc_regmap, THC_M_PRT_SWINT_CNT_1_OFFSET,
   154				  THC_M_PRT_SWINT_CNT_1_THC_M_PRT_SWINT_CNT_RST,
   155				  THC_M_PRT_SWINT_CNT_1_THC_M_PRT_SWINT_CNT_RST);
   156		regmap_write_bits(dev->thc_regmap, THC_M_PRT_SWINT_CNT_1_OFFSET,
   157				  THC_M_PRT_SWINT_CNT_1_THC_M_PRT_SWINT_CNT_RST,
   158				  THC_M_PRT_SWINT_CNT_1_THC_M_PRT_SWINT_CNT_RST);
   159	
   160		regmap_write_bits(dev->thc_regmap, THC_M_PRT_TX_FRM_CNT_OFFSET,
   161				  THC_M_PRT_TX_FRM_CNT_THC_M_PRT_TX_FRM_CNT_RST,
   162				  THC_M_PRT_TX_FRM_CNT_THC_M_PRT_TX_FRM_CNT_RST);
   163	
   164		regmap_write_bits(dev->thc_regmap, THC_M_PRT_TXDMA_PKT_CNT_OFFSET,
   165				  THC_M_PRT_TXDMA_PKT_CNT_THC_M_PRT_TXDMA_PKT_CNT_RST,
   166				  THC_M_PRT_TXDMA_PKT_CNT_THC_M_PRT_TXDMA_PKT_CNT_RST);
   167	
   168		regmap_write_bits(dev->thc_regmap, THC_M_PRT_UFRM_CNT_1_OFFSET,
   169				  THC_M_PRT_UFRM_CNT_1_THC_M_PRT_UFRM_CNT_RST,
   170				  THC_M_PRT_UFRM_CNT_1_THC_M_PRT_UFRM_CNT_RST);
   171		regmap_write_bits(dev->thc_regmap, THC_M_PRT_UFRM_CNT_2_OFFSET,
   172				  THC_M_PRT_UFRM_CNT_2_THC_M_PRT_UFRM_CNT_RST,
   173				  THC_M_PRT_UFRM_CNT_2_THC_M_PRT_UFRM_CNT_RST);
   174	
   175		regmap_write_bits(dev->thc_regmap, THC_M_PRT_PRD_EMPTY_CNT_1_OFFSET,
   176				  THC_M_PRT_PRD_EMPTY_CNT_1_RPTEC,
   177				  THC_M_PRT_PRD_EMPTY_CNT_1_RPTEC);
   178		regmap_write_bits(dev->thc_regmap, THC_M_PRT_PRD_EMPTY_CNT_2_OFFSET,
   179				  THC_M_PRT_PRD_EMPTY_CNT_2_RPTEC,
   180				  THC_M_PRT_PRD_EMPTY_CNT_2_RPTEC);
   181	}
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
