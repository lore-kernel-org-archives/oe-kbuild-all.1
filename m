Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95E217C6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 01:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688088745; x=1719624745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nqWAMjHqsOB5tSJ/dw40LSGW5zlk4uO58dNb3W60zUw=;
  b=XoprUwXPSN2WUcysQqxACYraw6y/SOnJj8Go1OUg7DpCxGQeKJIFSKIM
   fkrRHrqJ7DfS4w5rQ+4eA/9JU8BMSf5JSBvrzYkZiTIqHNeeqkGuK502f
   U3VZNI6Z3UGRuRTzEEqt81saVPmbmjQHCKo7cSdddTriOMmHKGynFcpAY
   ZG8z196v37hWphZAdGMMQ/iQ6QQvPYepeOJ/XDsqA20GSaF1X2lpUlpSU
   nn40vWlydUcFnOEtyRc13KKVE9utBEh+VcbQzZM3M53HPMI59bcXIHR99
   vXsYq5uidda2WjTnB+yrBmHiPzD9MLKRyTxpcusw6qi40/dkklgcaHsRD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="362318312"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="362318312"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 18:32:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="862132649"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="862132649"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2023 18:32:07 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qF2zW-000Ea6-1K;
	Fri, 30 Jun 2023 01:32:06 +0000
Date: Fri, 30 Jun 2023 09:31:39 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.4-rc1-just-ttbr0-split 23/26]
 net/ethtool/ioctl.c:2537:1: warning: the frame size of 1120 bytes is larger
 than 1024 bytes
Message-ID: <202306300924.KI4GiN9g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.4-rc1-just-ttbr0-split
head:   d0cf2fe7497259ee8a7308da99a8cbafaab5e5b5
commit: f568e0b0cf6225d4d5a6fc568d94e7f64f24b9d6 [23/26] ARM: kernel/userspace address separation
config: arm-randconfig-r046-20230630 (https://download.01.org/0day-ci/archive/20230630/202306300924.KI4GiN9g-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300924.KI4GiN9g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300924.KI4GiN9g-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ethtool/ioctl.c: In function 'ethtool_get_per_queue_coalesce':
>> net/ethtool/ioctl.c:2537:1: warning: the frame size of 1120 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    2537 | }
         | ^
--
>> drivers/net/usb/r8152.c:299: warning: "CR_TE" redefined
     299 | #define CR_TE                   0x04
         | 
   In file included from arch/arm/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/net/net_namespace.h:43,
                    from include/linux/netdevice.h:38,
                    from drivers/net/usb/r8152.c:9:
   arch/arm/include/asm/cp15.h:41: note: this is the location of the previous definition
      41 | #define CR_TE   (1 << 30)       /* Thumb exception enable               */
         | 


vim +2537 net/ethtool/ioctl.c

f0db9b07341584 net/core/ethtool.c Govindarajulu Varadarajan 2014-09-03  2507  
3499e87ea0413e net/core/ethtool.c Arnd Bergmann             2019-03-07  2508  static noinline_for_stack int
3499e87ea0413e net/core/ethtool.c Arnd Bergmann             2019-03-07  2509  ethtool_get_per_queue_coalesce(struct net_device *dev,
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2510  			       void __user *useraddr,
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2511  			       struct ethtool_per_queue_op *per_queue_opt)
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2512  {
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2513  	u32 bit;
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2514  	int ret;
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2515  	DECLARE_BITMAP(queue_mask, MAX_NUM_QUEUE);
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2516  
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2517  	if (!dev->ethtool_ops->get_per_queue_coalesce)
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2518  		return -EOPNOTSUPP;
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2519  
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2520  	useraddr += sizeof(*per_queue_opt);
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2521  
3aa56885e51683 net/core/ethtool.c Yury Norov                2018-02-06  2522  	bitmap_from_arr32(queue_mask, per_queue_opt->queue_mask,
3aa56885e51683 net/core/ethtool.c Yury Norov                2018-02-06  2523  			  MAX_NUM_QUEUE);
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2524  
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2525  	for_each_set_bit(bit, queue_mask, MAX_NUM_QUEUE) {
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2526  		struct ethtool_coalesce coalesce = { .cmd = ETHTOOL_GCOALESCE };
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2527  
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2528  		ret = dev->ethtool_ops->get_per_queue_coalesce(dev, bit, &coalesce);
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2529  		if (ret != 0)
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2530  			return ret;
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2531  		if (copy_to_user(useraddr, &coalesce, sizeof(coalesce)))
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2532  			return -EFAULT;
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2533  		useraddr += sizeof(coalesce);
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2534  	}
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2535  
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2536  	return 0;
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19 @2537  }
421797b1aa363c net/core/ethtool.c Kan Liang                 2016-02-19  2538  

:::::: The code at line 2537 was first introduced by commit
:::::: 421797b1aa363cb897f29f7d365e068dc9d9db81 net/ethtool: support get coalesce per queue

:::::: TO: Kan Liang <kan.liang@intel.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
