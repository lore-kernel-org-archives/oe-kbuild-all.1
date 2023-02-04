Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B702D525
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 18:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675534197; x=1707070197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mBRaJLT1z39l1Lj25zkm2B6QBj6uvi3+hZkYGu29HiE=;
  b=c4cL/SLpdv3B8OSX4XCLqQjIe/WSN6crTkLyoz61/TPXvfVcpotXkpKU
   sHpOLgYx/OP+fSSnUIOb/EUkeQ6kGRaSgKQUSuM+Qj8a9uSkJ4GiHFwEN
   IZ0KcUjOgBnhPCLhT5oy4h5mN9wakfsWSwHZS4OcUF84pWcb5VTD1/gPF
   SmEFpza8xU+pLMz+M2MBR/ZEy/nz4bZUuuOWhUx5VZXeRU2cGXn9l3zm1
   EsfLxFyGQNdFYAEzQfV6Yb6geCLvg8ga5O1LL9qn+jwJcX4e7yuiod3oB
   WdLgC7br0UTazW5okfpE3PqEn2YwjjR27gNFKHqekPckk99gMoU3/fMpX
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="312628766"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="312628766"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 10:09:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="666071719"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="666071719"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Feb 2023 10:09:53 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOMz2-0001TY-2l;
	Sat, 04 Feb 2023 18:09:52 +0000
Date: Sun, 5 Feb 2023 02:09:33 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 6099/20208]
 drivers/gpu/drm/imx/imx-drm-core.c:263:46: warning: format '%ld' expects
 argument of type 'long int', but argument 3 has type 'unsigned int'
Message-ID: <202302050227.hFQGcqxG-lkp@intel.com>
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
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230205/202302050227.hFQGcqxG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/82b6c17d1b10377f16ba6127e5aaf94fa151fbc6
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 82b6c17d1b10377f16ba6127e5aaf94fa151fbc6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/firmware/imx/ drivers/gpu/drm/imx/ drivers/net/ethernet/freescale/fman/ drivers/pwm/ drivers/staging/ drivers/tty/serial/ net/ sound/soc/sof/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/gpu/drm/imx/imx-drm-core.c:9:
   drivers/gpu/drm/imx/imx-drm-core.c: In function 'add_dpu_bliteng_components':
>> drivers/gpu/drm/imx/imx-drm-core.c:263:46: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'unsigned int' [-Wformat=]
     263 |                                 dev_err(dev, "The number of found dpu is greater than max [%ld].\n",
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/gpu/drm/imx/imx-drm-core.c:263:33: note: in expansion of macro 'dev_err'
     263 |                                 dev_err(dev, "The number of found dpu is greater than max [%ld].\n",
         |                                 ^~~~~~~
   drivers/gpu/drm/imx/imx-drm-core.c:263:94: note: format string is defined here
     263 |                                 dev_err(dev, "The number of found dpu is greater than max [%ld].\n",
         |                                                                                            ~~^
         |                                                                                              |
         |                                                                                              long int
         |                                                                                            %d


vim +263 drivers/gpu/drm/imx/imx-drm-core.c

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
c8079f00f58de8 Xianzhong 2021-06-09 @263  				dev_err(dev, "The number of found dpu is greater than max [%ld].\n",
c8079f00f58de8 Xianzhong 2021-06-09  264  					ARRAY_SIZE(dpu));
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

:::::: The code at line 263 was first introduced by commit
:::::: c8079f00f58de86abf3ab885ed6337601923e32d MLK-15321-4 drm/imx: core: Add bliteng as component of imx-drm

:::::: TO: Xianzhong <xianzhong.li@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
