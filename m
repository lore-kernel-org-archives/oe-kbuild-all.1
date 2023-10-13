Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C27360
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 00:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mW7VEzFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697156728; x=1728692728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fJtnCTgsWkmhyRWwOyCNowxbfyCNhAJQd1PKSpzXN80=;
  b=mW7VEzFBKTU+kOrTEcsEuWqiem+lcSq/UenAWuGpQAC2PQUIjst7mKa1
   XGvo/Z6bbj0887HJvl2i9Zxl1qD7x6u/wQhLRin7UHh1sFQmUOZAUOlMm
   DsQr1WeKbezMGxNG3umP9C7xe8fBxh3hPtKHYJIimWIOXkLAgNNaQlnSm
   YwAya+lgwH82qqNZMwXUnh8TUnbt8Zm1CWQ9AEl3gyh3HlcgqNqtnmU/h
   sJe0XAUT5CWjRgxgvCX10/OQdSVnKgj1J3QmdGEBf6wyZrkuwId2ntT6i
   YjqvvaHzeCHpKC7bsoyNxg1pt05Q8WpXERF+xRhKW85tVt/CXGT8nd0LW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="449261381"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="449261381"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 17:25:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="731126213"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="731126213"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Oct 2023 17:25:18 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr5zQ-00047d-2A;
	Fri, 13 Oct 2023 00:25:16 +0000
Date: Fri, 13 Oct 2023 08:24:46 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2234/30000]
 drivers/gpu/drm/imx/imx-drm-core.c:216:46: warning: format '%ld' expects
 argument of type 'long int', but argument 3 has type 'unsigned int'
