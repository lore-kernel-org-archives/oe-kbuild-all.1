Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4448D50A6F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 23:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707436750; cv=none; b=RfZzYdZSmV/yQHFuak+uOi0OaVn3GuvipLspTYVXgAGJri9nWcEf6myStl/TuIgqj9V84rJ2byKZaZyy8cP0QSzebws3JIBQ/7FqEpSC1TfNT7sIpnZl6a9Kgoq0SjZ4qLe5wSjMpRIM/petzHlHiije2I17gCeKbM1bQAiYS6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707436750; c=relaxed/simple;
	bh=vB1WzPknvQTW1LPRF/lkkKxtrmsrdGLfL+S8qb2BHdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ISKqZYhZ8elHFpH7XYSjyEPJ+uGPKweeOGiEFp8IgBFbd+63veWNdQElhcKumb4t4ciea3pRiirxQc3RG4Nt/jSyQaJiS5sTpPB5q2qEmkl9pVZL5a7yye3Fnot0QRSDUBB5Y/oOu28r3Pqmjm4jIRXOwhd9L5DePHLblvr+OEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3x79T6U; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3x79T6U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707436748; x=1738972748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vB1WzPknvQTW1LPRF/lkkKxtrmsrdGLfL+S8qb2BHdk=;
  b=R3x79T6U6sNvyMAA+Vfw8kquQML7eAUY6wx5URgQ4DwGJZH/r7KRtZWS
   iYoY2Pg2395v+A83BPE6eWwnftgQNLLtdSgtzD1Xz6FrgiAsSWQzFjph4
   Djk5GCFCwYmGhtG2crVj7GKjIgiKJJthcQetS/6BuuRwbiiGc7fQWnnwv
   l6RZ4cVulBDxwhCna64y7u0GayxLNukdkJNX3+OhA8Fean5+9Eutlx9YT
   0NrlXdqSts7EZt87YrdJ22BlXHH31wGraMqD7PdWrZecqI2jN/OdaKGjd
   2tIuJ3SIcsnh1OHZFXAnNTdgI7oNrnFGTpDUsNDjE9azn8OIeKxPe0AWe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1231512"
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="1231512"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 15:59:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="1787936"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Feb 2024 15:59:04 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYEII-0004Dk-1n;
	Thu, 08 Feb 2024 23:59:02 +0000
Date: Fri, 9 Feb 2024 07:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 565/17898]
 drivers/clk/imx/clk-imx-acm-utils.c:13: warning: Function parameter or
 member 'dev' not described in 'clk_imx_acm_attach_pm_domains'
Message-ID: <202402090706.jbY2EyEH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   4e3fc5471376a15279ee5c99e791a7c7b065cbc1
commit: d2e08b5fe8be9a8418c988cb44f30a3db0202d81 [565/17898] MLK-23618-12: clk: imx: acm: add acm utils function
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240209/202402090706.jbY2EyEH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240209/202402090706.jbY2EyEH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402090706.jbY2EyEH-lkp@intel.com/

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
