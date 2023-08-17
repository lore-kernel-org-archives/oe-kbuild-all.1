Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB30914AA0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 14:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692281076; x=1723817076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ma98MVyuCEn0Io8yv8dbnqSts7YQDwgn+0HTtpQ4j40=;
  b=je85YuLCfr6oESqFBqDiXP3szQu2rHC0sfN32LPkCyC38+l4If3AYTT3
   rIKCq+1rDlKZg3TsjNooJCbvdsuQAYOkdverui4Aop8jrI6astHfvUH+V
   h5q7j58CF1bUv4Tq6WzUmEulmycqT7A4g5hfNFB45H2/lot8g0uFdnZG+
   QgDRGkNyXxHnXEEa9X0t3geno4PyBiSq9Np2AeLFR4fmBPMSSE/TNxEvk
   jtNka/fp0CURQ8Uu2fFveW+yLeBks9up9ttBUllTLbXehBdE19Ya/h+Pt
   74PdNFkZHwIQfG+mQlftKU+mL250Ys7wr2FlszetL8ZVdHw5/+aU2qx4F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="352402887"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="352402887"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 07:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="734670769"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="734670769"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Aug 2023 07:04:17 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWdb7-0001C7-1E;
	Thu, 17 Aug 2023 14:03:46 +0000
Date: Thu, 17 Aug 2023 22:00:42 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Kishon <kishon@ti.com>
Subject: [phy:next 67/74] drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:2357:38:
 warning: 'qmp_pcie_offsets_v5_20' defined but not used
Message-ID: <202308172102.2PXA2WFl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git next
head:   a11ecceaf41d2dd542228007940652fea7532276
commit: 64adc0bf06ad5855da5a02b9653fb7cfda289c50 [67/74] phy: qcom-qmp-pcie: populate offsets configuration
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230817/202308172102.2PXA2WFl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172102.2PXA2WFl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172102.2PXA2WFl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:2378:38: error: redefinition of 'qmp_pcie_offsets_v5_20'
    2378 | static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_20 = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:2357:38: note: previous definition of 'qmp_pcie_offsets_v5_20' with type 'const struct qmp_pcie_offsets'
    2357 | static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_20 = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:2357:38: warning: 'qmp_pcie_offsets_v5_20' defined but not used [-Wunused-const-variable=]


vim +/qmp_pcie_offsets_v5_20 +2357 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c

  2356	
> 2357	static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_20 = {
  2358		.serdes		= 0x1000,
  2359		.pcs		= 0x1200,
  2360		.pcs_misc	= 0x1400,
  2361		.tx		= 0x0000,
  2362		.rx		= 0x0200,
  2363		.tx2		= 0x0800,
  2364		.rx2		= 0x0a00,
  2365	};
  2366	
  2367	static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_20 = {
  2368		.serdes		= 0x1000,
  2369		.pcs		= 0x1200,
  2370		.pcs_misc	= 0x1400,
  2371		.tx		= 0x0000,
  2372		.rx		= 0x0200,
  2373		.tx2		= 0x0800,
  2374		.rx2		= 0x0a00,
  2375		.ln_shrd	= 0x0e00,
  2376	};
  2377	
> 2378	static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_20 = {
  2379		.serdes		= 0x1000,
  2380		.pcs		= 0x1200,
  2381		.pcs_misc	= 0x1400,
  2382		.tx		= 0x0000,
  2383		.rx		= 0x0200,
  2384		.tx2		= 0x0800,
  2385		.rx2		= 0x0a00,
  2386		.ln_shrd	= 0x0e00,
  2387	};
  2388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
