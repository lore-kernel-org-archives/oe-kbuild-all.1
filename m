Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E351C7B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 06:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675579874; x=1707115874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mdOA6qoLdJFt+4o28+AEbTUpsmiAHcARBptPwMVV66M=;
  b=kWXX8R+aKuzZfgpuC+f9QY1ChAig8g7QYpcZtJHS/Kdf82W3KpirqXsh
   3tiK9doJLHSiEM36QUqQCwR/SfhldrANx0Y1bL3OgrUukBpfOMweRyyZ0
   OZFTSXgs1hTk4D3uoPTtS3b1EKC+cYr//jdfkd9X7HCzzZI+jMeptnus5
   ueZ5j1Ij8XfH0p6YPDdC8i0P5YLc2ei86ovi3A9QW92W0ItwVPGUR5Rjr
   z523wtmWjhU3/RK6MQLW7wIMBLqNXQBNKPWicjLb7QimLsc4+Ja+KN8G9
   xUAkyYf5zYjNMXq2jHMgelfNs0eC+wRhytXbfvpSbK0t7MTpju0i0h2qP
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="330314715"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="330314715"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 22:51:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="790121112"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="790121112"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Feb 2023 22:51:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOYrn-0001o8-0M;
	Sun, 05 Feb 2023 06:51:11 +0000
Date: Sun, 5 Feb 2023 14:50:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 6099/20208]
 drivers/gpu/drm/imx/imx-drm-core.c:264:6: warning: format specifies type
 'long' but the argument has type 'unsigned int'
Message-ID: <202302051437.2N0X6xgJ-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 82b6c17d1b10377f16ba6127e5aaf94fa151fbc6 [6099/20208] Merge remote-tracking branch 'origin/display/lcdif' into display/next
config: hexagon-randconfig-r041-20230205 (https://download.01.org/0day-ci/archive/20230205/202302051437.2N0X6xgJ-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/82b6c17d1b10377f16ba6127e5aaf94fa151fbc6
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 82b6c17d1b10377f16ba6127e5aaf94fa151fbc6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/imx/ drivers/i2c/busses/ drivers/soc/imx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
https://github.com/intel/lkp-tests
