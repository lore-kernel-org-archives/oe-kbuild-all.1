Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AD2EBF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 05:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJKcSXBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700285737; x=1731821737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4PTE22XuUBmN1yOTRez9gP6+nBfQF/LMdyRYZF1JMmw=;
  b=RJKcSXBgDdkuj6Wk1JKt3Y6g23vNEwrCUjizGBUd9ZK5nB/R5a4tk5uf
   s8vbra0oQCMJVv6fXocd27ZUkwWvQUWcAmVEppmVk14fLumFB9yDI71iz
   f7E39TYYphezA47AK/8wmZ4SsNyRCL6no7cNmd2OI+cOVN1K64QU1LDPa
   q30g3RvJCWqS4Au4I/jlobjZYWi366AfFTOTqIlfL4H+ENV9y8jzsmvur
   ftC8p9nq0iXU8Odo7BVzbzEMHex13tqYVkMe5N+Zsl8Cvj50LGeLH4NCH
   m5KAmkqbJw1jQQV+ivL24BSTFs24ouJKkhm+dECvcfwW59Pm/UqA8aAJp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="370756886"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="370756886"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 21:35:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="715732358"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="715732358"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Nov 2023 21:35:34 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4DzQ-0003Yt-0S;
	Sat, 18 Nov 2023 05:35:32 +0000
Date: Sat, 18 Nov 2023 13:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4851/15770]
 drivers/media/platform/mxc/output/mxc_vout.c:292:9: error: unknown type name
 'mm_segment_t'
Message-ID: <202311181328.QHBzi5Gi-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   742924a05c8a6349d6d1fe67010a3c5ed54df884
commit: 77225c634e06fdb5ae7fcd3d52cb5dd7d2996acb [4851/15770] Merge branch 'mxc/next' into next
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231118/202311181328.QHBzi5Gi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181328.QHBzi5Gi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181328.QHBzi5Gi-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
