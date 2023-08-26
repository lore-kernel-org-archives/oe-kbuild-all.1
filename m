Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E26AD513
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 11:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693050149; x=1724586149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RBUIf7VwpmLMTzVeyFV7Lzo0V8D9GiVXd6gIEAA76YM=;
  b=VeP1PX8AV8IRurA7uX2mx59/kW+qZTFCFG5IVcxfgQC9K/zK5yvvkNrI
   n2rTHJ2/9tckjzwpfuuiHHdF/jyeu1lVUdOdQnXk49+uQOQpKX2/vKf+a
   Dq1wIoE6gRCNv4Z7Fm5kLEPFMw/gAfB9vtNOBvEuDmha1iRwYP60Ip7/0
   2r55ZwX2b2D+Wncem0Mw3IUc8z3W00PhCphbJnxQB8c/hD+9lDbAILlHZ
   RsE4G0xvbVybOFkNPwMDUe3QAiLrRz8G4lQFywwckr2YK2/LaDuQVUI4N
   6p+JZ0a5xN/ZzI98KXqU1qkm1nrQnroZuaOSKwTagLhyslK3hm80p7Fv2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="438811502"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="438811502"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 04:42:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="1068522939"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="1068522939"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Aug 2023 04:42:23 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZrgN-0004eX-0O;
	Sat, 26 Aug 2023 11:42:23 +0000
Date: Sat, 26 Aug 2023 19:41:30 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [krzk-github:wip/sm8350-audio 13/18]
 drivers/soc/qcom/pmic_glink_altmode.c:196:13: warning:
 'pmic_glink_altmode_safe' defined but not used
Message-ID: <202308261914.GwbXn7ov-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux wip/sm8350-audio
head:   fbcca75d3b6ffdbe10406b7c2f68d66d335565c3
commit: 115387cf5292a5e3aa8aa2a4f476de64f8249bb5 [13/18] soc: qcom: pmic_glink_altmode: handle safe mode when disconnect
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230826/202308261914.GwbXn7ov-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261914.GwbXn7ov-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261914.GwbXn7ov-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/qcom/pmic_glink_altmode.c:218:13: error: redefinition of 'pmic_glink_altmode_safe'
     218 | static void pmic_glink_altmode_safe(struct pmic_glink_altmode *altmode,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/pmic_glink_altmode.c:196:13: note: previous definition of 'pmic_glink_altmode_safe' with type 'void(struct pmic_glink_altmode *, struct pmic_glink_altmode_port *)'
     196 | static void pmic_glink_altmode_safe(struct pmic_glink_altmode *altmode,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/qcom/pmic_glink_altmode.c:196:13: warning: 'pmic_glink_altmode_safe' defined but not used [-Wunused-function]


vim +/pmic_glink_altmode_safe +196 drivers/soc/qcom/pmic_glink_altmode.c

080b4e24852b1d Bjorn Andersson 2023-01-31  195  
1beecfe68f802e Neil Armstrong  2023-06-19 @196  static void pmic_glink_altmode_safe(struct pmic_glink_altmode *altmode,
1beecfe68f802e Neil Armstrong  2023-06-19  197  				    struct pmic_glink_altmode_port *port)
1beecfe68f802e Neil Armstrong  2023-06-19  198  {
1beecfe68f802e Neil Armstrong  2023-06-19  199  	int ret;
1beecfe68f802e Neil Armstrong  2023-06-19  200  
1beecfe68f802e Neil Armstrong  2023-06-19  201  	port->state.alt = NULL;
1beecfe68f802e Neil Armstrong  2023-06-19  202  	port->state.data = NULL;
1beecfe68f802e Neil Armstrong  2023-06-19  203  	port->state.mode = TYPEC_STATE_SAFE;
1beecfe68f802e Neil Armstrong  2023-06-19  204  
1beecfe68f802e Neil Armstrong  2023-06-19  205  	ret = typec_mux_set(port->typec_mux, &port->state);
1beecfe68f802e Neil Armstrong  2023-06-19  206  	if (ret)
1beecfe68f802e Neil Armstrong  2023-06-19  207  		dev_err(altmode->dev, "failed to switch mux to safe mode\n");
0549bc385f3534 Neil Armstrong  2023-06-19  208  
0549bc385f3534 Neil Armstrong  2023-06-19  209  	port->retimer_state.alt = NULL;
0549bc385f3534 Neil Armstrong  2023-06-19  210  	port->retimer_state.data = NULL;
0549bc385f3534 Neil Armstrong  2023-06-19  211  	port->retimer_state.mode = TYPEC_STATE_SAFE;
0549bc385f3534 Neil Armstrong  2023-06-19  212  
0549bc385f3534 Neil Armstrong  2023-06-19  213  	ret = typec_retimer_set(port->typec_retimer, &port->retimer_state);
0549bc385f3534 Neil Armstrong  2023-06-19  214  	if (ret)
0549bc385f3534 Neil Armstrong  2023-06-19  215  		dev_err(altmode->dev, "failed to setup retimer to USB\n");
1beecfe68f802e Neil Armstrong  2023-06-19  216  }
1beecfe68f802e Neil Armstrong  2023-06-19  217  

:::::: The code at line 196 was first introduced by commit
:::::: 1beecfe68f802e5d4218bb7c5a728f2f38c979c7 soc: qcom: pmic_glink_altmode: handle safe mode when disconnect

:::::: TO: Neil Armstrong <neil.armstrong@linaro.org>
:::::: CC: Bjorn Andersson <andersson@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
