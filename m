Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3124C12C7FD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 20:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732826243; cv=none; b=BwGve+PlpOuq1lnWRTY8qo654tLtQCSLcBeXQHVcWRFPldbE8N9zm+mnCh7VY+hDUyGSskBuWR8v+nX+LbIdMPs0zJADR4IhJCjsqv2S9egHMqOx/qlMSAcyKd1Zu51OT6zeV/6ZE/F/RHKRkS8Iq8DDglcDkNTOPORdYKuJL/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732826243; c=relaxed/simple;
	bh=x6rZwwnjkw1YsJhI1c2ktm/B265zYOiG35VfVyBYdzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tghTXSRe2z2OABG0r3EdHr5cUE65Aiu4cy5mFeE8Bc5wrLYm3vPRYNoUTWymvo/1SUGgHRFSfixV56q2Gq5yYXph5T4XCTDTTHuHhn1ediHTagwpwiwPw6a+2h9Tu/jFjIBiCPVCL5hlQaOzedEKvybkE+BRHovxkPyTfxZrlUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SdAbvYK3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SdAbvYK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732826241; x=1764362241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x6rZwwnjkw1YsJhI1c2ktm/B265zYOiG35VfVyBYdzs=;
  b=SdAbvYK3cU0bc/PixLHv40ZfvNttrO3sqoXlZSj37/kXcQsdS9LTPxuD
   BkW9/Qk5RbChXzhU5WFOFIKInxYHRfAXxT58/S8I1IWPpiCnDE/zfmNLl
   zDSC60WoLUXGVat1QONFr5/WJUno6xNH4A0JhLEaQK3Sa0H2KfV1rl0X1
   lh4TheFixgfH0xNyTi/M0IUAvjygo1ptdMClhA0g6+drSC2YnQ+3D7oGi
   CUVWH1WlnMdjiWMj+q2FUKYc47CiGn+RMa9g0TnRVyUSMGZyDaptB5qLK
   AgaTbjTAb3m2Xi2fcYePOIug06+DH5xPjBA2agIy2u752C9etDq5PD+NW
   Q==;
X-CSE-ConnectionGUID: Hc7Z2kM6SYeReConAcmfSQ==
X-CSE-MsgGUID: BgAKV2IuSMWfTcjGVtQkxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33197098"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="33197098"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 12:37:20 -0800
X-CSE-ConnectionGUID: /hKcsSN6SKKkcyusuGsBHA==
X-CSE-MsgGUID: FusaVfUTQmabpgjoBNk4BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="97078551"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Nov 2024 12:37:19 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGlGH-0009zV-1e;
	Thu, 28 Nov 2024 20:37:17 +0000
Date: Fri, 29 Nov 2024 04:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:syscon-rework 13/13] drivers/clk/clk-stm32f4.c:705:9: error:
 use of undeclared identifier 'clk_divider_ops'
