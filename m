Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF5AA5D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 07:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693122077; x=1724658077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F1vUEm+lk3QCCyGI4Q1CjB0Nc9JnJKvkx38XjdVbACE=;
  b=eCGBEa50QpV3UhJXTDcnB6SjKbEjmb+H7YD16kZtZKAOyMiw5HTVvJud
   AO6ukyuZVb+6TQ1mjg4yeqwEYsxE13AFN5Birvh8y5dXRscQ8EPA7khHs
   Fh5dqDEzUPvsTiGytFWtvpStzPhVdVxIDjEj3dDYBxscJA+gghy4cToAf
   +NhwAttB6VRfGx6VSdREntNZ04f2M1lc+3QEONTFkIOGo1DgdZTopr6KU
   z9wQMfBmDCCEsuguFOSBFS+JZD+T3g4ub9Fn/EP63H+MZN0gMGNYzUbln
   +WwTLN3F5cmpc7CPRV7ercMryRTHBlKAXkQ32S4Wdm3+MbfOxLldRcCmP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="374897728"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="374897728"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 00:41:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="731480160"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="731480160"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 27 Aug 2023 00:41:03 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaAON-0005Wx-0T;
	Sun, 27 Aug 2023 07:41:03 +0000
Date: Sun, 27 Aug 2023 15:40:12 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [krzk-github:wip/sm8350-audio 13/18]
 drivers/soc/qcom/pmic_glink_altmode.c:218:13: error: redefinition of
 'pmic_glink_altmode_safe'
Message-ID: <202308271540.ml5FyREo-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230827/202308271540.ml5FyREo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271540.ml5FyREo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271540.ml5FyREo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/pmic_glink_altmode.c:218:13: error: redefinition of 'pmic_glink_altmode_safe'
     218 | static void pmic_glink_altmode_safe(struct pmic_glink_altmode *altmode,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/pmic_glink_altmode.c:196:13: note: previous definition of 'pmic_glink_altmode_safe' with type 'void(struct pmic_glink_altmode *, struct pmic_glink_altmode_port *)'
     196 | static void pmic_glink_altmode_safe(struct pmic_glink_altmode *altmode,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/qcom/pmic_glink_altmode.c:196:13: warning: 'pmic_glink_altmode_safe' defined but not used [-Wunused-function]


vim +/pmic_glink_altmode_safe +218 drivers/soc/qcom/pmic_glink_altmode.c

   217	
 > 218	static void pmic_glink_altmode_safe(struct pmic_glink_altmode *altmode,
   219					    struct pmic_glink_altmode_port *port)
   220	{
   221		int ret;
   222	
   223		port->state.alt = NULL;
   224		port->state.data = NULL;
   225		port->state.mode = TYPEC_STATE_SAFE;
   226	
   227		ret = typec_mux_set(port->typec_mux, &port->state);
   228		if (ret)
   229			dev_err(altmode->dev, "failed to switch mux to safe mode\n");
   230	}
   231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
