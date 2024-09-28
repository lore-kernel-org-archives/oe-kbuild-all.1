Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA6C1DFF7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727527759; cv=none; b=kE/Kefl2bcOtlizfj7W9/D+kxhuOD+g23GK3S6fFiTJeSJOyeHAiLf1Q6j8zjssnRTTQYkCinJoA4kb6yDM0ROoDw1gBMti4bcKg6o8ig38VQX70yTW2b04kpDEHEk/fTKNDyrjaNmYMmuURdbSv92/9zNUhuR5VTKrQ4RScRLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727527759; c=relaxed/simple;
	bh=aVRZT3Phy6mAb1/YSRnjnLqnINdNnGPpGgxf7ZScbCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u+UJQzRQLCmlCTDYPmxqVSEhtfE0J4VsQFbynaC+7svesWO7/uLxgY8ac3qehbt9PlTlSJpT+V4CAE7fZfG62S1xfvsRxW/a9F3BqOy/eC2kd8wYYKO1UiRpKicD0WC5brx+UBdy9SA3OcdQvGYpjRHXHwjQNNJHudLklAdhy3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mxsoz+5s; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mxsoz+5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727527757; x=1759063757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aVRZT3Phy6mAb1/YSRnjnLqnINdNnGPpGgxf7ZScbCs=;
  b=Mxsoz+5sz3SL7LyF7U1N5y9FfluzNGcmVKE6qqXlkf8bRbHCe4Jy/u5O
   NA8ce0LuSJG05vgP0oIk8UHWJhCDTSEOuhBfJDP30vnMPopPUz7rr9Oi/
   bj3aCb8+P3r/FXyvvxnMRtWBbNiTJaUnwRjxVrMQiTL0+9oh1PnHr0efX
   +7w4KiXjp1fTJMq5iaCgV5Cvs1YSQJDuzm0fbqKNZ1cub9JxVjKvvQFZP
   lDvab761jdJRHDknerfR5WKRMKGsbmCR2w1ypnfCjaPXt+jc3X7JwglSr
   lFqFwD4brSidIUMQdRgYSWXjewdinWk/BTFrrPSozcCT94eF56GglUmss
   g==;
X-CSE-ConnectionGUID: 4CmpNEKXTlm//UbRHHlAOg==
X-CSE-MsgGUID: kPxOgbXCQLaVLLdGgW6e1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="37243595"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="37243595"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 05:49:16 -0700
X-CSE-ConnectionGUID: T6np9bvOQyK98p+8AP5E4A==
X-CSE-MsgGUID: cTm1Pw5tRUqFW2wBWwuO7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72966819"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Sep 2024 05:49:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suWsq-000NGp-2u;
	Sat, 28 Sep 2024 12:49:12 +0000
Date: Sat, 28 Sep 2024 20:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 5811/16788]
 drivers/gpu/drm/imx/imx-drm-core.c:261:46: warning: format '%ld' expects
 argument of type 'long int', but argument 3 has type 'unsigned int'
Message-ID: <202409282017.WhgP3UpL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 7ef3dd5fdefe657ab1a96aea0fd0f8a87f4e9322 [5811/16788] Merge remote-tracking branch 'origin/display/lcdif' into display/next
config: arc-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409282017.WhgP3UpL-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282017.WhgP3UpL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409282017.WhgP3UpL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/gpu/drm/imx/imx-drm-core.c:9:
   drivers/gpu/drm/imx/imx-drm-core.c: In function 'add_dpu_bliteng_components':
