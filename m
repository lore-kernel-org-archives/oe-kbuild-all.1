Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB9D79F8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 21:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675113384; x=1706649384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6lV+0VQuK4AnberTtgI/9bOFaOjVMk/Bts0ZZN74nDc=;
  b=FKaC5H2YUZm243RM9yrQwbHuJkM9k0g87Hn/Z9oJtwO52xyEqpisS67R
   OEAfDDo3DNNhOxP+WHkD5DflY1f+MscFAntyjxzWYN3uZFrtVpEbLSHxV
   Htb1Z/fZj3fAb1MeCLW20kJbtmSLosUudBoQr5drCIma5jvevwxZrYIoy
   Pk1+7HFkJ3Rcs7xm2RW8iZC3AkyDwptwEaIJd7o/8ddxEAkKwlULNLfAP
   8HNpFAyDeH7YNLYF8tSXnueSc+U5EKnuh3XEHmM3j3SGGGQAOOv0zDyB2
   iW0LP96R4TAOBW9DlSwDsxfmpkY5UqxpnuwDF7MBA2LfHecUJTFHocVJY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="329788102"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="329788102"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 13:16:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="732843709"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="732843709"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Jan 2023 13:16:20 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMbVk-0003uU-07;
	Mon, 30 Jan 2023 21:16:20 +0000
Date: Tue, 31 Jan 2023 05:15:56 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: arch/x86/kernel/hpet.c:598:31: warning: unused variable 'info'
Message-ID: <202301310530.mBq1xndE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Frank,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d796c50f84ca79f1722bb131799e5a5710c4700
commit: 70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e irqchip: Add IMX MU MSI controller driver
date:   4 months ago
config: i386-buildonly-randconfig-r002-20230130 (https://download.01.org/0day-ci/archive/20230131/202301310530.mBq1xndE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/ drivers/base/ drivers/of/ kernel/irq/

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

3d7295eb3003aea David Woodhouse 2020-10-24  594  
3d7295eb3003aea David Woodhouse 2020-10-24  595  static int hpet_assign_irq(struct irq_domain *domain, struct hpet_channel *hc,
3d7295eb3003aea David Woodhouse 2020-10-24  596  			   int dev_num)
3d7295eb3003aea David Woodhouse 2020-10-24  597  {
3d7295eb3003aea David Woodhouse 2020-10-24 @598  	struct irq_alloc_info info;
3d7295eb3003aea David Woodhouse 2020-10-24  599  
3d7295eb3003aea David Woodhouse 2020-10-24  600  	init_irq_alloc_info(&info, NULL);
3d7295eb3003aea David Woodhouse 2020-10-24  601  	info.type = X86_IRQ_ALLOC_TYPE_HPET;
3d7295eb3003aea David Woodhouse 2020-10-24  602  	info.data = hc;
3d7295eb3003aea David Woodhouse 2020-10-24  603  	info.devid = hpet_dev_id(domain);
3d7295eb3003aea David Woodhouse 2020-10-24  604  	info.hwirq = dev_num;
3d7295eb3003aea David Woodhouse 2020-10-24  605  
3d7295eb3003aea David Woodhouse 2020-10-24  606  	return irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, &info);
3d7295eb3003aea David Woodhouse 2020-10-24  607  }
3d7295eb3003aea David Woodhouse 2020-10-24  608  

:::::: The code at line 598 was first introduced by commit
:::::: 3d7295eb3003aea9f89de35304b3a88ae4d5036b x86/hpet: Move MSI support into hpet.c

:::::: TO: David Woodhouse <dwmw@amazon.co.uk>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
