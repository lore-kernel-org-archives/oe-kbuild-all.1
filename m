Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25231C11
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Apr 2023 13:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681650111; x=1713186111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IkXivS2/zEYbBDNCNhH7+hTNfHv6fhphOhu2Vtk80xw=;
  b=Ur7tT8oHr+2IbstgHyNY317wsXmY4BrHaG/fxLLCXOUUouLOCAYbnJQ0
   E1edV7+41g5sId7LMCLJpmRwUSUqborcWYjE3KjZLBTb+8SUPs0f4cDwZ
   4d49miYF3O3ulrlKv9XIumUJJ1ZWzoR0Gl/NGcA/xihbIhYbIHrxvwx/A
   FkPQi/g2AWKsPiYWbgoOu51yHFl96ndLuOLVqEfpulQ67L7dTFyiOwc50
   jIcVIfETIi3Vom4bOnWqle5+4gao2Ys9CCUivHTDTQvV1gDCcYzUPmWK5
   hEIe4Cpc6Pk1ZcIjwVjHDcuDMPlMpHNB4U8UVOWR8ZnevLTiWjMHu+3Im
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="325075798"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="325075798"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 06:01:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="814495184"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="814495184"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Apr 2023 06:01:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1po20B-000bgV-1k;
	Sun, 16 Apr 2023 13:01:07 +0000
Date: Sun, 16 Apr 2023 21:00:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 4851/9838]
 drivers/media/platform/mxc/output/mxc_vout.c:292:9: error: unknown type name
 'mm_segment_t'
Message-ID: <202304162019.RZ2OQdGR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: 77225c634e06fdb5ae7fcd3d52cb5dd7d2996acb [4851/9838] Merge branch 'mxc/next' into next
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230416/202304162019.RZ2OQdGR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/77225c634e06fdb5ae7fcd3d52cb5dd7d2996acb
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 77225c634e06fdb5ae7fcd3d52cb5dd7d2996acb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304162019.RZ2OQdGR-lkp@intel.com/

