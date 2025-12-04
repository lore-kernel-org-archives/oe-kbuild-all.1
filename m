Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5ED1A9FAF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764841502; cv=none; b=FPDGkP0rEelrbCU/0Ca3GrWkNFtK2qmWI03M9MrT2e3mbAdzeInazG2NG0MZ4V5n6otDlNMbmaLUYCK9lVfUetxPyy6iIwVCUkTfDGLPzadWDt8SgenEjH3VlP/P+dhoqAB1qZNs2EV6DeFmSwuvTG/QAA+eu3DtDNQBl7+NMVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764841502; c=relaxed/simple;
	bh=Yj6W+kQaaE0ejzE7+ALcPLtE6ci4OBI7kvV/WpgaU/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oM+QOe7LRzXjIFQ196vqDSGWB1XzjxP8+eMTS+oAQ+YtxfU7uklApTdRdXVeCu6pOEuYaHFdbVWXas3axqmOW4iJuhQ6IjC2MsuqjlOXju9uuDEaWpa7vwN1SLA3aY5GbmFyw7fsr7LmHkfyyftjRXnDMbnR+CJUJROQfN1uDRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BuJlnqnX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BuJlnqnX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764841501; x=1796377501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yj6W+kQaaE0ejzE7+ALcPLtE6ci4OBI7kvV/WpgaU/w=;
  b=BuJlnqnXfX572TFncUOeNEvxA2CwaJbovGGfLIVlrX/90CZtNIiJZiwn
   dKuMhWBTpq5qR5t4WHV3D/xoaNfzXOXQe8xqs17OJAVFvpjQuyIcj897o
   +cAYuQsD4rV7jplG61oXosWd33QTWObUBxa4+F29mMEEp4yZZYo7ZPiaz
   4tB3sWCIyQmRqfZzIZZY0H19Bq3knfsosQjFTY9qiWC880OGQWukT3GMM
   O+D1FqOzDzmOCyV1RbJRTvMDzrB1I4rU4LUMPiK1SUcoQErnvEx8We3VC
   RVEdc45oQB33kq34bcSYx26lS8KD71g/qIKHk6cMeGJC0XqGLkwubKRe7
   w==;
X-CSE-ConnectionGUID: OwjUT8ETQyaCCIferiiVOw==
X-CSE-MsgGUID: CNvLm2sYSGKSCdg+7oPksg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="89502270"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="89502270"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 01:45:00 -0800
X-CSE-ConnectionGUID: 7p1e6zoeQLObl5B91agWVA==
X-CSE-MsgGUID: ndHARpwsQK2IVjbN68e0zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="194971989"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Dec 2025 01:44:59 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR5tQ-00000000Ddl-3OMH;
	Thu, 04 Dec 2025 09:44:56 +0000
Date: Thu, 4 Dec 2025 17:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v15 04/16] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <202512041719.l1lUvQ7n-lkp@intel.com>
References: <20251202182720.125884-5-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202182720.125884-5-lyude@redhat.com>

Hi Lyude,

kernel test robot noticed the following build errors:

[auto build test ERROR on 54e3eae855629702c566bd2e130d9f40e7f35bde]

url:    https://github.com/intel-lab-lkp/linux/commits/Lyude-Paul/preempt-Introduce-HARDIRQ_DISABLE_BITS/20251203-023616
base:   54e3eae855629702c566bd2e130d9f40e7f35bde
patch link:    https://lore.kernel.org/r/20251202182720.125884-5-lyude%40redhat.com
patch subject: [PATCH v15 04/16] irq & spin_lock: Add counted interrupt disabling/enabling
config: openrisc-randconfig-r052-20251204 (https://download.01.org/0day-ci/archive/20251204/202512041719.l1lUvQ7n-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512041719.l1lUvQ7n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512041719.l1lUvQ7n-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from lib/test_bitops.c:10:
>> arch/openrisc/include/asm/smp.h:21:59: error: 'struct cpumask' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      21 | extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
         |                                                           ^~~~~~~
   arch/openrisc/include/asm/smp.h:23:54: error: 'struct cpumask' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      23 | extern void set_smp_cross_call(void (*)(const struct cpumask *, unsigned int));
         |                                                      ^~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/openrisc/include/asm/pgalloc.h:20,
                    from arch/openrisc/include/asm/io.h:18,
                    from include/linux/io.h:12,
                    from drivers/irqchip/irq-ompic.c:61:
   arch/openrisc/include/asm/smp.h:21:59: warning: 'struct cpumask' declared inside parameter list will not be visible outside of this definition or declaration
      21 | extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
         |                                                           ^~~~~~~
   arch/openrisc/include/asm/smp.h:23:54: warning: 'struct cpumask' declared inside parameter list will not be visible outside of this definition or declaration
      23 | extern void set_smp_cross_call(void (*)(const struct cpumask *, unsigned int));
         |                                                      ^~~~~~~
   drivers/irqchip/irq-ompic.c: In function 'ompic_of_init':
>> drivers/irqchip/irq-ompic.c:191:28: error: passing argument 1 of 'set_smp_cross_call' from incompatible pointer type [-Werror=incompatible-pointer-types]
     191 |         set_smp_cross_call(ompic_raise_softirq);
         |                            ^~~~~~~~~~~~~~~~~~~
         |                            |
         |                            void (*)(const struct cpumask *, unsigned int)
   arch/openrisc/include/asm/smp.h:23:32: note: expected 'void (*)(const struct cpumask *, unsigned int)' but argument is of type 'void (*)(const struct cpumask *, unsigned int)'
      23 | extern void set_smp_cross_call(void (*)(const struct cpumask *, unsigned int));
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +21 arch/openrisc/include/asm/smp.h

8e6d08e0a15e7d4 Stefan Kristiansson 2014-05-11  19  
8e6d08e0a15e7d4 Stefan Kristiansson 2014-05-11  20  extern void arch_send_call_function_single_ipi(int cpu);
8e6d08e0a15e7d4 Stefan Kristiansson 2014-05-11 @21  extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
8e6d08e0a15e7d4 Stefan Kristiansson 2014-05-11  22  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
