Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F9411CB4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 14:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689777915; x=1721313915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gA9e6/P1G6QR7OGDDcIRSolqTmcTDnWuR+omsB12Xus=;
  b=bJBlYnjD2sziTkDe8GBpx7CzYIQcCA7kZGALMsovfHy5H51a2EZgiON2
   OvOc35CccF5MzpMv54Q3Z/OfEVhnBN0paxvljA0TrYaAG64TKJJifdlcW
   ZOVoSLgmDlOkUNKctIbxpJU1yeqbn7XJQCvaL6dwiiwjC9cYklax+uX+N
   TfF8AMd03A9upNIwHafox7ex1XW3CXfVU6/cRMPoHScysweNzYo1kfIN3
   HvYqr01cocAKitwLYX3BKS+E8cg7NpcA7RnK83XJoMxVVuOX99opNkchm
   jhmBUOzLDUvZxbS3oGb3eHVFNByN7rd8bieYT2JA/WzhvxGbAmtFyUAD+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="397346712"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="397346712"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 07:45:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="794047423"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="794047423"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2023 07:45:12 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM8QO-00051p-0w;
	Wed, 19 Jul 2023 14:45:10 +0000
Date: Wed, 19 Jul 2023 22:44:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 27/28]
 sound/soc/amd/acp/acp-phoenix.c:277:6: warning: no previous prototype for
 'acp63_master_clock_generate'
Message-ID: <202307192248.eS3oPL41-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   b98aa1b68171dec7de67a310b14063e9919a9295
commit: f81943476e13ef73cf78759efbacd674cbfcf5e0 [27/28] CHROMIUM: ASoC: amd: acp: Legacy Phoenix driver support.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230719/202307192248.eS3oPL41-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307192248.eS3oPL41-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307192248.eS3oPL41-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/amd/acp/acp-phoenix.c:277:6: warning: no previous prototype for 'acp63_master_clock_generate' [-Wmissing-prototypes]
     277 | void acp63_master_clock_generate(struct acp_dev_data *adata)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/acp63_master_clock_generate +277 sound/soc/amd/acp/acp-phoenix.c

   276	
 > 277	void acp63_master_clock_generate(struct acp_dev_data *adata)
   278	{
   279	        u32 data;
   280	        union clk5_pll_req_no clk5_pll;
   281	        struct pci_dev *smn_dev;
   282	
   283	        smn_dev = pci_get_device(PCI_VENDOR_ID_AMD, 0x14E8, NULL);
   284	        if (!smn_dev) {
   285	                pr_err("sujith Failed to get host bridge device\n");
   286	                return;
   287	        }
   288	        /* Clk5 pll register values to get mclk as 196.6MHz*/
   289	        clk5_pll.bits.fb_mult_int = 0x31;
   290	        clk5_pll.bits.pll_spine_div = 0;
   291	        clk5_pll.bits.gb_mult_frac = 0x26E9;
   292	
   293	        data = smn_read(smn_dev, CLK5_CLK_PLL_PWR_REQ_N0);
   294	        smn_write(smn_dev, CLK5_CLK_PLL_PWR_REQ_N0, data | PLL_AUTO_STOP_REQ);
   295	
   296	        data = smn_read(smn_dev, CLK5_SPLL_FIELD_2_N0);
   297	        if (data & PLL_FRANCE_EN)
   298	                smn_write(smn_dev, CLK5_SPLL_FIELD_2_N0, data | PLL_FRANCE_EN);
   299	
   300	        smn_write(smn_dev, CLK5_CLK_PLL_REQ_N0, clk5_pll.clk5_pll_req_no_reg);
   301	
   302	        data = smn_read(smn_dev, CLK5_CLK_PLL_PWR_REQ_N0);
   303	        smn_write(smn_dev, CLK5_CLK_PLL_PWR_REQ_N0, data | PLL_AUTO_START_REQ);
   304	
   305	        data = smn_read(smn_dev, CLK5_CLK_DFSBYPASS_CONTR);
   306	        smn_write(smn_dev, CLK5_CLK_DFSBYPASS_CONTR, data | EXIT_DPF_BYPASS_0);
   307	        smn_write(smn_dev, CLK5_CLK_DFSBYPASS_CONTR, data | EXIT_DPF_BYPASS_1);
   308	
   309	        smn_write(smn_dev, CLK5_CLK_DFS_CNTL_N0, CLK0_DIVIDER);
   310	}
   311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