Note: the freescale-fslc/pr/629 HEAD d1033c2e51746dfdb7179c82e38b03ba7de39c63 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

      58 |         printk(level "%s: " fmt, (dev)->name , ## arg)
         |         ^~~~~~
   include/media/v4l2-common.h:74:25: note: in expansion of macro 'v4l2_printk'
      74 |                         v4l2_printk(KERN_DEBUG, dev, fmt , ## arg);     \
         |                         ^~~~~~~~~~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/media/v4l2-common.h:74:37: note: in expansion of macro 'KERN_DEBUG'
      74 |                         v4l2_printk(KERN_DEBUG, dev, fmt , ## arg);     \
         |                                     ^~~~~~~~~~
   drivers/media/platform/mxc/output/mxc_vout.c:268:9: note: in expansion of macro 'v4l2_dbg'
     268 |         v4l2_dbg(1, debug, vout->vfd->v4l2_dev,
         |         ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'dma_addr_t' {aka 'long long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/media/v4l2-common.h:58:9: note: in expansion of macro 'printk'
      58 |         printk(level "%s: " fmt, (dev)->name , ## arg)
         |         ^~~~~~
   include/media/v4l2-common.h:74:25: note: in expansion of macro 'v4l2_printk'
      74 |                         v4l2_printk(KERN_DEBUG, dev, fmt , ## arg);     \
         |                         ^~~~~~~~~~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/media/v4l2-common.h:74:37: note: in expansion of macro 'KERN_DEBUG'
      74 |                         v4l2_printk(KERN_DEBUG, dev, fmt , ## arg);     \
         |                                     ^~~~~~~~~~
   drivers/media/platform/mxc/output/mxc_vout.c:268:9: note: in expansion of macro 'v4l2_dbg'
     268 |         v4l2_dbg(1, debug, vout->vfd->v4l2_dev,
         |         ^~~~~~~~
   drivers/media/platform/mxc/output/mxc_vout.c: In function 'alloc_dma_buf':
   include/linux/kern_levels.h:5:25: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/media/v4l2-common.h:58:9: note: in expansion of macro 'printk'
      58 |         printk(level "%s: " fmt, (dev)->name , ## arg)
         |         ^~~~~~
   include/media/v4l2-common.h:61:9: note: in expansion of macro 'v4l2_printk'
      61 |         v4l2_printk(KERN_ERR, dev, fmt , ## arg)
         |         ^~~~~~~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/media/v4l2-common.h:61:21: note: in expansion of macro 'KERN_ERR'
      61 |         v4l2_printk(KERN_ERR, dev, fmt , ## arg)
         |                     ^~~~~~~~
   drivers/media/platform/mxc/output/mxc_vout.c:280:17: note: in expansion of macro 'v4l2_err'
     280 |                 v4l2_err(vout->vfd->v4l2_dev,
         |                 ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/media/v4l2-common.h:58:9: note: in expansion of macro 'printk'
      58 |         printk(level "%s: " fmt, (dev)->name , ## arg)
         |         ^~~~~~
   include/media/v4l2-common.h:74:25: note: in expansion of macro 'v4l2_printk'
      74 |                         v4l2_printk(KERN_DEBUG, dev, fmt , ## arg);     \
         |                         ^~~~~~~~~~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/media/v4l2-common.h:74:37: note: in expansion of macro 'KERN_DEBUG'
      74 |                         v4l2_printk(KERN_DEBUG, dev, fmt , ## arg);     \
         |                                     ^~~~~~~~~~
   drivers/media/platform/mxc/output/mxc_vout.c:284:9: note: in expansion of macro 'v4l2_dbg'
     284 |         v4l2_dbg(1, debug, vout->vfd->v4l2_dev,
         |         ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'dma_addr_t' {aka 'long long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/media/v4l2-common.h:58:9: note: in expansion of macro 'printk'
      58 |         printk(level "%s: " fmt, (dev)->name , ## arg)
         |         ^~~~~~
   include/media/v4l2-common.h:74:25: note: in expansion of macro 'v4l2_printk'
      74 |                         v4l2_printk(KERN_DEBUG, dev, fmt , ## arg);     \
         |                         ^~~~~~~~~~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/media/v4l2-common.h:74:37: note: in expansion of macro 'KERN_DEBUG'
      74 |                         v4l2_printk(KERN_DEBUG, dev, fmt , ## arg);     \
         |                                     ^~~~~~~~~~
   drivers/media/platform/mxc/output/mxc_vout.c:284:9: note: in expansion of macro 'v4l2_dbg'
     284 |         v4l2_dbg(1, debug, vout->vfd->v4l2_dev,
         |         ^~~~~~~~
   drivers/media/platform/mxc/output/mxc_vout.c: In function 'get_ipu_channel':
>> drivers/media/platform/mxc/output/mxc_vout.c:292:9: error: unknown type name 'mm_segment_t'
     292 |         mm_segment_t old_fs;
         |         ^~~~~~~~~~~~
>> drivers/media/platform/mxc/output/mxc_vout.c:295:26: error: implicit declaration of function 'get_fs'; did you mean 'sget_fc'? [-Werror=implicit-function-declaration]
     295 |                 old_fs = get_fs();
         |                          ^~~~~~
         |                          sget_fc
>> drivers/media/platform/mxc/output/mxc_vout.c:296:17: error: implicit declaration of function 'set_fs'; did you mean 'sget_fc'? [-Werror=implicit-function-declaration]
     296 |                 set_fs(KERNEL_DS);
         |                 ^~~~~~
         |                 sget_fc
>> drivers/media/platform/mxc/output/mxc_vout.c:296:24: error: 'KERNEL_DS' undeclared (first use in this function); did you mean 'KERNFS_NS'?
     296 |                 set_fs(KERNEL_DS);
         |                        ^~~~~~~~~
         |                        KERNFS_NS
   drivers/media/platform/mxc/output/mxc_vout.c:296:24: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/platform/mxc/output/mxc_vout.c: In function 'get_ipu_fmt':
   drivers/media/platform/mxc/output/mxc_vout.c:307:9: error: unknown type name 'mm_segment_t'
     307 |         mm_segment_t old_fs;
         |         ^~~~~~~~~~~~
   drivers/media/platform/mxc/output/mxc_vout.c:312:24: error: 'KERNEL_DS' undeclared (first use in this function); did you mean 'KERNFS_NS'?
     312 |                 set_fs(KERNEL_DS);
         |                        ^~~~~~~~~
         |                        KERNFS_NS
   drivers/media/platform/mxc/output/mxc_vout.c: In function 'set_window_position':
   drivers/media/platform/mxc/output/mxc_vout.c:1797:9: error: unknown type name 'mm_segment_t'
    1797 |         mm_segment_t old_fs;
         |         ^~~~~~~~~~~~
   drivers/media/platform/mxc/output/mxc_vout.c:1802:24: error: 'KERNEL_DS' undeclared (first use in this function); did you mean 'KERNFS_NS'?
    1802 |                 set_fs(KERNEL_DS);
         |                        ^~~~~~~~~
         |                        KERNFS_NS
   drivers/media/platform/mxc/output/mxc_vout.c: In function 'wait_for_vsync':
   drivers/media/platform/mxc/output/mxc_vout.c:1963:9: error: unknown type name 'mm_segment_t'
    1963 |         mm_segment_t old_fs;
         |         ^~~~~~~~~~~~
   drivers/media/platform/mxc/output/mxc_vout.c:1967:24: error: 'KERNEL_DS' undeclared (first use in this function); did you mean 'KERNFS_NS'?
    1967 |                 set_fs(KERNEL_DS);
         |                        ^~~~~~~~~
         |                        KERNFS_NS
   cc1: some warnings being treated as errors


vim +/mm_segment_t +292 drivers/media/platform/mxc/output/mxc_vout.c

5d9bff325f48dc Liu Ying 2019-09-29  276  
5d9bff325f48dc Liu Ying 2019-09-29  277  	buf->vaddr = dma_alloc_coherent(vout->vbq.dev, buf->size, &buf->paddr,
5d9bff325f48dc Liu Ying 2019-09-29  278  						GFP_DMA | GFP_KERNEL);
5d9bff325f48dc Liu Ying 2019-09-29  279  	if (!buf->vaddr) {
5d9bff325f48dc Liu Ying 2019-09-29  280  		v4l2_err(vout->vfd->v4l2_dev,
5d9bff325f48dc Liu Ying 2019-09-29  281  			"cannot get dma buf size:0x%x\n", buf->size);
5d9bff325f48dc Liu Ying 2019-09-29  282  		return -ENOMEM;
5d9bff325f48dc Liu Ying 2019-09-29  283  	}
5d9bff325f48dc Liu Ying 2019-09-29 @284  	v4l2_dbg(1, debug, vout->vfd->v4l2_dev,
5d9bff325f48dc Liu Ying 2019-09-29  285  		"alloc dma buf size:0x%x, paddr:0x%x\n", buf->size, buf->paddr);
5d9bff325f48dc Liu Ying 2019-09-29  286  	return 0;
5d9bff325f48dc Liu Ying 2019-09-29  287  }
5d9bff325f48dc Liu Ying 2019-09-29  288  
5d9bff325f48dc Liu Ying 2019-09-29  289  static ipu_channel_t get_ipu_channel(struct fb_info *fbi)
5d9bff325f48dc Liu Ying 2019-09-29  290  {
5d9bff325f48dc Liu Ying 2019-09-29  291  	ipu_channel_t ipu_ch = CHAN_NONE;
5d9bff325f48dc Liu Ying 2019-09-29 @292  	mm_segment_t old_fs;
5d9bff325f48dc Liu Ying 2019-09-29  293  
5d9bff325f48dc Liu Ying 2019-09-29  294  	if (fbi->fbops->fb_ioctl) {
5d9bff325f48dc Liu Ying 2019-09-29 @295  		old_fs = get_fs();
5d9bff325f48dc Liu Ying 2019-09-29 @296  		set_fs(KERNEL_DS);
5d9bff325f48dc Liu Ying 2019-09-29  297  		fbi->fbops->fb_ioctl(fbi, MXCFB_GET_FB_IPU_CHAN,
5d9bff325f48dc Liu Ying 2019-09-29  298  				(unsigned long)&ipu_ch);
5d9bff325f48dc Liu Ying 2019-09-29  299  		set_fs(old_fs);
5d9bff325f48dc Liu Ying 2019-09-29  300  	}
5d9bff325f48dc Liu Ying 2019-09-29  301  
5d9bff325f48dc Liu Ying 2019-09-29  302  	return ipu_ch;
5d9bff325f48dc Liu Ying 2019-09-29  303  }
5d9bff325f48dc Liu Ying 2019-09-29  304  

:::::: The code at line 292 was first introduced by commit
:::::: 5d9bff325f48dc4a03785772f28c4262008783a4 media: platform: mxc: output: Forward IPUv3 V4L2 output driver from imx_4.19.y

:::::: TO: Liu Ying <victor.liu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
