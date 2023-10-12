Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51821F19B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 10:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PADmRnHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697108397; x=1728644397;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=16FKabPS+ZCRDgH5ddQe899/17W7sUD7fX4mnvQQVLU=;
  b=PADmRnHSIgNAaDWYGRtZv7+YAc++Snl5+xXc2SLbOFK3AQq5jCI4tDhT
   6RLD6mXHm7b8FXydA/892l8b0cEUK1xS1Y8ElXoQlBCTTClVz1wkrprC2
   NkkiPADdcmaIdJsEYRoLalnoAvRcanN8zPh5N/rLdHMUr9COp2U33j48E
   9ZGy1n5c4piSLEQMFxxSCCrAm7hnmXtGHeZUqjnGTqL6u+2EGiEOQJyy8
   ziDJbOhljvZT+CcGIajOgWGWBe9GlrkbW0WD9J0JytYjmVM/LoQwS99CY
   5/Zpu462Id2SOxchAEwyVWSTYPGLmQqqEc4tTYhDmGKK9yMGI2QSe4+IG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="449079677"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="449079677"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 03:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="824557476"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="824557476"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2023 03:59:46 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqtPs-0003OB-08;
	Thu, 12 Oct 2023 10:59:44 +0000
Date: Thu, 12 Oct 2023 18:59:01 +0800
From: kernel test robot <lkp@intel.com>
To: Lu Yao <yaolu@kylinos.cn>, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	rdunlap@infradead.org
Cc: oe-kbuild-all@lists.linux.dev, hpa@zytor.com,
	linux-kernel@vger.kernel.org, Lu Yao <yaolu@kylinos.cn>
Subject: Re: [PATCH v2] x86/msi: Fix compile error caused by GENERIC_MSI_IRQ
 and X86_LOCAL_APIC
Message-ID: <202310121805.SVZD3j7K-lkp@intel.com>
References: <20231011055749.98840-1-yaolu@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011055749.98840-1-yaolu@kylinos.cn>

