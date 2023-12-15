Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABF22DF72
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 13:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kX41SPwQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702648061; x=1734184061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1pRnmwRWIiyqMrBfC1Z7c/Y1VdaY0AE9p2ed9eYwH8k=;
  b=kX41SPwQ1dQpB9sxCtjA4hczReRt8+BQgwdIKEJbqZ/bUG9rA8ZshUoQ
   VZN3QZC7kq9zQxkKXOEpzI9hPRVMNdZC06NWzy/Pe4OwQIZA7UTPNPMcU
   mIC3oOQhGecS+XS4qskJRgRvLYg5uQizoyTGmQCdXghTm01Gu2vpdCtNp
   lDzVDiQxZxC37BEk4Hb74EGrHw7IcxUfGELZmUcZVjAnKTYWBir9xrqjo
   XtCzyl3SPjCr5KKj7bmmrOsK9gq1RWpJiPH4W6Nhcdr3NjLAR2b7xbz/x
   KvjHoMbNWocROgATMUYI6nrlekRmGDHZfdY/HolxCXwajKblNtADlj3lJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="16829023"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="16829023"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 05:47:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="724466015"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="724466015"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Dec 2023 05:47:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rE8XQ-0000GO-2j;
	Fri, 15 Dec 2023 13:47:36 +0000
Date: Fri, 15 Dec 2023 21:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 6099/25021]
 drivers/gpu/drm/imx/imx-drm-core.c:264:6: warning: format specifies type
 'long' but the argument has type 'unsigned int'
Message-ID: <202312152128.ykpPaH0e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3a95b5654979d1c2d61616bf60249ed3a98dcfbc
commit: 82b6c17d1b10377f16ba6127e5aaf94fa151fbc6 [6099/25021] Merge remote-tracking branch 'origin/display/lcdif' into display/next
config: hexagon-randconfig-r013-20230831 (https://download.01.org/0day-ci/archive/20231215/202312152128.ykpPaH0e-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312152128.ykpPaH0e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312152128.ykpPaH0e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imx/imx-drm-core.c:264:6: warning: format specifies type 'long' but the argument has type 'unsigned int' [-Wformat]
                                           ARRAY_SIZE(dpu));
                                           ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   include/linux/kernel.h:44:25: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +264 drivers/gpu/drm/imx/imx-drm-core.c

c8079f00f58de8 Xianzhong 2021-06-09  229  
c8079f00f58de8 Xianzhong 2021-06-09  230  static void add_dpu_bliteng_components(struct device *dev,
c8079f00f58de8 Xianzhong 2021-06-09  231  				       struct component_match **matchptr)
c8079f00f58de8 Xianzhong 2021-06-09  232  {
c8079f00f58de8 Xianzhong 2021-06-09  233  	/*
c8079f00f58de8 Xianzhong 2021-06-09  234  	 * As there may be two dpu bliteng device,
c8079f00f58de8 Xianzhong 2021-06-09  235  	 * so need add something in compare data to distinguish.
c8079f00f58de8 Xianzhong 2021-06-09  236  	 * Use its parent dpu's of_node as the data here.
c8079f00f58de8 Xianzhong 2021-06-09  237  	 */
c8079f00f58de8 Xianzhong 2021-06-09  238  	struct device_node *port, *parent;
c8079f00f58de8 Xianzhong 2021-06-09  239  	/* assume max dpu number is 8 */
c8079f00f58de8 Xianzhong 2021-06-09  240  	struct device_node *dpu[8];
c8079f00f58de8 Xianzhong 2021-06-09  241  	int num_dpu = 0;
c8079f00f58de8 Xianzhong 2021-06-09  242  	int i, j;
c8079f00f58de8 Xianzhong 2021-06-09  243  	bool found = false;
c8079f00f58de8 Xianzhong 2021-06-09  244  
c8079f00f58de8 Xianzhong 2021-06-09  245  	for (i = 0; ; i++) {
c8079f00f58de8 Xianzhong 2021-06-09  246  		port = of_parse_phandle(dev->of_node, "ports", i);
c8079f00f58de8 Xianzhong 2021-06-09  247  		if (!port)
c8079f00f58de8 Xianzhong 2021-06-09  248  			break;
c8079f00f58de8 Xianzhong 2021-06-09  249  
c8079f00f58de8 Xianzhong 2021-06-09  250  		parent = of_get_parent(port);
c8079f00f58de8 Xianzhong 2021-06-09  251  
c8079f00f58de8 Xianzhong 2021-06-09  252  		for (j = 0; j < num_dpu; j++) {
c8079f00f58de8 Xianzhong 2021-06-09  253  			if (dpu[j] == parent) {
c8079f00f58de8 Xianzhong 2021-06-09  254  				found = true;
c8079f00f58de8 Xianzhong 2021-06-09  255  				break;
c8079f00f58de8 Xianzhong 2021-06-09  256  			}
c8079f00f58de8 Xianzhong 2021-06-09  257  		}
c8079f00f58de8 Xianzhong 2021-06-09  258  
c8079f00f58de8 Xianzhong 2021-06-09  259  		if (found) {
c8079f00f58de8 Xianzhong 2021-06-09  260  			found = false;
c8079f00f58de8 Xianzhong 2021-06-09  261  		} else {
c8079f00f58de8 Xianzhong 2021-06-09  262  			if (num_dpu >= ARRAY_SIZE(dpu)) {
c8079f00f58de8 Xianzhong 2021-06-09  263  				dev_err(dev, "The number of found dpu is greater than max [%ld].\n",
c8079f00f58de8 Xianzhong 2021-06-09 @264  					ARRAY_SIZE(dpu));
c8079f00f58de8 Xianzhong 2021-06-09  265  				of_node_put(parent);
c8079f00f58de8 Xianzhong 2021-06-09  266  				of_node_put(port);
c8079f00f58de8 Xianzhong 2021-06-09  267  				break;
c8079f00f58de8 Xianzhong 2021-06-09  268  			}
c8079f00f58de8 Xianzhong 2021-06-09  269  
c8079f00f58de8 Xianzhong 2021-06-09  270  			dpu[num_dpu] = parent;
c8079f00f58de8 Xianzhong 2021-06-09  271  			num_dpu++;
c8079f00f58de8 Xianzhong 2021-06-09  272  
c8079f00f58de8 Xianzhong 2021-06-09  273  			component_match_add(dev, matchptr, compare_of, parent);
c8079f00f58de8 Xianzhong 2021-06-09  274  		}
c8079f00f58de8 Xianzhong 2021-06-09  275  
c8079f00f58de8 Xianzhong 2021-06-09  276  		of_node_put(parent);
c8079f00f58de8 Xianzhong 2021-06-09  277  		of_node_put(port);
c8079f00f58de8 Xianzhong 2021-06-09  278  	}
c8079f00f58de8 Xianzhong 2021-06-09  279  }
c8079f00f58de8 Xianzhong 2021-06-09  280  

:::::: The code at line 264 was first introduced by commit
:::::: c8079f00f58de86abf3ab885ed6337601923e32d MLK-15321-4 drm/imx: core: Add bliteng as component of imx-drm

:::::: TO: Xianzhong <xianzhong.li@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
