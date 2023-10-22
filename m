Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37714101C0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 12:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MqOYduYo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697978038; x=1729514038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u9iyuQvXRkIW+HRrXfaMVudwyQPfcd0lzaSyFgpzMkE=;
  b=MqOYduYoDbB/sCQ/tRWY+rpTNPLayAh05AGPflZJ4NqvCC3gEYNhbsa0
   OeBR5TB77RoSvv23UxLyBykvzd8od0RLFBSttHfU0AZbF/iWOMFd2M2Yz
   JFLJGq0YFGIsV0nr8n/kNE3ptszS7gkbh3T1oj+aYP6oPafxXk6o8MWzo
   18JT+lHT8v8NuDanYdwNnmbKxcTco37+pHXdonPvMAG2Klb2XofMfGWjL
   OZWQI0BA4hcG80ZtfZ+W3oAUkDMdvLp1NX/AkvT9pzdJG0ihhzTSbx6sJ
   mQKnzISEfzw/ZXXLqSJPlWlcw6oiaBz363HT3YCS9PUFLu1WLNov2RLUf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="377076304"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="377076304"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 05:33:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="5540262"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Oct 2023 05:32:41 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quXeS-0005xC-32;
	Sun, 22 Oct 2023 12:33:52 +0000
Date: Sun, 22 Oct 2023 20:33:41 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.4-2.3.x-imx 2282/30000]
 drivers/media/platform/mxc/capture/ov5647_mipi.c:1532:27: error:
 'ov5647_get_register' undeclared here (not in a function); did you mean
 'ov5647_get_shutter'?
Message-ID: <202310222049.Ydc8cexW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.4-2.3.x-imx
head:   bcde5677c4cabfef7080ffc2fef17275144a0517
commit: 1e188020fb52fdde34c9782d2189d068f6ef4d28 [2282/30000] Merge branch 'capture/next' into next
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20231022/202310222049.Ydc8cexW-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310222049.Ydc8cexW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310222049.Ydc8cexW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from drivers/media/platform/mxc/capture/ov5647_mipi.c:7:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/xtensa/include/asm/page.h:182:16: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     182 |         ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
         |                ^~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/scatterlist.h:143:9: note: in expansion of macro 'BUG_ON'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |         ^~~~~~
   arch/xtensa/include/asm/page.h:190:33: note: in expansion of macro 'pfn_valid'
     190 | #define virt_addr_valid(kaddr)  pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
         |                                 ^~~~~~~~~
   include/linux/scatterlist.h:143:17: note: in expansion of macro 'virt_addr_valid'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |                 ^~~~~~~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5647_mipi.c: At top level:
>> drivers/media/platform/mxc/capture/ov5647_mipi.c:1532:27: error: 'ov5647_get_register' undeclared here (not in a function); did you mean 'ov5647_get_shutter'?
    1532 |         .g_register     = ov5647_get_register,
         |                           ^~~~~~~~~~~~~~~~~~~
         |                           ov5647_get_shutter
>> drivers/media/platform/mxc/capture/ov5647_mipi.c:1533:27: error: 'ov5647_set_register' undeclared here (not in a function); did you mean 'ov5647_set_shutter'?
    1533 |         .s_register     = ov5647_set_register,
         |                           ^~~~~~~~~~~~~~~~~~~
         |                           ov5647_set_shutter


vim +1532 drivers/media/platform/mxc/capture/ov5647_mipi.c

842bca0c72ed73 Robby Cai 2019-09-27  1528  
842bca0c72ed73 Robby Cai 2019-09-27  1529  static struct v4l2_subdev_core_ops ov5647_subdev_core_ops = {
842bca0c72ed73 Robby Cai 2019-09-27  1530  	.s_power	= ov5647_s_power,
842bca0c72ed73 Robby Cai 2019-09-27  1531  #ifdef CONFIG_VIDEO_ADV_DEBUG
842bca0c72ed73 Robby Cai 2019-09-27 @1532  	.g_register	= ov5647_get_register,
842bca0c72ed73 Robby Cai 2019-09-27 @1533  	.s_register	= ov5647_set_register,
842bca0c72ed73 Robby Cai 2019-09-27  1534  #endif
842bca0c72ed73 Robby Cai 2019-09-27  1535  };
842bca0c72ed73 Robby Cai 2019-09-27  1536  

:::::: The code at line 1532 was first introduced by commit
:::::: 842bca0c72ed7324b3c9b08c9367dcb13a76ca01 media: capture: add mipi camera ov5647 driver

:::::: TO: Robby Cai <robby.cai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
