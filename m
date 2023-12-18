Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD7B73468
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 19:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VheatmiB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702928835; x=1734464835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vvORKqf4ZM4c212nooxEyftP2E7k91sUqVdqp/B1xCc=;
  b=VheatmiBtFJZRj0PmmcAY7YK1/tKIrmgPN3FFT2Of/Ohy+rsdh+ADzUK
   bhRj9uXD/OlMVaiub1z2WcqmUEtjhZixE/WvBVrZd4CgIau3/ystr4zvB
   C9K7lMQe20Ivc7DG/3ooJ+eQnH1vTEsMMF93lVMrM6MQqnmp7V+VYRLUD
   Scs4CIWI9t51jWmCkS79qF5BCc6/Ocy4mLQtrUvYnzPM0dU190dckiPe5
   QF3CLeASSAVyrPA81f2JNcWsQL3E4iIC0MdtOrjYh0epm5/VATLFls1Tt
   dhjzes75uAQ1FCMltQicrwoDRtpEna2bUJWX2OmuTncKhqcIDWi9ajuII
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="394436619"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="394436619"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 11:47:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="846068512"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="846068512"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 18 Dec 2023 11:47:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFJa3-0004Tt-2I;
	Mon, 18 Dec 2023 19:47:11 +0000
Date: Tue, 19 Dec 2023 03:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] drivers: soc: xilinx: add check for platform
Message-ID: <202312190330.hWmwEPK8-lkp@intel.com>
References: <20231218094009.13528-3-jay.buddhabhatti@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231218094009.13528-3-jay.buddhabhatti@amd.com>

Hi Jay,

kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.7-rc6 next-20231218]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jay-Buddhabhatti/firmware-xilinx-Export-function-to-use-in-other-module/20231218-174351
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231218094009.13528-3-jay.buddhabhatti%40amd.com
patch subject: [PATCH 2/2] drivers: soc: xilinx: add check for platform
config: i386-buildonly-randconfig-001-20231218 (https://download.01.org/0day-ci/archive/20231219/202312190330.hWmwEPK8-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312190330.hWmwEPK8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312190330.hWmwEPK8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/edac/versal_edac.c: In function 'mc_probe':
>> drivers/edac/versal_edac.c:1008:41: error: 'EVENT_ERROR_PMC_ERR1' undeclared (first use in this function); did you mean 'VERSAL_EVENT_ERROR_PMC_ERR1'?
     rc = xlnx_register_event(PM_NOTIFY_CB, EVENT_ERROR_PMC_ERR1,
                                            ^~~~~~~~~~~~~~~~~~~~
                                            VERSAL_EVENT_ERROR_PMC_ERR1
   drivers/edac/versal_edac.c:1008:41: note: each undeclared identifier is reported only once for each function it appears in
   drivers/edac/versal_edac.c: In function 'mc_remove':
   drivers/edac/versal_edac.c:1045:38: error: 'EVENT_ERROR_PMC_ERR1' undeclared (first use in this function); did you mean 'VERSAL_EVENT_ERROR_PMC_ERR1'?
     xlnx_unregister_event(PM_NOTIFY_CB, EVENT_ERROR_PMC_ERR1,
                                         ^~~~~~~~~~~~~~~~~~~~
                                         VERSAL_EVENT_ERROR_PMC_ERR1


vim +1008 drivers/edac/versal_edac.c

6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   943  
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   944  static int mc_probe(struct platform_device *pdev)
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   945  {
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   946  	void __iomem *ddrmc_baseaddr, *ddrmc_noc_baseaddr;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   947  	struct edac_mc_layer layers[2];
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   948  	struct mem_ctl_info *mci;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   949  	u8 num_chans, num_csrows;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   950  	struct edac_priv *priv;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   951  	u32 edac_mc_id, regval;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   952  	int rc;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   953  
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   954  	ddrmc_baseaddr = devm_platform_ioremap_resource_byname(pdev, "base");
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   955  	if (IS_ERR(ddrmc_baseaddr))
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   956  		return PTR_ERR(ddrmc_baseaddr);
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   957  
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   958  	ddrmc_noc_baseaddr = devm_platform_ioremap_resource_byname(pdev, "noc");
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   959  	if (IS_ERR(ddrmc_noc_baseaddr))
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   960  		return PTR_ERR(ddrmc_noc_baseaddr);
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   961  
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   962  	if (!get_ecc_state(ddrmc_baseaddr))
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   963  		return -ENXIO;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   964  
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   965  	/* Allocate ID number for the EMIF controller */
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   966  	edac_mc_id = emif_get_id(pdev->dev.of_node);
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   967  
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   968  	regval = readl(ddrmc_baseaddr + XDDR_REG_CONFIG0_OFFSET);
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   969  	num_chans = FIELD_PREP(XDDR_REG_CONFIG0_NUM_CHANS_MASK, regval);
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   970  	num_chans++;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   971  
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   972  	num_csrows = FIELD_PREP(XDDR_REG_CONFIG0_NUM_RANKS_MASK, regval);
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   973  	num_csrows *= 2;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   974  	if (!num_csrows)
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   975  		num_csrows = 1;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   976  
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   977  	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   978  	layers[0].size = num_csrows;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   979  	layers[0].is_virt_csrow = true;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   980  	layers[1].type = EDAC_MC_LAYER_CHANNEL;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   981  	layers[1].size = num_chans;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   982  	layers[1].is_virt_csrow = false;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   983  
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   984  	mci = edac_mc_alloc(edac_mc_id, ARRAY_SIZE(layers), layers,
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   985  			    sizeof(struct edac_priv));
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   986  	if (!mci) {
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   987  		edac_printk(KERN_ERR, EDAC_MC,
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   988  			    "Failed memory allocation for mc instance\n");
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   989  		return -ENOMEM;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   990  	}
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   991  
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   992  	priv = mci->pvt_info;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   993  	priv->ddrmc_baseaddr = ddrmc_baseaddr;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   994  	priv->ddrmc_noc_baseaddr = ddrmc_noc_baseaddr;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   995  	priv->ce_cnt = 0;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   996  	priv->ue_cnt = 0;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   997  	priv->mc_id = edac_mc_id;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   998  
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05   999  	mc_init(mci, pdev);
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05  1000  
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05  1001  	rc = edac_mc_add_mc(mci);
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05  1002  	if (rc) {
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05  1003  		edac_printk(KERN_ERR, EDAC_MC,
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05  1004  			    "Failed to register with EDAC core\n");
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05  1005  		goto free_edac_mc;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05  1006  	}
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05  1007  
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05 @1008  	rc = xlnx_register_event(PM_NOTIFY_CB, EVENT_ERROR_PMC_ERR1,
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05  1009  				 XPM_EVENT_ERROR_MASK_DDRMC_CR | XPM_EVENT_ERROR_MASK_DDRMC_NCR |
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05  1010  				 XPM_EVENT_ERROR_MASK_NOC_CR | XPM_EVENT_ERROR_MASK_NOC_NCR,
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05  1011  				 false, err_callback, mci);
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05  1012  	if (rc) {
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05  1013  		if (rc == -EACCES)
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05  1014  			rc = -EPROBE_DEFER;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05  1015  
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05  1016  		goto del_mc;
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05  1017  	}
6f15b178cd6315 Shubhrajyoti Datta 2023-10-05  1018  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
