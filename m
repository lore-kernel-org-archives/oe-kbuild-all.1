Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A003D8C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 13:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678801366; x=1710337366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xhdqOBgm+eT6EU2uj0PPSEDkI+5sG6KNz51gn81GQAc=;
  b=f307msAVegVLUfEFn8V0G3sB5O5/ljjMOIPOCrq3RNV+YKfKosQDTqFX
   c0Ma52s8azBNnimPCZZy9hqRBza3xsr6NFhjivsqGa70UcUVtU4gR8VdC
   Y6QgjTZauckfOnYdut/PyncDh+Yb0rmglwVI6WPSTZRFJGXZgGLpgmbgr
   AC2bmzhybjUF3WahLd4pZ9gN3+le/tt5g3E4ISN3/fe0ZZTUfvKNszWL6
   bpYGQML0Qd/IohCeV650u4GAm7ipnTtBFmNh8nn2QJBdQD5mX6YFJ7jrW
   N106rgRHGcAzlWQSg5qtXWDyTBTCDgr/dwamVirdb0mCwDFazbt7Rrgzq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="317815128"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="317815128"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 06:42:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="672341802"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="672341802"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Mar 2023 06:42:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc4vG-0006x1-0V;
	Tue, 14 Mar 2023 13:42:38 +0000
Date: Tue, 14 Mar 2023 21:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split 30/30]
 net/ethtool/ioctl.c:2536:1: warning: the frame size of 1120 bytes is larger
 than 1024 bytes
Message-ID: <202303142100.KIUtk9qg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
head:   8c7a9ba4d5ab142c56f970395de2c419dbcd0a72
commit: 8c7a9ba4d5ab142c56f970395de2c419dbcd0a72 [30/30] switch PGD/TTBR0 in <asm/uaccess-asm.h>
config: arm-randconfig-r046-20230313 (https://download.01.org/0day-ci/archive/20230314/202303142100.KIUtk9qg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=8c7a9ba4d5ab142c56f970395de2c419dbcd0a72
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
        git checkout 8c7a9ba4d5ab142c56f970395de2c419dbcd0a72
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpio/ fs/ net/ethtool/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303142100.KIUtk9qg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ethtool/ioctl.c: In function 'ethtool_get_per_queue_coalesce':
>> net/ethtool/ioctl.c:2536:1: warning: the frame size of 1120 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    2536 | }
         | ^
--
   drivers/gpio/gpiolib-cdev.c: In function 'linereq_create':
>> drivers/gpio/gpiolib-cdev.c:1768:1: warning: the frame size of 1136 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    1768 | }
         | ^


vim +2536 net/ethtool/ioctl.c

f0db9b07341584 net/core/ethtool.c Govindarajulu Varadarajan 2014-09-03  2506  
3499e87ea0413e net/core/ethtool.c Arnd Bergmann             2019-03-07  2507  static noinline_for_stack int
3499e87ea0413e net/core/ethtool.c Arnd Bergmann             2019-03-07  2508  ethtool_get_per_queue_coalesce(struct net_device *dev,
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2509  			       void __user *useraddr,
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2510  			       struct ethtool_per_queue_op *per_queue_opt)
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2511  {
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2512  	u32 bit;
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2513  	int ret;
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2514  	DECLARE_BITMAP(queue_mask, MAX_NUM_QUEUE);
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2515  
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2516  	if (!dev->ethtool_ops->get_per_queue_coalesce)
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2517  		return -EOPNOTSUPP;
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2518  
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2519  	useraddr += sizeof(*per_queue_opt);
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2520  
3aa56885e51683 net/core/ethtool.c Yury Norov                2018-02-06  2521  	bitmap_from_arr32(queue_mask, per_queue_opt->queue_mask,
3aa56885e51683 net/core/ethtool.c Yury Norov                2018-02-06  2522  			  MAX_NUM_QUEUE);
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2523  
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2524  	for_each_set_bit(bit, queue_mask, MAX_NUM_QUEUE) {
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2525  		struct ethtool_coalesce coalesce = { .cmd = ETHTOOL_GCOALESCE };
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2526  
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2527  		ret = dev->ethtool_ops->get_per_queue_coalesce(dev, bit, &coalesce);
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2528  		if (ret != 0)
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2529  			return ret;
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2530  		if (copy_to_user(useraddr, &coalesce, sizeof(coalesce)))
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2531  			return -EFAULT;
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2532  		useraddr += sizeof(coalesce);
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2533  	}
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2534  
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2535  	return 0;
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19 @2536  }
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2537  

:::::: The code at line 2536 was first introduced by commit
:::::: 421797b1aa363cb897f29f7d365e068dc9d9db81 net/ethtool: support get coalesce per queue

:::::: TO: Kan Liang <kan.liang@intel.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
