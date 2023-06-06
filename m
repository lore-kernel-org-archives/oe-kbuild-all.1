Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792B612B9F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 11:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686050061; x=1717586061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EaVTgfPjM1qo0C2Az+g6tqM7rH7+KpZVZmHsnU0I1P8=;
  b=cI1jAY9Tt0XmRL4Pzto4TPjaf1Nh6pVig+VJNJK/NRB6MIzyHH6NXCDb
   F9nTR7k/EH2+sC0rvUqbKeNeIouKtMTQBpRVLlADTplvfJz9r10FXeZNV
   GObKviYiyVlkmzA9o+TaEcf7/t7+QXmzJzP5R1C5jNTFR104fu45Hah93
   8ZlMA87K+ScfV757kAqeyQOGuTYzKNgaXPS0aNJrIt9DFWyz7X9NG7JnN
   NxXjcT4iVw+RM8Q7xVVrhG2VvQfx1eO0OS6fcYAaEgaN2HbZuxfWRSLIQ
   KakeeCEfDmk0br1aWf8LqUywBFZVio1v2l0r0iZFTRMfmp4C6TPE2R0FQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="355491924"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="355491924"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 04:14:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="1039139116"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="1039139116"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Jun 2023 04:14:19 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6Udm-0005AJ-1m;
	Tue, 06 Jun 2023 11:14:18 +0000
Date: Tue, 6 Jun 2023 19:13:45 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: kernel/irq/msi.c:585:19: error: invalid use of incomplete typedef
 'msi_alloc_info_t' {aka 'struct irq_alloc_info'}
Message-ID: <202306061930.E9RPdG8J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Frank,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f8dba31b0a826e691949cd4fdfa5c30defaac8c5
commit: 70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e irqchip: Add IMX MU MSI controller driver
date:   8 months ago
config: i386-buildonly-randconfig-r002-20230606 (https://download.01.org/0day-ci/archive/20230606/202306061930.E9RPdG8J-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/base/ drivers/input/touchscreen/ kernel/irq/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061930.E9RPdG8J-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/irq/msi.c: In function 'msi_domain_ops_get_hwirq':
>> kernel/irq/msi.c:585:19: error: invalid use of incomplete typedef 'msi_alloc_info_t' {aka 'struct irq_alloc_info'}
     585 |         return arg->hwirq;
         |                   ^~
   In file included from arch/x86/include/asm/string.h:3,
                    from include/linux/string.h:20,
                    from arch/x86/include/asm/page_32.h:22,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from kernel/irq/msi.c:12:
   kernel/irq/msi.c: In function 'msi_domain_ops_prepare':
>> kernel/irq/msi.c:591:30: error: invalid application of 'sizeof' to incomplete type 'msi_alloc_info_t' {aka 'struct irq_alloc_info'}
     591 |         memset(arg, 0, sizeof(*arg));
         |                              ^
   arch/x86/include/asm/string_32.h:195:52: note: in definition of macro 'memset'
     195 | #define memset(s, c, count) __builtin_memset(s, c, count)
         |                                                    ^~~~~
   kernel/irq/msi.c: In function 'msi_domain_ops_set_desc':
   kernel/irq/msi.c:598:12: error: invalid use of incomplete typedef 'msi_alloc_info_t' {aka 'struct irq_alloc_info'}
     598 |         arg->desc = desc;
         |            ^~
   kernel/irq/msi.c: In function '__msi_domain_alloc_irqs':
>> kernel/irq/msi.c:858:9: error: variable 'arg' has initializer but incomplete type
     858 |         msi_alloc_info_t arg = { };
         |         ^~~~~~~~~~~~~~~~
>> kernel/irq/msi.c:858:26: error: storage size of 'arg' isn't known
     858 |         msi_alloc_info_t arg = { };
         |                          ^~~
>> kernel/irq/msi.c:858:26: warning: unused variable 'arg' [-Wunused-variable]
   kernel/irq/msi.c: In function 'msi_domain_ops_get_hwirq':
   kernel/irq/msi.c:586:1: error: control reaches end of non-void function [-Werror=return-type]
     586 | }
         | ^
   cc1: some warnings being treated as errors
--
>> drivers/base/platform-msi.c:26:41: error: field 'arg' has incomplete type
      26 |         msi_alloc_info_t                arg;
         |                                         ^~~
   drivers/base/platform-msi.c: In function 'platform_msi_device_domain_alloc':
   drivers/base/platform-msi.c:351:1: error: control reaches end of non-void function [-Werror=return-type]
     351 | }
         | ^
   cc1: some warnings being treated as errors
--
   In file included from include/asm-generic/gpio.h:11,
                    from include/linux/gpio.h:62,
                    from drivers/input/touchscreen/auo-pixcir-ts.c:22:
>> include/linux/gpio/driver.h:31:33: error: field 'msiinfo' has incomplete type
      31 |         msi_alloc_info_t        msiinfo;
         |                                 ^~~~~~~


vim +585 kernel/irq/msi.c

f3cf8bb0d6c3c1 Jiang Liu 2014-11-12  581  
aeeb59657c35da Jiang Liu 2014-11-15  582  static irq_hw_number_t msi_domain_ops_get_hwirq(struct msi_domain_info *info,
aeeb59657c35da Jiang Liu 2014-11-15  583  						msi_alloc_info_t *arg)
aeeb59657c35da Jiang Liu 2014-11-15  584  {
aeeb59657c35da Jiang Liu 2014-11-15 @585  	return arg->hwirq;
aeeb59657c35da Jiang Liu 2014-11-15  586  }
aeeb59657c35da Jiang Liu 2014-11-15  587  
aeeb59657c35da Jiang Liu 2014-11-15  588  static int msi_domain_ops_prepare(struct irq_domain *domain, struct device *dev,
aeeb59657c35da Jiang Liu 2014-11-15  589  				  int nvec, msi_alloc_info_t *arg)
aeeb59657c35da Jiang Liu 2014-11-15  590  {
aeeb59657c35da Jiang Liu 2014-11-15 @591  	memset(arg, 0, sizeof(*arg));
aeeb59657c35da Jiang Liu 2014-11-15  592  	return 0;
aeeb59657c35da Jiang Liu 2014-11-15  593  }
aeeb59657c35da Jiang Liu 2014-11-15  594  

:::::: The code at line 585 was first introduced by commit
:::::: aeeb59657c35da64068336c20068da237f41ab76 genirq: Provide default callbacks for msi_domain_ops

:::::: TO: Jiang Liu <jiang.liu@linux.intel.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