>> drivers/gpu/drm/imx/imx-drm-core.c:261:46: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'unsigned int' [-Wformat=]
     261 |                                 dev_err(dev, "The number of found dpu is greater than max [%ld].\n",
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/gpu/drm/imx/imx-drm-core.c:261:33: note: in expansion of macro 'dev_err'
     261 |                                 dev_err(dev, "The number of found dpu is greater than max [%ld].\n",
         |                                 ^~~~~~~
   drivers/gpu/drm/imx/imx-drm-core.c:261:94: note: format string is defined here
     261 |                                 dev_err(dev, "The number of found dpu is greater than max [%ld].\n",
         |                                                                                            ~~^
         |                                                                                              |
         |                                                                                              long int
         |                                                                                            %d


vim +261 drivers/gpu/drm/imx/imx-drm-core.c

ca990b91d10cb4 Xianzhong 2021-06-09  227  
ca990b91d10cb4 Xianzhong 2021-06-09  228  static void add_dpu_bliteng_components(struct device *dev,
ca990b91d10cb4 Xianzhong 2021-06-09  229  				       struct component_match **matchptr)
ca990b91d10cb4 Xianzhong 2021-06-09  230  {
ca990b91d10cb4 Xianzhong 2021-06-09  231  	/*
ca990b91d10cb4 Xianzhong 2021-06-09  232  	 * As there may be two dpu bliteng device,
ca990b91d10cb4 Xianzhong 2021-06-09  233  	 * so need add something in compare data to distinguish.
ca990b91d10cb4 Xianzhong 2021-06-09  234  	 * Use its parent dpu's of_node as the data here.
ca990b91d10cb4 Xianzhong 2021-06-09  235  	 */
ca990b91d10cb4 Xianzhong 2021-06-09  236  	struct device_node *port, *parent;
ca990b91d10cb4 Xianzhong 2021-06-09  237  	/* assume max dpu number is 8 */
ca990b91d10cb4 Xianzhong 2021-06-09  238  	struct device_node *dpu[8];
ca990b91d10cb4 Xianzhong 2021-06-09  239  	int num_dpu = 0;
ca990b91d10cb4 Xianzhong 2021-06-09  240  	int i, j;
ca990b91d10cb4 Xianzhong 2021-06-09  241  	bool found = false;
ca990b91d10cb4 Xianzhong 2021-06-09  242  
ca990b91d10cb4 Xianzhong 2021-06-09  243  	for (i = 0; ; i++) {
ca990b91d10cb4 Xianzhong 2021-06-09  244  		port = of_parse_phandle(dev->of_node, "ports", i);
ca990b91d10cb4 Xianzhong 2021-06-09  245  		if (!port)
ca990b91d10cb4 Xianzhong 2021-06-09  246  			break;
ca990b91d10cb4 Xianzhong 2021-06-09  247  
ca990b91d10cb4 Xianzhong 2021-06-09  248  		parent = of_get_parent(port);
ca990b91d10cb4 Xianzhong 2021-06-09  249  
ca990b91d10cb4 Xianzhong 2021-06-09  250  		for (j = 0; j < num_dpu; j++) {
ca990b91d10cb4 Xianzhong 2021-06-09  251  			if (dpu[j] == parent) {
ca990b91d10cb4 Xianzhong 2021-06-09  252  				found = true;
ca990b91d10cb4 Xianzhong 2021-06-09  253  				break;
ca990b91d10cb4 Xianzhong 2021-06-09  254  			}
ca990b91d10cb4 Xianzhong 2021-06-09  255  		}
ca990b91d10cb4 Xianzhong 2021-06-09  256  
ca990b91d10cb4 Xianzhong 2021-06-09  257  		if (found) {
ca990b91d10cb4 Xianzhong 2021-06-09  258  			found = false;
ca990b91d10cb4 Xianzhong 2021-06-09  259  		} else {
ca990b91d10cb4 Xianzhong 2021-06-09  260  			if (num_dpu >= ARRAY_SIZE(dpu)) {
ca990b91d10cb4 Xianzhong 2021-06-09 @261  				dev_err(dev, "The number of found dpu is greater than max [%ld].\n",
ca990b91d10cb4 Xianzhong 2021-06-09  262  					ARRAY_SIZE(dpu));
ca990b91d10cb4 Xianzhong 2021-06-09  263  				of_node_put(parent);
ca990b91d10cb4 Xianzhong 2021-06-09  264  				of_node_put(port);
ca990b91d10cb4 Xianzhong 2021-06-09  265  				break;
ca990b91d10cb4 Xianzhong 2021-06-09  266  			}
ca990b91d10cb4 Xianzhong 2021-06-09  267  
ca990b91d10cb4 Xianzhong 2021-06-09  268  			dpu[num_dpu] = parent;
ca990b91d10cb4 Xianzhong 2021-06-09  269  			num_dpu++;
ca990b91d10cb4 Xianzhong 2021-06-09  270  
ca990b91d10cb4 Xianzhong 2021-06-09  271  			component_match_add(dev, matchptr, compare_of, parent);
ca990b91d10cb4 Xianzhong 2021-06-09  272  		}
ca990b91d10cb4 Xianzhong 2021-06-09  273  
ca990b91d10cb4 Xianzhong 2021-06-09  274  		of_node_put(parent);
ca990b91d10cb4 Xianzhong 2021-06-09  275  		of_node_put(port);
ca990b91d10cb4 Xianzhong 2021-06-09  276  	}
ca990b91d10cb4 Xianzhong 2021-06-09  277  }
ca990b91d10cb4 Xianzhong 2021-06-09  278  

:::::: The code at line 261 was first introduced by commit
:::::: ca990b91d10cb475435207d848e05b1a8972a626 MLK-15321-4 drm/imx: core: Add bliteng as component of imx-drm

:::::: TO: Xianzhong <xianzhong.li@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