Hi Lu,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/master]
[also build test ERROR on tip/x86/core tip/auto-latest linus/master v6.6-rc5 next-20231012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lu-Yao/x86-msi-Fix-compile-error-caused-by-GENERIC_MSI_IRQ-and-X86_LOCAL_APIC/20231011-135941
base:   tip/master
patch link:    https://lore.kernel.org/r/20231011055749.98840-1-yaolu%40kylinos.cn
patch subject: [PATCH v2] x86/msi: Fix compile error caused by GENERIC_MSI_IRQ and X86_LOCAL_APIC
config: x86_64-buildonly-randconfig-006-20231012 (https://download.01.org/0day-ci/archive/20231012/202310121805.SVZD3j7K-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310121805.SVZD3j7K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121805.SVZD3j7K-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/hpet.c:509:22: error: 'msi_domain_set_affinity' undeclared here (not in a function); did you mean 'irq_can_set_affinity'?
     509 |  .irq_set_affinity = msi_domain_set_affinity,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
         |                      irq_can_set_affinity
   arch/x86/kernel/hpet.c:516:12: warning: 'struct msi_domain_info' declared inside parameter list will not be visible outside of this definition or declaration
     516 |     struct msi_domain_info *info, unsigned int virq,
         |            ^~~~~~~~~~~~~~~
   arch/x86/kernel/hpet.c: In function 'hpet_msi_init':
>> arch/x86/kernel/hpet.c:520:52: error: dereferencing pointer to incomplete type 'struct msi_domain_info'
     520 |  irq_domain_set_info(domain, virq, arg->hwirq, info->chip, NULL,
         |                                                    ^~
   arch/x86/kernel/hpet.c: At top level:
   arch/x86/kernel/hpet.c:527:13: warning: 'struct msi_domain_info' declared inside parameter list will not be visible outside of this definition or declaration
     527 |      struct msi_domain_info *info, unsigned int virq)
         |             ^~~~~~~~~~~~~~~
   arch/x86/kernel/hpet.c:532:15: error: variable 'hpet_msi_domain_ops' has initializer but incomplete type
     532 | static struct msi_domain_ops hpet_msi_domain_ops = {
         |               ^~~~~~~~~~~~~~
   arch/x86/kernel/hpet.c:533:3: error: 'struct msi_domain_ops' has no member named 'msi_init'
     533 |  .msi_init = hpet_msi_init,
         |   ^~~~~~~~
   arch/x86/kernel/hpet.c:533:14: warning: excess elements in struct initializer
     533 |  .msi_init = hpet_msi_init,
         |              ^~~~~~~~~~~~~
   arch/x86/kernel/hpet.c:533:14: note: (near initialization for 'hpet_msi_domain_ops')
   arch/x86/kernel/hpet.c:534:3: error: 'struct msi_domain_ops' has no member named 'msi_free'
     534 |  .msi_free = hpet_msi_free,
         |   ^~~~~~~~
   arch/x86/kernel/hpet.c:534:14: warning: excess elements in struct initializer
     534 |  .msi_free = hpet_msi_free,
         |              ^~~~~~~~~~~~~
   arch/x86/kernel/hpet.c:534:14: note: (near initialization for 'hpet_msi_domain_ops')
   arch/x86/kernel/hpet.c:537:15: error: variable 'hpet_msi_domain_info' has initializer but incomplete type
     537 | static struct msi_domain_info hpet_msi_domain_info = {
         |               ^~~~~~~~~~~~~~~
   arch/x86/kernel/hpet.c:538:3: error: 'struct msi_domain_info' has no member named 'ops'
     538 |  .ops  = &hpet_msi_domain_ops,
         |   ^~~
   arch/x86/kernel/hpet.c:538:10: warning: excess elements in struct initializer
     538 |  .ops  = &hpet_msi_domain_ops,
         |          ^
   arch/x86/kernel/hpet.c:538:10: note: (near initialization for 'hpet_msi_domain_info')
   arch/x86/kernel/hpet.c:539:3: error: 'struct msi_domain_info' has no member named 'chip'
     539 |  .chip  = &hpet_msi_controller,
         |   ^~~~
   arch/x86/kernel/hpet.c:539:11: warning: excess elements in struct initializer
     539 |  .chip  = &hpet_msi_controller,
         |           ^
   arch/x86/kernel/hpet.c:539:11: note: (near initialization for 'hpet_msi_domain_info')
   arch/x86/kernel/hpet.c:540:3: error: 'struct msi_domain_info' has no member named 'flags'
     540 |  .flags  = MSI_FLAG_USE_DEF_DOM_OPS,
         |   ^~~~~
   arch/x86/kernel/hpet.c:540:12: error: 'MSI_FLAG_USE_DEF_DOM_OPS' undeclared here (not in a function)
     540 |  .flags  = MSI_FLAG_USE_DEF_DOM_OPS,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/hpet.c:540:12: warning: excess elements in struct initializer
   arch/x86/kernel/hpet.c:540:12: note: (near initialization for 'hpet_msi_domain_info')
   arch/x86/kernel/hpet.c: In function 'hpet_create_irq_domain':
   arch/x86/kernel/hpet.c:553:31: error: dereferencing pointer to incomplete type 'struct msi_domain_info'
     553 |  domain_info = kzalloc(sizeof(*domain_info), GFP_KERNEL);
         |                               ^~~~~~~~~~~~
   arch/x86/kernel/hpet.c:580:6: error: implicit declaration of function 'msi_create_irq_domain'; did you mean 'hpet_create_irq_domain'? [-Werror=implicit-function-declaration]
     580 |  d = msi_create_irq_domain(fn, domain_info, parent);
         |      ^~~~~~~~~~~~~~~~~~~~~
         |      hpet_create_irq_domain
   arch/x86/kernel/hpet.c:580:4: warning: assignment to 'struct irq_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     580 |  d = msi_create_irq_domain(fn, domain_info, parent);
         |    ^
   arch/x86/kernel/hpet.c: In function 'hpet_dev_id':
   arch/x86/kernel/hpet.c:590:33: error: implicit declaration of function 'msi_get_domain_info' [-Werror=implicit-function-declaration]
     590 |  struct msi_domain_info *info = msi_get_domain_info(domain);
         |                                 ^~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/hpet.c:590:33: warning: initialization of 'struct msi_domain_info *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   arch/x86/kernel/hpet.c: At top level:
   arch/x86/kernel/hpet.c:532:30: error: storage size of 'hpet_msi_domain_ops' isn't known
     532 | static struct msi_domain_ops hpet_msi_domain_ops = {
         |                              ^~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/hpet.c:537:31: error: storage size of 'hpet_msi_domain_info' isn't known
     537 | static struct msi_domain_info hpet_msi_domain_info = {
         |                               ^~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/hpet.c: In function 'hpet_dev_id':
   arch/x86/kernel/hpet.c:593:1: error: control reaches end of non-void function [-Werror=return-type]
     593 | }
         | ^
   cc1: some warnings being treated as errors


vim +520 arch/x86/kernel/hpet.c

3d7295eb3003ae David Woodhouse 2020-10-24  503  
3d7295eb3003ae David Woodhouse 2020-10-24  504  static struct irq_chip hpet_msi_controller __ro_after_init = {
3d7295eb3003ae David Woodhouse 2020-10-24  505  	.name = "HPET-MSI",
3d7295eb3003ae David Woodhouse 2020-10-24  506  	.irq_unmask = hpet_msi_unmask,
3d7295eb3003ae David Woodhouse 2020-10-24  507  	.irq_mask = hpet_msi_mask,
3d7295eb3003ae David Woodhouse 2020-10-24  508  	.irq_ack = irq_chip_ack_parent,
3d7295eb3003ae David Woodhouse 2020-10-24 @509  	.irq_set_affinity = msi_domain_set_affinity,
3d7295eb3003ae David Woodhouse 2020-10-24  510  	.irq_retrigger = irq_chip_retrigger_hierarchy,
3d7295eb3003ae David Woodhouse 2020-10-24  511  	.irq_write_msi_msg = hpet_msi_write_msg,
ff363f480e5997 Thomas Gleixner 2021-07-29  512  	.flags = IRQCHIP_SKIP_SET_WAKE | IRQCHIP_AFFINITY_PRE_STARTUP,
3d7295eb3003ae David Woodhouse 2020-10-24  513  };
3d7295eb3003ae David Woodhouse 2020-10-24  514  
3d7295eb3003ae David Woodhouse 2020-10-24  515  static int hpet_msi_init(struct irq_domain *domain,
3d7295eb3003ae David Woodhouse 2020-10-24  516  			 struct msi_domain_info *info, unsigned int virq,
3d7295eb3003ae David Woodhouse 2020-10-24  517  			 irq_hw_number_t hwirq, msi_alloc_info_t *arg)
3d7295eb3003ae David Woodhouse 2020-10-24  518  {
3d7295eb3003ae David Woodhouse 2020-10-24  519  	irq_set_status_flags(virq, IRQ_MOVE_PCNTXT);
3d7295eb3003ae David Woodhouse 2020-10-24 @520  	irq_domain_set_info(domain, virq, arg->hwirq, info->chip, NULL,
3d7295eb3003ae David Woodhouse 2020-10-24  521  			    handle_edge_irq, arg->data, "edge");
3d7295eb3003ae David Woodhouse 2020-10-24  522  
3d7295eb3003ae David Woodhouse 2020-10-24  523  	return 0;
3d7295eb3003ae David Woodhouse 2020-10-24  524  }
3d7295eb3003ae David Woodhouse 2020-10-24  525  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
