Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB1219BCC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 17:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695318651; x=1726854651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v2yZYTtf8hib/hNap9Hy/CHZcpkM0R7T2raydFIaYWE=;
  b=fApRclJ+6ObLBrH+ljSqYcP6GfQBJjoDKG3mVdIBSiT/3pSntUVrJ3wh
   NdfaYaqSayh6itPav9anD92xMuTDE7xAyETf4L++1wTlEFyX7o2iwI7vU
   VgmMLo+pk24jM6wN2iJaPNBQtCs1T1AKLLXyS3k3hnPXmAt5YDyTAPbAI
   vbL4zao8BYx5RkTK11yfygA2zkk0LgqZvZUMZ9OG0nnKRUss+VKOMEIEN
   bx4qBxsh1fQk7sQYAuQ6Gi7Rw5jqyGQmi4CrzLngGcTgLmwqBJALdf548
   8daSXiDOjx7OHgldhwUNtF1ykg/NTFzwodrZ64NHhWGoQ6PyyYGnP3zyO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="444717438"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="444717438"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 10:50:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="920832793"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="920832793"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Sep 2023 10:50:48 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjNp8-0000DS-0I;
	Thu, 21 Sep 2023 17:50:46 +0000
Date: Fri, 22 Sep 2023 01:50:19 +0800
From: kernel test robot <lkp@intel.com>
To: Charlene Liu <charlene.liu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Duncan Ma <duncan.ma@amd.com>
Subject: [linux-next:master 1482/6975]
 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c:491
 dcn32_auto_dpm_test_log() warn: inconsistent indenting
