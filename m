Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84D52115
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jan 2023 21:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674423702; x=1705959702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=32yLwhOfKDtXYB819aV5PhHvCmEEsPI8e8+DzSG5Igk=;
  b=EMo6Yh0q1vvUQjtJh+KDTcsUIvAeKorRVUrEw4yBnoU8B5mJsGzYXeoh
   wsWudvqBGbE9xnAm5xALzFvrVOv3MDOGO6/Khm9c3JB3tQgo2XIPUtNKk
   edOz52n3NKO7xNSzCeNcrTGDOPxRumZGDQ3zurwU2kLi815fupMwpGRrB
   LSf9qN4iCPK8sEwpOP/s0u2gkKIkQH89zGYg3y2lO2YTYuSfVglLSyiiX
   AYLBFegYGHSyUN/2nR6dTaNPAOL752VlHIWdD+AZU0Yx29qDkSuSXpF4H
   UkesnPWxzTc0PIymSwUegz5C3MIQcbMZ7XvPVGoy31XE2m3rodKZPrA5N
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="325980163"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="325980163"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 13:41:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="750127488"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="750127488"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Jan 2023 13:41:40 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJi5r-0005G8-2m;
	Sun, 22 Jan 2023 21:41:39 +0000
Date: Mon, 23 Jan 2023 05:41:04 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: arch/x86/kernel/hpet.c:598:31: warning: unused variable 'info'
Message-ID: <202301230542.TIuCA8hz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2475bf0250dee99b477e0c56d7dc9d7ac3f04117
commit: 70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e irqchip: Add IMX MU MSI controller driver
date:   4 months ago
config: i386-buildonly-randconfig-r002-20230123 (https://download.01.org/0day-ci/archive/20230123/202301230542.TIuCA8hz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/ drivers/base/ drivers/video/backlight/ kernel/irq/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/x86/kernel/hpet.c: In function 'hpet_msi_init':
   arch/x86/kernel/hpet.c:520:46: error: invalid use of incomplete typedef 'msi_alloc_info_t' {aka 'struct irq_alloc_info'}
     520 |         irq_domain_set_info(domain, virq, arg->hwirq, info->chip, NULL,
         |                                              ^~
   arch/x86/kernel/hpet.c:521:49: error: invalid use of incomplete typedef 'msi_alloc_info_t' {aka 'struct irq_alloc_info'}
     521 |                             handle_edge_irq, arg->data, "edge");
         |                                                 ^~
   arch/x86/kernel/hpet.c: In function 'hpet_create_irq_domain':
   arch/x86/kernel/hpet.c:550:13: error: 'x86_vector_domain' undeclared (first use in this function)
     550 |         if (x86_vector_domain == NULL)
         |             ^~~~~~~~~~~~~~~~~
   arch/x86/kernel/hpet.c:550:13: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kernel/hpet.c: In function 'hpet_assign_irq':
   arch/x86/kernel/hpet.c:598:31: error: storage size of 'info' isn't known
     598 |         struct irq_alloc_info info;
         |                               ^~~~
   arch/x86/kernel/hpet.c:600:9: error: implicit declaration of function 'init_irq_alloc_info' [-Werror=implicit-function-declaration]
     600 |         init_irq_alloc_info(&info, NULL);
         |         ^~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/hpet.c:601:21: error: 'X86_IRQ_ALLOC_TYPE_HPET' undeclared (first use in this function)
     601 |         info.type = X86_IRQ_ALLOC_TYPE_HPET;
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/hpet.c:598:31: warning: unused variable 'info' [-Wunused-variable]
     598 |         struct irq_alloc_info info;
         |                               ^~~~
   arch/x86/kernel/hpet.c:607:1: error: control reaches end of non-void function [-Werror=return-type]
     607 | }
         | ^
   cc1: some warnings being treated as errors
--
   kernel/irq/msi.c: In function 'msi_domain_ops_get_hwirq':
   kernel/irq/msi.c:585:19: error: invalid use of incomplete typedef 'msi_alloc_info_t' {aka 'struct irq_alloc_info'}
     585 |         return arg->hwirq;
         |                   ^~
   In file included from include/linux/string.h:253,
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
   kernel/irq/msi.c:591:30: error: invalid application of 'sizeof' to incomplete type 'msi_alloc_info_t' {aka 'struct irq_alloc_info'}
     591 |         memset(arg, 0, sizeof(*arg));
         |                              ^
   include/linux/fortify-string.h:279:42: note: in definition of macro '__fortify_memset_chk'
     279 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   kernel/irq/msi.c:591:9: note: in expansion of macro 'memset'
     591 |         memset(arg, 0, sizeof(*arg));
         |         ^~~~~~
   kernel/irq/msi.c: In function 'msi_domain_ops_set_desc':
   kernel/irq/msi.c:598:12: error: invalid use of incomplete typedef 'msi_alloc_info_t' {aka 'struct irq_alloc_info'}
     598 |         arg->desc = desc;
         |            ^~
   kernel/irq/msi.c: In function '__msi_domain_alloc_irqs':
   kernel/irq/msi.c:858:9: error: variable 'arg' has initializer but incomplete type
     858 |         msi_alloc_info_t arg = { };
         |         ^~~~~~~~~~~~~~~~
   kernel/irq/msi.c:858:26: error: storage size of 'arg' isn't known
     858 |         msi_alloc_info_t arg = { };
         |                          ^~~
>> kernel/irq/msi.c:858:26: warning: unused variable 'arg' [-Wunused-variable]
   kernel/irq/msi.c: In function 'msi_domain_ops_get_hwirq':
   kernel/irq/msi.c:586:1: error: control reaches end of non-void function [-Werror=return-type]
     586 | }
         | ^
   cc1: some warnings being treated as errors


vim +/info +598 arch/x86/kernel/hpet.c

3d7295eb3003ae David Woodhouse 2020-10-24  594  
3d7295eb3003ae David Woodhouse 2020-10-24  595  static int hpet_assign_irq(struct irq_domain *domain, struct hpet_channel *hc,
3d7295eb3003ae David Woodhouse 2020-10-24  596  			   int dev_num)
3d7295eb3003ae David Woodhouse 2020-10-24  597  {
3d7295eb3003ae David Woodhouse 2020-10-24 @598  	struct irq_alloc_info info;
3d7295eb3003ae David Woodhouse 2020-10-24  599  
3d7295eb3003ae David Woodhouse 2020-10-24  600  	init_irq_alloc_info(&info, NULL);
3d7295eb3003ae David Woodhouse 2020-10-24  601  	info.type = X86_IRQ_ALLOC_TYPE_HPET;
3d7295eb3003ae David Woodhouse 2020-10-24  602  	info.data = hc;
3d7295eb3003ae David Woodhouse 2020-10-24  603  	info.devid = hpet_dev_id(domain);
3d7295eb3003ae David Woodhouse 2020-10-24  604  	info.hwirq = dev_num;
3d7295eb3003ae David Woodhouse 2020-10-24  605  
3d7295eb3003ae David Woodhouse 2020-10-24  606  	return irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, &info);
3d7295eb3003ae David Woodhouse 2020-10-24  607  }
3d7295eb3003ae David Woodhouse 2020-10-24  608  

:::::: The code at line 598 was first introduced by commit
:::::: 3d7295eb3003aea9f89de35304b3a88ae4d5036b x86/hpet: Move MSI support into hpet.c

:::::: TO: David Woodhouse <dwmw@amazon.co.uk>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
