Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD96A93A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 10:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693565378; x=1725101378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8AYFQeKad7pMuf47rtDG46kt7+Hri4bzPudJHPyI9bM=;
  b=GbwDxC04rmxu+WhWGnsNTh8oSKLbvuu/H01Wv5eBFNBtuiO+oUBPJ6U5
   gQNWSfOfr3kdageulUxkJw1iuimK9khrM6j89ptDAU8keRhPp+FNZsSlS
   ycCTUK9eU57MEeGI9cERLhq30PQFhGJYXQ+5LQt9ggbz6a4VIhTaM/5a/
   UK8M7hVMFwFoK23sGJWsR7gOXHkXp87SBEVMjaT8JwLuXEOqeUtDAWBm2
   XhYuSOpF0XkirVnZetNmDNHvE5jY6B65xkjrYkf2ZkR3gJYPcnksiFwSy
   pK8KK/ML7l5iptZOGh2kDjRgypsAJzDqlNL6P4vUarFdOJ1zyQWXz5UNJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="376127768"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="376127768"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 03:49:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="689726326"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="689726326"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Sep 2023 03:49:35 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc1iX-0001Cx-0q;
	Fri, 01 Sep 2023 10:49:33 +0000
Date: Fri, 1 Sep 2023 18:49:08 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 627/24604]
 drivers/clk/imx/clk-imx-acm-utils.c:13: warning: Function parameter or
 member 'dev' not described in 'clk_imx_acm_attach_pm_domains'
Message-ID: <202309011838.V5MgfoMq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: 67a7f9faba8affeb1633fe5a5020612fdf675ce6 [627/24604] MLK-23618-12: clk: imx: acm: add acm utils function
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230901/202309011838.V5MgfoMq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011838.V5MgfoMq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011838.V5MgfoMq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/imx/clk-imx-acm-utils.c:13: warning: Function parameter or member 'dev' not described in 'clk_imx_acm_attach_pm_domains'
>> drivers/clk/imx/clk-imx-acm-utils.c:13: warning: Function parameter or member 'dev_pm' not described in 'clk_imx_acm_attach_pm_domains'
>> drivers/clk/imx/clk-imx-acm-utils.c:66: warning: Function parameter or member 'dev' not described in 'clk_imx_acm_detach_pm_domains'
>> drivers/clk/imx/clk-imx-acm-utils.c:66: warning: Function parameter or member 'dev_pm' not described in 'clk_imx_acm_detach_pm_domains'
>> drivers/clk/imx/clk-imx-acm-utils.c:66: warning: expecting prototype for fsl_dev_detach_pm_domains(). Prototype was for clk_imx_acm_detach_pm_domains() instead


vim +13 drivers/clk/imx/clk-imx-acm-utils.c

     7	
     8	/**
     9	 * clk_imx_acm_attach_pm_domains
    10	 */
    11	int clk_imx_acm_attach_pm_domains(struct device *dev,
    12					  struct clk_imx_acm_pm_domains *dev_pm)
  > 13	{
    14		int ret;
    15		int i;
    16	
    17		dev_pm->num_domains = of_count_phandle_with_args(dev->of_node, "power-domains",
    18								 "#power-domain-cells");
    19		if (dev_pm->num_domains <= 1)
    20			return 0;
    21	
    22		dev_pm->pd_dev = devm_kmalloc_array(dev, dev_pm->num_domains,
    23						    sizeof(*dev_pm->pd_dev),
    24						    GFP_KERNEL);
    25		if (!dev_pm->pd_dev)
    26			return -ENOMEM;
    27	
    28		dev_pm->pd_dev_link = devm_kmalloc_array(dev,
    29							 dev_pm->num_domains,
    30							 sizeof(*dev_pm->pd_dev_link),
    31							 GFP_KERNEL);
    32		if (!dev_pm->pd_dev_link)
    33			return -ENOMEM;
    34	
    35		for (i = 0; i < dev_pm->num_domains; i++) {
    36			dev_pm->pd_dev[i] = dev_pm_domain_attach_by_id(dev, i);
    37			if (IS_ERR(dev_pm->pd_dev[i]))
    38				return PTR_ERR(dev_pm->pd_dev[i]);
    39	
    40			dev_pm->pd_dev_link[i] = device_link_add(dev,
    41								 dev_pm->pd_dev[i],
    42								 DL_FLAG_STATELESS |
    43								 DL_FLAG_PM_RUNTIME |
    44								 DL_FLAG_RPM_ACTIVE);
    45			if (IS_ERR(dev_pm->pd_dev_link[i])) {
    46				dev_pm_domain_detach(dev_pm->pd_dev[i], false);
    47				ret = PTR_ERR(dev_pm->pd_dev_link[i]);
    48				goto detach_pm;
    49			}
    50		}
    51		return 0;
    52	
    53	detach_pm:
    54		while (--i >= 0) {
    55			device_link_del(dev_pm->pd_dev_link[i]);
    56			dev_pm_domain_detach(dev_pm->pd_dev[i], false);
    57		}
    58		return ret;
    59	}
    60	
    61	/**
    62	 * fsl_dev_detach_pm_domains
    63	 */
    64	int clk_imx_acm_detach_pm_domains(struct device *dev,
    65					  struct clk_imx_acm_pm_domains *dev_pm)
  > 66	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