Message-ID: <202310130859.nrQOPwU2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 4b8a6afa4362a1c47510a7dafe4467d7a447bdf3 [2234/30000] Merge remote-tracking branch 'origin/display/lcdif' into display/next
config: nios2-randconfig-002-20231013 (https://download.01.org/0day-ci/archive/20231013/202310130859.nrQOPwU2-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130859.nrQOPwU2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130859.nrQOPwU2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/imx/imx-drm-core.c:9:
   drivers/gpu/drm/imx/imx-drm-core.c: In function 'add_dpu_bliteng_components':
>> drivers/gpu/drm/imx/imx-drm-core.c:216:46: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'unsigned int' [-Wformat=]
     216 |                                 dev_err(dev, "The number of found dpu is greater than max [%ld].\n",
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1658:22: note: in definition of macro 'dev_fmt'
    1658 | #define dev_fmt(fmt) fmt
         |                      ^~~
   drivers/gpu/drm/imx/imx-drm-core.c:216:33: note: in expansion of macro 'dev_err'
     216 |                                 dev_err(dev, "The number of found dpu is greater than max [%ld].\n",
         |                                 ^~~~~~~
   drivers/gpu/drm/imx/imx-drm-core.c:216:94: note: format string is defined here
     216 |                                 dev_err(dev, "The number of found dpu is greater than max [%ld].\n",
         |                                                                                            ~~^
         |                                                                                              |
         |                                                                                              long int
         |                                                                                            %d


vim +216 drivers/gpu/drm/imx/imx-drm-core.c

34e715848907c8 Xianzhong 2019-08-14  182  
34e715848907c8 Xianzhong 2019-08-14  183  static void add_dpu_bliteng_components(struct device *dev,
34e715848907c8 Xianzhong 2019-08-14  184  				       struct component_match **matchptr)
34e715848907c8 Xianzhong 2019-08-14  185  {
34e715848907c8 Xianzhong 2019-08-14  186  	/*
34e715848907c8 Xianzhong 2019-08-14  187  	 * As there may be two dpu bliteng device,
34e715848907c8 Xianzhong 2019-08-14  188  	 * so need add something in compare data to distinguish.
34e715848907c8 Xianzhong 2019-08-14  189  	 * Use its parent dpu's of_node as the data here.
34e715848907c8 Xianzhong 2019-08-14  190  	 */
34e715848907c8 Xianzhong 2019-08-14  191  	struct device_node *port, *parent;
34e715848907c8 Xianzhong 2019-08-14  192  	/* assume max dpu number is 8 */
34e715848907c8 Xianzhong 2019-08-14  193  	struct device_node *dpu[8];
34e715848907c8 Xianzhong 2019-08-14  194  	int num_dpu = 0;
34e715848907c8 Xianzhong 2019-08-14  195  	int i, j;
34e715848907c8 Xianzhong 2019-08-14  196  	bool found = false;
34e715848907c8 Xianzhong 2019-08-14  197  
34e715848907c8 Xianzhong 2019-08-14  198  	for (i = 0; ; i++) {
34e715848907c8 Xianzhong 2019-08-14  199  		port = of_parse_phandle(dev->of_node, "ports", i);
34e715848907c8 Xianzhong 2019-08-14  200  		if (!port)
34e715848907c8 Xianzhong 2019-08-14  201  			break;
34e715848907c8 Xianzhong 2019-08-14  202  
34e715848907c8 Xianzhong 2019-08-14  203  		parent = of_get_parent(port);
34e715848907c8 Xianzhong 2019-08-14  204  
34e715848907c8 Xianzhong 2019-08-14  205  		for (j = 0; j < num_dpu; j++) {
34e715848907c8 Xianzhong 2019-08-14  206  			if (dpu[j] == parent) {
34e715848907c8 Xianzhong 2019-08-14  207  				found = true;
34e715848907c8 Xianzhong 2019-08-14  208  				break;
34e715848907c8 Xianzhong 2019-08-14  209  			}
34e715848907c8 Xianzhong 2019-08-14  210  		}
34e715848907c8 Xianzhong 2019-08-14  211  
34e715848907c8 Xianzhong 2019-08-14  212  		if (found) {
34e715848907c8 Xianzhong 2019-08-14  213  			found = false;
34e715848907c8 Xianzhong 2019-08-14  214  		} else {
34e715848907c8 Xianzhong 2019-08-14  215  			if (num_dpu >= ARRAY_SIZE(dpu)) {
34e715848907c8 Xianzhong 2019-08-14 @216  				dev_err(dev, "The number of found dpu is greater than max [%ld].\n",
34e715848907c8 Xianzhong 2019-08-14  217  					ARRAY_SIZE(dpu));
34e715848907c8 Xianzhong 2019-08-14  218  				of_node_put(parent);
34e715848907c8 Xianzhong 2019-08-14  219  				of_node_put(port);
34e715848907c8 Xianzhong 2019-08-14  220  				break;
34e715848907c8 Xianzhong 2019-08-14  221  			}
34e715848907c8 Xianzhong 2019-08-14  222  
34e715848907c8 Xianzhong 2019-08-14  223  			dpu[num_dpu] = parent;
34e715848907c8 Xianzhong 2019-08-14  224  			num_dpu++;
34e715848907c8 Xianzhong 2019-08-14  225  
34e715848907c8 Xianzhong 2019-08-14  226  			component_match_add(dev, matchptr, compare_of, parent);
34e715848907c8 Xianzhong 2019-08-14  227  		}
34e715848907c8 Xianzhong 2019-08-14  228  
34e715848907c8 Xianzhong 2019-08-14  229  		of_node_put(parent);
34e715848907c8 Xianzhong 2019-08-14  230  		of_node_put(port);
34e715848907c8 Xianzhong 2019-08-14  231  	}
34e715848907c8 Xianzhong 2019-08-14  232  }
34e715848907c8 Xianzhong 2019-08-14  233  

:::::: The code at line 216 was first introduced by commit
:::::: 34e715848907c8fa32b6241536decb8d4d23a6eb MLK-15321-4 drm/imx: core: Add bliteng as component of imx-drm

:::::: TO: Xianzhong <xianzhong.li@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
