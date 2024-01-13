Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD53F9FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 06:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhyUHk7j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705128879; x=1736664879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Tkj8kbF3pufeJCcTVtxnNKEq1qHzfHb7ivs0UXxfRE=;
  b=hhyUHk7jaaQlPXfxhwXngEIYVpuMEyGi8Kwr7Wqged+hUnoOUGUXWbQZ
   tf8GT7utJLDskHww2e3/Hu+tu5ASpA1NXD8Hzkb0U2hAmHYV87VA1qx/F
   9hQBJRuOCu5DHW/DN71+/34vuZkpZK+4RgYo2mx7Gzy+/yXw9+r3/m+I0
   2Tx7tHm1LXLdyld3ca8M+iXpEEUWTQUwvQx2c412dTGbto4j0UeRSIVtr
   Sv6tuAOEDDUsozS52lpYL8sDGvkRHzs2OCUmYzP8Uqez3Vda0DjoNQNqa
   rTo2cGURVDIQcKNyUASsqadGlkpt44jpPh+fuMOi6c+cjDFNa2BdQLVWe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="20832566"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="20832566"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 22:54:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="853485110"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="853485110"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 12 Jan 2024 22:54:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOXub-000AC2-23;
	Sat, 13 Jan 2024 06:54:33 +0000
Date: Sat, 13 Jan 2024 14:54:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 4770/17888]
 drivers/gpu/drm/imx/imx-drm-core.c:262:6: warning: format specifies type
 'long' but the argument has type 'unsigned int'
Message-ID: <202401131401.yDQANfBo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   32a344619c750cdcbe31bed754adc1b30d362e45
commit: 443f676c4b4b5e0aeff4624f12d444a5083d0136 [4770/17888] Merge remote-tracking branch 'origin/display/lcdif' into display/next
config: i386-buildonly-randconfig-003-20240112 (https://download.01.org/0day-ci/archive/20240113/202401131401.yDQANfBo-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131401.yDQANfBo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131401.yDQANfBo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imx/imx-drm-core.c:262:6: warning: format specifies type 'long' but the argument has type 'unsigned int' [-Wformat]
     261 |                                 dev_err(dev, "The number of found dpu is greater than max [%ld].\n",
         |                                                                                            ~~~
         |                                                                                            %u
     262 |                                         ARRAY_SIZE(dpu));
         |                                         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   include/linux/kernel.h:55:25: note: expanded from macro 'ARRAY_SIZE'
      55 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +262 drivers/gpu/drm/imx/imx-drm-core.c

85b73270bcb9902 Xianzhong 2021-06-09  227  
85b73270bcb9902 Xianzhong 2021-06-09  228  static void add_dpu_bliteng_components(struct device *dev,
85b73270bcb9902 Xianzhong 2021-06-09  229  				       struct component_match **matchptr)
85b73270bcb9902 Xianzhong 2021-06-09  230  {
85b73270bcb9902 Xianzhong 2021-06-09  231  	/*
85b73270bcb9902 Xianzhong 2021-06-09  232  	 * As there may be two dpu bliteng device,
85b73270bcb9902 Xianzhong 2021-06-09  233  	 * so need add something in compare data to distinguish.
85b73270bcb9902 Xianzhong 2021-06-09  234  	 * Use its parent dpu's of_node as the data here.
85b73270bcb9902 Xianzhong 2021-06-09  235  	 */
85b73270bcb9902 Xianzhong 2021-06-09  236  	struct device_node *port, *parent;
85b73270bcb9902 Xianzhong 2021-06-09  237  	/* assume max dpu number is 8 */
85b73270bcb9902 Xianzhong 2021-06-09  238  	struct device_node *dpu[8];
85b73270bcb9902 Xianzhong 2021-06-09  239  	int num_dpu = 0;
85b73270bcb9902 Xianzhong 2021-06-09  240  	int i, j;
85b73270bcb9902 Xianzhong 2021-06-09  241  	bool found = false;
85b73270bcb9902 Xianzhong 2021-06-09  242  
85b73270bcb9902 Xianzhong 2021-06-09  243  	for (i = 0; ; i++) {
85b73270bcb9902 Xianzhong 2021-06-09  244  		port = of_parse_phandle(dev->of_node, "ports", i);
85b73270bcb9902 Xianzhong 2021-06-09  245  		if (!port)
85b73270bcb9902 Xianzhong 2021-06-09  246  			break;
85b73270bcb9902 Xianzhong 2021-06-09  247  
85b73270bcb9902 Xianzhong 2021-06-09  248  		parent = of_get_parent(port);
85b73270bcb9902 Xianzhong 2021-06-09  249  
85b73270bcb9902 Xianzhong 2021-06-09  250  		for (j = 0; j < num_dpu; j++) {
85b73270bcb9902 Xianzhong 2021-06-09  251  			if (dpu[j] == parent) {
85b73270bcb9902 Xianzhong 2021-06-09  252  				found = true;
85b73270bcb9902 Xianzhong 2021-06-09  253  				break;
85b73270bcb9902 Xianzhong 2021-06-09  254  			}
85b73270bcb9902 Xianzhong 2021-06-09  255  		}
85b73270bcb9902 Xianzhong 2021-06-09  256  
85b73270bcb9902 Xianzhong 2021-06-09  257  		if (found) {
85b73270bcb9902 Xianzhong 2021-06-09  258  			found = false;
85b73270bcb9902 Xianzhong 2021-06-09  259  		} else {
85b73270bcb9902 Xianzhong 2021-06-09  260  			if (num_dpu >= ARRAY_SIZE(dpu)) {
85b73270bcb9902 Xianzhong 2021-06-09  261  				dev_err(dev, "The number of found dpu is greater than max [%ld].\n",
85b73270bcb9902 Xianzhong 2021-06-09 @262  					ARRAY_SIZE(dpu));
85b73270bcb9902 Xianzhong 2021-06-09  263  				of_node_put(parent);
85b73270bcb9902 Xianzhong 2021-06-09  264  				of_node_put(port);
85b73270bcb9902 Xianzhong 2021-06-09  265  				break;
85b73270bcb9902 Xianzhong 2021-06-09  266  			}
85b73270bcb9902 Xianzhong 2021-06-09  267  
85b73270bcb9902 Xianzhong 2021-06-09  268  			dpu[num_dpu] = parent;
85b73270bcb9902 Xianzhong 2021-06-09  269  			num_dpu++;
85b73270bcb9902 Xianzhong 2021-06-09  270  
85b73270bcb9902 Xianzhong 2021-06-09  271  			component_match_add(dev, matchptr, compare_of, parent);
85b73270bcb9902 Xianzhong 2021-06-09  272  		}
85b73270bcb9902 Xianzhong 2021-06-09  273  
85b73270bcb9902 Xianzhong 2021-06-09  274  		of_node_put(parent);
85b73270bcb9902 Xianzhong 2021-06-09  275  		of_node_put(port);
85b73270bcb9902 Xianzhong 2021-06-09  276  	}
85b73270bcb9902 Xianzhong 2021-06-09  277  }
85b73270bcb9902 Xianzhong 2021-06-09  278  

:::::: The code at line 262 was first introduced by commit
:::::: 85b73270bcb9902ddb7130783b3b09988d43ede9 MLK-15321-4 drm/imx: core: Add bliteng as component of imx-drm

:::::: TO: Xianzhong <xianzhong.li@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
