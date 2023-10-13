Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7E5DDB0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 08:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l4pUkRJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697184411; x=1728720411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1tbUVl6aqT5+Sizj6MTgJYqY1tX/YdEVIkNt8Dn6gQg=;
  b=l4pUkRJqBZbMTFauLXOiFjcUJJBIXlpWCNUXo2gO44lNJPj/gCSExqmC
   GKMPdBILPpxy4sLK+wjD35n1mgUqgoPdR025IeE+Hwx46nIv41A5HckuY
   5UUAyCiwf2HWVZ3QdfOH/1/8J7KdNCuX/eXC7LBcco3PhfR1dOHmDUtlB
   YluKOUUDiGjJRBus8OPbDthHrQLbeNxPB8A/J4d5u1/gHUa3Aq3QbrFIv
   0hj67jCluAgT5aI5d2jQBGhG5/b2YitA21kSKfpAiP8qLFwHYyDg8gt+q
   qyjmqkxqmbkGCEZMc4NxC9cwDt7Biyzq58E4RRiidjCD+0W76mUWAWfQ4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="451607672"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="451607672"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 01:06:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="789768785"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="789768785"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Oct 2023 01:06:49 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrDC3-0004Ut-15;
	Fri, 13 Oct 2023 08:06:47 +0000
Date: Fri, 13 Oct 2023 16:05:53 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 627/25021]
 drivers/clk/imx/clk-imx-acm-utils.c:13: warning: Function parameter or
 member 'dev' not described in 'clk_imx_acm_attach_pm_domains'
Message-ID: <202310131527.pnB7TcZt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shengjiu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3a95b5654979d1c2d61616bf60249ed3a98dcfbc
commit: 67a7f9faba8affeb1633fe5a5020612fdf675ce6 [627/25021] MLK-23618-12: clk: imx: acm: add acm utils function
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231013/202310131527.pnB7TcZt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131527.pnB7TcZt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131527.pnB7TcZt-lkp@intel.com/

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
