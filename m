Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCD03D8C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 07:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689751977; x=1721287977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EAqqEI0Te+uX4HZADws/2UVIwFiKzbJVtY2nhsM9A10=;
  b=WMSvX7tHMV1KMCAq5/Ok1GIzMiUk99U/NMzJzBZJ7lluCr/BcCtQwOAS
   TMJI8iXJj8LMbH4OJmLwCouw1ZfkQxlkpeobBUXbl8xrz2rilIDHWS501
   kNIIRUDlVDLjQlyfzLmXrzbWcV/UortAyYzHBiHmv4SyvwiOBHz5e5tms
   +F6yB+n6I/1Gwrwg/1f3l/2a3xFeHGFpqi1Ece6gkEI/6IALQ5oHNH8DA
   oX4YEEZ6tARepm+xnZ7E9HsdJzBKPmfyaO1KOCyk6xD1JKDtxzEgHunJl
   vVIUi3dayJbVLVBlCicKRuWMqk0XpUEgbxWwIRwOfpsQJmAfShVXojzj1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="365273609"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="365273609"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 00:32:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="759056130"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="759056130"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 19 Jul 2023 00:32:55 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM1g4-0004GP-2I;
	Wed, 19 Jul 2023 07:32:53 +0000
Date: Wed, 19 Jul 2023 15:32:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 24/25] sound/soc/sof/amd/acp.c:62:6:
 warning: no previous prototype for 'master_clock_generate'
Message-ID: <202307191545.oMEdEjOe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   5567be478ca01ae6c97ce7517d73576d0019c216
commit: e94be1e163d9dfb10b12ba6f5dd157f4400573b8 [24/25] CHROMIUM: ASoC: SOF: amd: Configure MCLK 196.6 MHz and select lpfll as input.
config: x86_64-buildonly-randconfig-r001-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191545.oMEdEjOe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191545.oMEdEjOe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191545.oMEdEjOe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sof/amd/acp.c:62:6: warning: no previous prototype for 'master_clock_generate' [-Wmissing-prototypes]
      62 | void master_clock_generate(struct acp_dev_data *adata)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/master_clock_generate +62 sound/soc/sof/amd/acp.c

    61	
  > 62	void master_clock_generate(struct acp_dev_data *adata)
    63	{
    64		struct snd_sof_dev *sdev = adata->dev;
    65		union clk5_pll_req_no clk5_pll;
    66		u32 data;
    67	
    68		/* Clk5 pll register values to get mclk as 196.6MHz*/
    69		clk5_pll.bits.fb_mult_int = 0x31;
    70		clk5_pll.bits.pll_spine_div = 0;
    71		clk5_pll.bits.gb_mult_frac = 0x26E9;
    72	
    73		snd_sof_dsp_write(sdev, ACP_DSP_BAR, 0x105c, 0x1);
    74		smn_read(adata->smn_dev, CLK5_CLK_PLL_PWR_REQ_N0, &data);
    75		smn_write(adata->smn_dev, CLK5_CLK_PLL_PWR_REQ_N0, data | PLL_AUTO_STOP_REQ);
    76	
    77		smn_read(adata->smn_dev, CLK5_SPLL_FIELD_2_N0, &data);
    78		if (data & PLL_FRANCE_EN)
    79			smn_write(adata->smn_dev, CLK5_SPLL_FIELD_2_N0, data | PLL_FRANCE_EN);
    80	
    81		smn_write(adata->smn_dev, CLK5_CLK_PLL_REQ_N0, clk5_pll.clk5_pll_req_no_reg);
    82	
    83		smn_read(adata->smn_dev, CLK5_CLK_PLL_PWR_REQ_N0, &data);
    84		smn_write(adata->smn_dev, CLK5_CLK_PLL_PWR_REQ_N0, data | PLL_AUTO_START_REQ);
    85	
    86		smn_read(adata->smn_dev, CLK5_CLK_DFSBYPASS_CONTR, &data);
    87		smn_write(adata->smn_dev, CLK5_CLK_DFSBYPASS_CONTR, data | EXIT_DPF_BYPASS_0);
    88		smn_write(adata->smn_dev, CLK5_CLK_DFSBYPASS_CONTR, data | EXIT_DPF_BYPASS_1);
    89	
    90		smn_write(adata->smn_dev, CLK5_CLK_DFS_CNTL_N0, CLK0_DIVIDER);
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