Message-ID: <202309220139.8UKM1OB8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   940fcc189c51032dd0282cbee4497542c982ac59
commit: a6db1993c18bc2138a85227bb28b69c82cbe722b [1482/6975] drm/amd/display: fix some non-initialized register mask and setting
config: i386-randconfig-141-20230921 (https://download.01.org/0day-ci/archive/20230922/202309220139.8UKM1OB8-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230922/202309220139.8UKM1OB8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309220139.8UKM1OB8-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c:491 dcn32_auto_dpm_test_log() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c:491 dcn32_auto_dpm_test_log() warn: variable dereferenced before check 'new_clocks' (see line 471)

vim +491 drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c

d170e938f01fc8 Alvin Lee    2023-03-24  460  
77ad5f6febdc17 Ethan Bitnun 2023-08-24  461  static void dcn32_auto_dpm_test_log(struct dc_clocks *new_clocks, struct clk_mgr_internal *clk_mgr)
77ad5f6febdc17 Ethan Bitnun 2023-08-24  462  {
a6db1993c18bc2 Charlene Liu 2023-08-25  463      unsigned int dispclk_khz_reg    = REG_READ(CLK1_CLK0_CURRENT_CNT); // DISPCLK
a6db1993c18bc2 Charlene Liu 2023-08-25  464      unsigned int dppclk_khz_reg     = REG_READ(CLK1_CLK1_CURRENT_CNT); // DPPCLK
a6db1993c18bc2 Charlene Liu 2023-08-25  465      unsigned int dprefclk_khz_reg   = REG_READ(CLK1_CLK2_CURRENT_CNT); // DPREFCLK
a6db1993c18bc2 Charlene Liu 2023-08-25  466      unsigned int dcfclk_khz_reg     = REG_READ(CLK1_CLK3_CURRENT_CNT); // DCFCLK
a6db1993c18bc2 Charlene Liu 2023-08-25  467      unsigned int dtbclk_khz_reg     = REG_READ(CLK1_CLK4_CURRENT_CNT); // DTBCLK
a6db1993c18bc2 Charlene Liu 2023-08-25  468      unsigned int fclk_khz_reg       = REG_READ(CLK4_CLK0_CURRENT_CNT); // FCLK
a6db1993c18bc2 Charlene Liu 2023-08-25  469  
a6db1993c18bc2 Charlene Liu 2023-08-25  470      // Overrides for these clocks in case there is no p_state change support
a6db1993c18bc2 Charlene Liu 2023-08-25 @471      int dramclk_khz_override = new_clocks->dramclk_khz;
a6db1993c18bc2 Charlene Liu 2023-08-25  472      int fclk_khz_override = new_clocks->fclk_khz;
a6db1993c18bc2 Charlene Liu 2023-08-25  473  
a6db1993c18bc2 Charlene Liu 2023-08-25  474      int num_fclk_levels = clk_mgr->base.bw_params->clk_table.num_entries_per_clk.num_fclk_levels - 1;
a6db1993c18bc2 Charlene Liu 2023-08-25  475  
a6db1993c18bc2 Charlene Liu 2023-08-25  476      if (!new_clocks->p_state_change_support) {
a6db1993c18bc2 Charlene Liu 2023-08-25  477  	    dramclk_khz_override = clk_mgr->base.bw_params->max_memclk_mhz * 1000;
a6db1993c18bc2 Charlene Liu 2023-08-25  478      }
a6db1993c18bc2 Charlene Liu 2023-08-25  479      if (!new_clocks->fclk_p_state_change_support) {
a6db1993c18bc2 Charlene Liu 2023-08-25  480  	    fclk_khz_override = clk_mgr->base.bw_params->clk_table.entries[num_fclk_levels].fclk_mhz * 1000;
a6db1993c18bc2 Charlene Liu 2023-08-25  481      }
a6db1993c18bc2 Charlene Liu 2023-08-25  482  
77ad5f6febdc17 Ethan Bitnun 2023-08-24  483  	////////////////////////////////////////////////////////////////////////////
77ad5f6febdc17 Ethan Bitnun 2023-08-24  484  	//	IMPORTANT: 	When adding more clocks to these logs, do NOT put a newline
77ad5f6febdc17 Ethan Bitnun 2023-08-24  485  	//	 			anywhere other than at the very end of the string.
77ad5f6febdc17 Ethan Bitnun 2023-08-24  486  	//
77ad5f6febdc17 Ethan Bitnun 2023-08-24  487  	//	Formatting example (make sure to have " - " between each entry):
77ad5f6febdc17 Ethan Bitnun 2023-08-24  488  	//
77ad5f6febdc17 Ethan Bitnun 2023-08-24  489  	//				AutoDPMTest: clk1:%d - clk2:%d - clk3:%d - clk4:%d\n"
77ad5f6febdc17 Ethan Bitnun 2023-08-24  490  	////////////////////////////////////////////////////////////////////////////
77ad5f6febdc17 Ethan Bitnun 2023-08-24 @491  	if (new_clocks &&
77ad5f6febdc17 Ethan Bitnun 2023-08-24  492  		new_clocks->dramclk_khz > 0 &&
77ad5f6febdc17 Ethan Bitnun 2023-08-24  493  		new_clocks->fclk_khz > 0 &&
77ad5f6febdc17 Ethan Bitnun 2023-08-24  494  		new_clocks->dcfclk_khz > 0 &&
77ad5f6febdc17 Ethan Bitnun 2023-08-24  495  		new_clocks->dppclk_khz > 0) {
77ad5f6febdc17 Ethan Bitnun 2023-08-24  496  
a6db1993c18bc2 Charlene Liu 2023-08-25  497  		DC_LOG_AUTO_DPM_TEST("AutoDPMTest: dramclk:%d - fclk:%d - "
a6db1993c18bc2 Charlene Liu 2023-08-25  498  			"dcfclk:%d - dppclk:%d - dispclk_hw:%d - "
a6db1993c18bc2 Charlene Liu 2023-08-25  499  			"dppclk_hw:%d - dprefclk_hw:%d - dcfclk_hw:%d - "
a6db1993c18bc2 Charlene Liu 2023-08-25  500  			"dtbclk_hw:%d - fclk_hw:%d\n",
a6db1993c18bc2 Charlene Liu 2023-08-25  501  			dramclk_khz_override,
a6db1993c18bc2 Charlene Liu 2023-08-25  502  			fclk_khz_override,
77ad5f6febdc17 Ethan Bitnun 2023-08-24  503  			new_clocks->dcfclk_khz,
a6db1993c18bc2 Charlene Liu 2023-08-25  504  			new_clocks->dppclk_khz,
a6db1993c18bc2 Charlene Liu 2023-08-25  505  			dispclk_khz_reg,
a6db1993c18bc2 Charlene Liu 2023-08-25  506  			dppclk_khz_reg,
a6db1993c18bc2 Charlene Liu 2023-08-25  507  			dprefclk_khz_reg,
a6db1993c18bc2 Charlene Liu 2023-08-25  508  			dcfclk_khz_reg,
a6db1993c18bc2 Charlene Liu 2023-08-25  509  			dtbclk_khz_reg,
a6db1993c18bc2 Charlene Liu 2023-08-25  510  			fclk_khz_reg);
77ad5f6febdc17 Ethan Bitnun 2023-08-24  511  	}
77ad5f6febdc17 Ethan Bitnun 2023-08-24  512  }
d170e938f01fc8 Alvin Lee    2023-03-24  513  

:::::: The code at line 491 was first introduced by commit
:::::: 77ad5f6febdc17f4d06bf0b163b8612823e58d74 drm/amd/display: Add new logs for AutoDPMTest

:::::: TO: Ethan Bitnun <etbitnun@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