Message-ID: <202411290409.9ckmNm63-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git syscon-rework
head:   c45c71c3d6c75b3e380b97353b7b579926f570cb
commit: c45c71c3d6c75b3e380b97353b7b579926f570cb [13/13] split regmap divider into a new compilation unit
config: arm-randconfig-003-20241129 (https://download.01.org/0day-ci/archive/20241129/202411290409.9ckmNm63-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290409.9ckmNm63-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290409.9ckmNm63-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/clk-stm32f4.c:705:9: error: use of undeclared identifier 'clk_divider_ops'
     705 |         return clk_divider_ops.recalc_rate(hw, parent_rate);
         |                ^
   drivers/clk/clk-stm32f4.c:711:9: error: use of undeclared identifier 'clk_divider_ops'
     711 |         return clk_divider_ops.determine_rate(hw, req);
         |                ^
   drivers/clk/clk-stm32f4.c:727:8: error: use of undeclared identifier 'clk_divider_ops'
     727 |         ret = clk_divider_ops.set_rate(hw, rate, parent_rate);
         |               ^
   3 errors generated.
--
>> drivers/clk/clk-fsl-sai.c:62:10: error: use of undeclared identifier 'clk_divider_ops'
      62 |                                                   &clk_divider_ops,
         |                                                    ^
   1 error generated.
--
   In file included from drivers/mmc/host/meson-gx-mmc.c:17:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/mmc/host/meson-gx-mmc.c:482:14: error: use of undeclared identifier 'clk_divider_ops'
     482 |         init.ops = &clk_divider_ops;
         |                     ^
   1 warning and 1 error generated.
--
>> drivers/clk/imx/clk-composite-8m.c:269:18: error: use of undeclared identifier 'clk_divider_ops'; did you mean 'divider_ops'?
     269 |                 divider_ops = &clk_divider_ops;
         |                                ^~~~~~~~~~~~~~~
         |                                divider_ops
   drivers/clk/imx/clk-composite-8m.c:246:24: note: 'divider_ops' declared here
     246 |         const struct clk_ops *divider_ops;
         |                               ^
   1 error generated.
--
>> drivers/clk/imx/clk-divider-gate.c:70:9: error: use of undeclared identifier 'clk_divider_ops'
      70 |         return clk_divider_ops.determine_rate(hw, req);
         |                ^
   1 error generated.
--
>> drivers/clk/imx/clk-fixup-div.c:115:20: error: use of undeclared identifier 'clk_divider_ops'
     115 |         fixup_div->ops = &clk_divider_ops;
         |                           ^
   1 error generated.
--
>> drivers/clk/imx/clk-busy.c:96:19: error: use of undeclared identifier 'clk_divider_ops'; did you mean 'clk_busy_divider_ops'?
      96 |         busy->div_ops = &clk_divider_ops;
         |                          ^~~~~~~~~~~~~~~
         |                          clk_busy_divider_ops
   drivers/clk/imx/clk-busy.c:70:29: note: 'clk_busy_divider_ops' declared here
      70 | static const struct clk_ops clk_busy_divider_ops = {
         |                             ^
   1 error generated.
--
>> drivers/clk/imx/clk-composite-93.c:98:9: error: use of undeclared identifier 'clk_divider_ops'
      98 |         return clk_divider_ops.recalc_rate(hw, parent_rate);
         |                ^
   drivers/clk/imx/clk-composite-93.c:104:9: error: use of undeclared identifier 'clk_divider_ops'
     104 |         return clk_divider_ops.round_rate(hw, rate, prate);
         |                ^
   drivers/clk/imx/clk-composite-93.c:110:9: error: use of undeclared identifier 'clk_divider_ops'
     110 |         return clk_divider_ops.determine_rate(hw, req);
         |                ^
>> drivers/clk/imx/clk-composite-93.c:231:14: error: use of undeclared identifier 'clk_divider_ro_ops'
     231 |                                                &clk_divider_ro_ops, NULL, NULL, flags);
         |                                                 ^
   4 errors generated.
--
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:833:15: error: use of undeclared identifier 'clk_divider_ro_ops'; did you mean 'clk_divider_flags'?
     833 |                 init.ops = &clk_divider_ro_ops;
         |                             ^~~~~~~~~~~~~~~~~~
         |                             clk_divider_flags
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:818:11: note: 'clk_divider_flags' declared here
     818 |                                                  u8 clk_divider_flags,
         |                                                     ^
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:879:15: error: use of undeclared identifier 'clk_divider_ro_ops'; did you mean 'clk_divider_flags'?
     879 |                 init.ops = &clk_divider_ro_ops;
         |                             ^~~~~~~~~~~~~~~~~~
         |                             clk_divider_flags
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:864:14: note: 'clk_divider_flags' declared here
     864 |                                              u8 clk_divider_flags,
         |                                                 ^
   2 errors generated.
--
>> drivers/clk/mediatek/clk-mtk.c:282:14: error: use of undeclared identifier 'clk_divider_ops'
     282 |                 div_ops = &clk_divider_ops;
         |                            ^
   1 error generated.
--
>> drivers/clk/stm32/clk-stm32mp1.c:657:15: error: use of undeclared identifier 'clk_divider_ops'
     657 |                         div_ops = &clk_divider_ops;
         |                                    ^
   drivers/clk/stm32/clk-stm32mp1.c:1077:10: error: use of undeclared identifier 'clk_divider_ops'
    1077 |                 return clk_divider_ops.recalc_rate(hw, parent_rate);
         |                        ^
   drivers/clk/stm32/clk-stm32mp1.c:1086:10: error: use of undeclared identifier 'clk_divider_ops'
    1086 |                 return clk_divider_ops.set_rate(hw, rate, parent_rate);
         |                        ^
   drivers/clk/stm32/clk-stm32mp1.c:1094:10: error: use of undeclared identifier 'clk_divider_ops'
    1094 |                 return clk_divider_ops.determine_rate(hw, req);
         |                        ^
   4 errors generated.
..


vim +/clk_divider_ops +705 drivers/clk/clk-stm32f4.c

83135ad3c517f2 Gabriel Fernandez 2016-12-13  701  
83135ad3c517f2 Gabriel Fernandez 2016-12-13  702  static unsigned long stm32f4_pll_div_recalc_rate(struct clk_hw *hw,
83135ad3c517f2 Gabriel Fernandez 2016-12-13  703  		unsigned long parent_rate)
83135ad3c517f2 Gabriel Fernandez 2016-12-13  704  {
83135ad3c517f2 Gabriel Fernandez 2016-12-13 @705  	return clk_divider_ops.recalc_rate(hw, parent_rate);
83135ad3c517f2 Gabriel Fernandez 2016-12-13  706  }
83135ad3c517f2 Gabriel Fernandez 2016-12-13  707  

:::::: The code at line 705 was first introduced by commit
:::::: 83135ad3c517f2b4b59321886efe19e6c6cff54a clk: stm32f4: Add PLL_I2S & PLL_SAI for STM32F429/469 boards

:::::: TO: Gabriel Fernandez <gabriel.fernandez@st.com>
:::::: CC: Stephen Boyd <sboyd@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
